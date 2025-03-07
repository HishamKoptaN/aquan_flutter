import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../../core/di/dependency_injection.dart';
import '../../../../../core/widgets/custom_circular_progress.dart';
import '../../../../../core/widgets/custom_pin_code_widget.dart';
import '../../../../../core/widgets/custom_text_button_widget.dart';
import '../../../../../core/widgets/custom_text_widget.dart';
import '../../../../../core/widgets/toast_notifier.dart';
import '../../../../layouts/app_layout.dart';
import '../../data/models/send_otp_req_body_model.dart';
import '../../data/models/verify_otp_req_body_model.dart';
import '../bloc/reset_pass_bloc.dart';
import '../bloc/reset_pass_event.dart';
import '../bloc/reset_pass_state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'reset_password_view.dart';

class VerifyOtpView extends StatefulWidget {
  VerifyOtpView({
    super.key,
    required this.sendOtpReqBodyModel,
  });
  SendOtpReqBodyModel? sendOtpReqBodyModel;
  @override
  State<VerifyOtpView> createState() => _VerifyOtpViewState();
}

class _VerifyOtpViewState extends State<VerifyOtpView> {
  final formKey = GlobalKey<FormState>();
  int _timerSeconds = 0;
  Timer? _timer;
  StreamController<ErrorAnimationType>? errorController;
  TextEditingController textEditingController = TextEditingController();
  SendOtpReqBodyModel sendOtpReqBodyModel = const SendOtpReqBodyModel();
  VerifyOtpReqBodyModel verifyOtpReqBodyModel = const VerifyOtpReqBodyModel();

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
        _timerSeconds = 5;
      },
    );
    _startTimer();
  }

  @override
  void initState() {
    _startEmailVerification();
    super.initState();
  }

  @override
  Widget build(context) {
    late final AppLocalizations t = AppLocalizations.of(context)!;
    return AppLayout(
      route: "",
      showAppBar: false,
      body: BlocProvider(
        create: (context) => ResetPassBloc(
          sendOtpUseCase: getIt(),
          verifyOtpUseCase: getIt(),
          resetPasswordUseCase: getIt(),
        ),
        child: BlocConsumer<ResetPassBloc, ResetPassState>(
          listener: (context, state) async {
            await state.whenOrNull(
              success: () async {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResetPasswordView(
                      otp: verifyOtpReqBodyModel.otp ?? '',
                    ),
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
              failure: (error) async {
                ToastNotifier().showError(
                  context: context,
                  message: t.error,
                );
              },
            );
          },
          builder: (context, state) {
            return Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Gap(
                    10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    Icons.security,
                    color: Colors.black,
                    size: 75.sp,
                  ),
                  Gap(
                    25.h,
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
                                text: t.resetPassword,
                                fontSize: 24.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              Gap(
                                15.h,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CustomText(
                                  text: t.enter_6_digits,
                                  fontSize: 16.sp,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          Gap(
                            15.h,
                          ),
                          CustomPinCodeWidget(
                            context: context,
                            controller: textEditingController,
                            onChanged: (v) {
                              verifyOtpReqBodyModel =
                                  verifyOtpReqBodyModel.copyWith(
                                otp: v,
                              );
                            },
                          ),
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
                          Gap(
                            10.h,
                          ),
                          TextButton(
                            onPressed: () {
                              if (_timerSeconds == 0) {
                                sendOtpReqBodyModel =
                                    sendOtpReqBodyModel.copyWith(
                                        email:
                                            widget.sendOtpReqBodyModel?.email ??
                                                '');

                                context.read<ResetPassBloc>().add(
                                      ResetPassEvent.sendOtp(
                                        sendOtpReqBodyModel:
                                            sendOtpReqBodyModel,
                                      ),
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
                              verifyOtpReqBodyModel =
                                  verifyOtpReqBodyModel.copyWith(
                                email: sendOtpReqBodyModel.email,
                              );
                              context.read<ResetPassBloc>().add(
                                    ResetPassEvent.verifyOtp(
                                      verifyOtpReqBodyModel:
                                          verifyOtpReqBodyModel,
                                    ),
                                  );
                            },
                            widget: state.maybeWhen(
                              orElse: () {
                                return CustomText(
                                  text: t.submit,
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
