import 'dart:async';
import 'package:aquan/features/Layouts/app_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../core/di/dependency_injection.dart';
import '../../../../../core/widgets/custom_circular_progress.dart';
import '../../../../../core/widgets/custom_dialog.dart';
import '../../../../../core/widgets/custom_icon_button_widget.dart';
import '../../../../../core/widgets/custom_text_button_widget.dart';
import '../../../../../core/widgets/custom_text_widget.dart';
import '../../../../../core/widgets/toast_notifier.dart';
import '../../data/models/send_otp_verify_email_req_body_model.dart';
import '../../data/models/verify_email_otp_req_body_model.dart';
import '../bloc/email_verify_bloc.dart';
import '../bloc/email_verify_event.dart';
import '../bloc/email_verify_state.dart';
import 'verify_email_otp_view.dart';

class SendEmailOtpView extends StatefulWidget {
  const SendEmailOtpView({
    super.key,
  });

  @override
  State<SendEmailOtpView> createState() => _SendEmailOtpViewState();
}

class _SendEmailOtpViewState extends State<SendEmailOtpView> {
  TextEditingController textEditingController = TextEditingController();
  StreamController<ErrorAnimationType>? errorController;
  SendEmailOtpReqBodyModel sendEmailOtpReqBodyModel =
      const SendEmailOtpReqBodyModel();
  VerifyEmailOtpReqBodyModel verifyEmailOtpReqBodyModel =
      const VerifyEmailOtpReqBodyModel();

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
              codeSent: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const VerifyEmailOtp(),
                  ),
                  (route) => false,
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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
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
                      CustomIconButtonWidget(
                        buttonColor: Colors.black,
                        onPressed: () async {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return const CustomDialog();
                            },
                          );
                        },
                        widget: FaIcon(
                          FontAwesomeIcons.arrowRightFromBracket,
                          color: Colors.black,
                          size: 25.sp,
                        ),
                      ),
                    ],
                  ),
                  Gap(
                    20.h,
                  ),
                  Icon(
                    Icons.cancel,
                    color: Colors.black,
                    size: 75.sp,
                  ),
                  CustomText(
                    text: t.not_verified,
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
                          Gap(
                            50.h,
                          ),
                          Padding(
                            padding: EdgeInsets.all(
                              8.sp,
                            ),
                            child: CustomText(
                              text: t.email_not_verify,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              maxLines: 5,
                            ),
                          ),
                          Gap(
                            15.h,
                          ),
                          CustomTextButtonWidget(
                            width: 200.w,
                            buttonColor: Colors.black,
                            onPressed: () async {
                              context.read<VerifyEmailBloc>().add(
                                    const VerifyEmailEvent.sendEmailOtp(),
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
