import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:aquan/features/layouts/app_layout.dart';
import '../../../../../core/di/dependency_injection.dart';
import '../../../../../core/widgets/custom_circular_progress.dart';
import '../../../../../core/widgets/custom_text_button_widget.dart';
import '../../../../../core/widgets/custom_text_widget.dart';
import '../../../../../core/widgets/toast_notifier.dart';
import '../../../../home/home_view.dart';
import '../../data/models/send_otp_verify_email_req_body_model.dart';
import '../../data/models/verify_email_otp_req_body_model.dart';
import '../bloc/email_verify_bloc.dart';
import '../bloc/email_verify_event.dart';
import '../bloc/email_verify_state.dart';

class VerifyEmailOtp extends StatefulWidget {
  const VerifyEmailOtp({
    super.key,
  });

  @override
  State<VerifyEmailOtp> createState() => _VerifyEmailOtpState();
}

class _VerifyEmailOtpState extends State<VerifyEmailOtp> {
  TextEditingController textEditingController = TextEditingController();
  StreamController<ErrorAnimationType>? errorController;
  SendEmailOtpReqBodyModel sendEmailOtpReqBodyModel =
      const SendEmailOtpReqBodyModel();
  VerifyEmailOtpReqBodyModel verifyEmailOtpReqBodyModel =
      const VerifyEmailOtpReqBodyModel();
  int _timerSeconds = 0;
  Timer? _timer;

  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    _startEmailVerification();
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();
    super.dispose();
  }

  void _startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        setState(
          () {
            if (_timerSeconds < 1) {
              timer.cancel();
            } else {
              _timerSeconds--;
            }
          },
        );
      },
    );
  }

  void _startEmailVerification() {
    setState(
      () {
        _timerSeconds = 60;
      },
    );
    _startTimer();
  }

  @override
  Widget build(context) {
    final t = AppLocalizations.of(context)!;
    return AppLayout(
      route: '',
      showAppBar: false,
      body: BlocProvider(
        create: (context) => VerifyEmailBloc(
          sendEmailOtpUseCase: getIt(),
          verifyEmailOtpUseCase: getIt(),
        ),
        child: BlocConsumer<VerifyEmailBloc, VerifyEmailState>(
          listener: (context, state) {
            state.whenOrNull(
              success: (_) {
                ToastNotifier().showSuccess(
                  context: context,
                  message: t.account_verified_done,
                );
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NavigateBarView(),
                  ),
                  (route) => false,
                );
              },
              codeSent: () {
                ToastNotifier().showSuccess(
                  context: context,
                  message: t.code_sent,
                );
              },
              failure: (apiErrorModel) async {
                ToastNotifier().showError(
                  context: context,
                  message: apiErrorModel.error ?? t.error,
                );
              },
            );
          },
          builder: (context, state) {
            return SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/icon/aquan_black_logo.png',
                            height: 50.h,
                            width: 50.w,
                          ),
                          CustomText(
                            text: t.aquan,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Gap(
                    20.h,
                  ),
                  Icon(
                    Icons.verified,
                    color: Colors.black,
                    size: 75.sp,
                  ),
                  CustomText(
                    text: t.verify_email,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.center,
                  ),
                  Gap(
                    50.h,
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(
                            40,
                          ),
                          topLeft: Radius.circular(
                            40,
                          ),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Gap(
                                15.h,
                              ),
                              CustomText(
                                text: t.verify_email,
                                fontSize: 24.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              Gap(
                                15.h,
                              ),
                              CustomText(
                                text: t.enter_6_digits,
                                fontSize: 16.sp,
                                color: Colors.black,
                              ),
                            ],
                          ),
                          Gap(
                            15.h,
                          ),
                          Directionality(
                            textDirection: TextDirection.ltr,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 1,
                                horizontal: 10,
                              ),
                              child: PinCodeTextField(
                                key: formKey,
                                appContext: context,
                                pastedTextStyle: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                                textStyle: const TextStyle(
                                  color: Colors.white,
                                ),
                                length: 6,
                                onEditingComplete: () {},
                                pinTheme: PinTheme(
                                  shape: PinCodeFieldShape.box,
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  ),
                                  fieldHeight: 50.h,
                                  fieldWidth: 50.w,
                                  inactiveColor: Colors.black,
                                  activeFillColor: Colors.black,
                                  activeColor: Colors.black,
                                  selectedColor: Colors.black,
                                  selectedFillColor: Colors.black,
                                  inactiveFillColor: Colors.black,
                                ),
                                hintCharacter: "-",
                                cursorColor: Colors.black,
                                animationDuration:
                                    const Duration(milliseconds: 300),
                                validator: (v) {
                                  if (v!.length < 6) {
                                    return t.required;
                                  } else {
                                    return null;
                                  }
                                },
                                enableActiveFill: true,
                                errorAnimationController: errorController,
                                controller: textEditingController,
                                keyboardType: TextInputType.number,
                                boxShadows: const [
                                  BoxShadow(
                                    offset: Offset(
                                      0,
                                      1,
                                    ),
                                    color: Colors.black,
                                    blurRadius: 10,
                                  )
                                ],
                                blinkWhenObscuring: true,
                                animationType: AnimationType.fade,
                                onCompleted: (v) {
                                  verifyEmailOtpReqBodyModel =
                                      verifyEmailOtpReqBodyModel.copyWith(
                                    otp: v,
                                  );
                                },
                                onChanged: (v) {
                                  verifyEmailOtpReqBodyModel =
                                      verifyEmailOtpReqBodyModel.copyWith(
                                    otp: v,
                                  );
                                },
                                beforeTextPaste: (text) {
                                  debugPrint("Allowing to paste $text");
                                  return true;
                                },
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Flexible(
                                child: TextButton(
                                  child: CustomText(
                                    text: "Clear",
                                    fontSize: 17.5.sp,
                                  ),
                                  onPressed: () {
                                    textEditingController.clear();
                                  },
                                ),
                              ),
                            ],
                          ),
                          Gap(
                            10.h,
                          ),
                          TextButton(
                            onPressed: () {
                              if (_timerSeconds == 0) {
                                context.read<VerifyEmailBloc>().add(
                                      const VerifyEmailEvent.sendEmailOtp(),
                                    );
                                _startEmailVerification();
                              }
                            },
                            child: CustomText(
                              text: _timerSeconds == 0
                                  ? t.send_code_again
                                  : '${t.send_code_after} $_timerSeconds ${t.seconds}',
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp,
                            ),
                          ),
                          Gap(
                            10.h,
                          ),
                          CustomTextButtonWidget(
                            width: 200.w,
                            buttonColor: Colors.black,
                            onPressed: () async {
                              context.read<VerifyEmailBloc>().add(
                                    VerifyEmailEvent.verifyEmailOtp(
                                      verifyEmailOtpReqBodyModel:
                                          verifyEmailOtpReqBodyModel,
                                    ),
                                  );
                            },
                            widget: state.maybeWhen(
                              orElse: () {
                                return CustomText(
                                  text: t.verify,
                                  color: Colors.amberAccent,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Arial",
                                );
                              },
                              loading: () {
                                return const CustomCircularProgress();
                              },
                            ),
                          ),
                          Gap(
                            10.h,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
