import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../../core/di/dependency_injection.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_circular_progress.dart';
import '../../../../../core/widgets/custom_text_button_widget.dart';
import '../../../../../core/widgets/custom_text_form_password_field.dart';
import '../../../../../core/widgets/custom_text_widget.dart';
import '../../../../../core/widgets/toast_notifier.dart';
import '../../../../navigator_bottom_bar/bottom_navigation_bar_view.dart';
import '../../data/models/reset_pass_req_body.dart';
import '../bloc/reset_pass_bloc.dart';
import '../bloc/reset_pass_event.dart';
import '../bloc/reset_pass_state.dart';
import '../../../../layouts/app_layout.dart';

class ResetPasswordView extends StatefulWidget {
  ResetPasswordView({
    super.key,
    required this.otp,
  });
  String? otp;

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  ResetPassReqBody resetPassReqBody = const ResetPassReqBody();
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
                ToastNotifier().showSuccess(
                  context: context,
                  message: t.passwordChanged,
                );
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NavigateBarView(),
                  ),
                  (route) => false,
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
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
              ),
              alignment: Alignment.center,
              color: Colors.white,
              child: ListView(
                children: [
                  Gap(
                    200.h,
                  ),
                  CustomTextFormPasswordField(
                    labelText: t.password,
                    showTogglePassword: true,
                    onChanged: (v) {
                      resetPassReqBody = resetPassReqBody.copyWith(
                        newPassword: v,
                      );
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return t.required;
                      } else if (value.length < 8) {
                        return t.password_too_short;
                      }
                      return null;
                    },
                  ),
                  Gap(
                    10.h,
                  ),
                  CustomTextFormPasswordField(
                    labelText: t.passwordConfirmation,
                    showTogglePassword: true,
                    onChanged: (v) {
                      resetPassReqBody = resetPassReqBody.copyWith(
                        newPasswordConfirmation: v,
                      );
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return t.required;
                      } else if (value != resetPassReqBody.newPassword) {
                        return t.password_mis_match;
                      }
                      return null;
                    },
                  ),
                  Gap(
                    50.h,
                  ),
                  CustomTextButtonWidget(
                    text: t.login,
                    onPressed: () {
                      state.maybeWhen(
                        loading: () {},
                        orElse: () {
                          resetPassReqBody = resetPassReqBody.copyWith(
                            otp: widget.otp ?? '',
                          );
                          context.read<ResetPassBloc>().add(
                                ResetPassEvent.resetPassword(
                                  resetPassReqBody: resetPassReqBody,
                                ),
                              );
                        },
                      );
                    },
                    widget: state.maybeWhen(
                      loading: () {
                        return const CustomCircularProgress();
                      },
                      orElse: () {
                        return CustomText(
                          text: t.submit,
                          fontSize: 30.sp,
                          color: AppColors.white,
                          maxLines: 1,
                          fontWeight: FontWeight.bold,
                        );
                      },
                    ),
                  ),
                  Gap(
                    10.h,
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
