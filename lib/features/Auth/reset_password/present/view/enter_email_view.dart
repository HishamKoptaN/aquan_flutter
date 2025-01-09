import 'package:aquan/features/layouts/app_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../../core/di/dependency_injection.dart';
import '../../../../../core/widgets/custom_circular_progress.dart';
import '../../../../../core/widgets/custom_text_button_widget.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../core/widgets/custom_text_widget.dart';
import '../../../../../core/widgets/toast_notifier.dart';
import '../../data/models/send_otp_req_body_model.dart';
import '../bloc/reset_pass_bloc.dart';
import '../bloc/reset_pass_event.dart';
import '../bloc/reset_pass_state.dart';
import 'verify_pass_otp_view.dart';

class EnterEmailView extends StatefulWidget {
  const EnterEmailView({
    super.key,
  });
  @override
  State<EnterEmailView> createState() => _EnterEmailViewState();
}

class _EnterEmailViewState extends State<EnterEmailView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  SendOtpReqBodyModel sendOtpReqBodyModel = const SendOtpReqBodyModel();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final t = AppLocalizations.of(context);
    return AppLayout(
      showAppBar: true,
      body: BlocProvider<ResetPassBloc>(
        create: (context) => ResetPassBloc(
          sendOtpUseCase: getIt(),
          verifyOtpUseCase: getIt(),
          resetPasswordUseCase: getIt(),
        ),
        child: BlocConsumer<ResetPassBloc, ResetPassState>(
          listener: (context, state) async {
            await state.whenOrNull(
              codeSent: () async {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VerifyOtpView(
                      sendOtpReqBodyModel: sendOtpReqBodyModel,
                    ),
                  ),
                  (route) => false,
                );
              },
              failure: (error) async {
                ToastNotifier().showError(
                  context: context,
                  message: error.error ?? t!.error,
                );
              },
            );
          },
          builder: (context, state) {
            return Center(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomText(
                      text: t!.enter_your_email,
                      textAlign: TextAlign.center,
                      color: Colors.amber,
                      fontFamily: "Arial",
                      fontSize: 25.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    Gap(
                      10.h,
                    ),
                    CustomTextFormField(
                      onChanged: (v) {
                        sendOtpReqBodyModel = sendOtpReqBodyModel.copyWith(
                          email: v!,
                        );
                        _formKey.currentState!.validate();
                      },
                      labelText: t.e_mail,
                      suffixIcon: const Icon(
                        Icons.email,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return t.required;
                        } else if (!RegExp(
                          r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                        ).hasMatch(value)) {
                          return t.invalid_email;
                        }
                        return null;
                      },
                    ),
                    Gap(
                      20.h,
                    ),
                    CustomTextButtonWidget(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<ResetPassBloc>().add(
                                ResetPassEvent.sendOtp(
                                  sendOtpReqBodyModel: sendOtpReqBodyModel,
                                ),
                              );
                        }
                      },
                      widget: state.maybeWhen(
                        loading: () {
                          return const CustomCircularProgress();
                        },
                        orElse: () {
                          return CustomText(
                            text: t.resetPassword,
                            color: Colors.white,
                            fontFamily: "Arial",
                          );
                        },
                      ),
                    ),
                    Gap(
                      10.h,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
