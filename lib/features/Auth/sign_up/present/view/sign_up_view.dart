import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import 'package:aquan/core/utils/app_colors.dart';
import 'package:aquan/core/widgets/custom_circular_progress.dart';

import '../../../../../core/di/dependency_injection.dart';
import '../../../../../core/widgets/custom_text_button_widget.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../core/widgets/custom_text_form_password_field.dart';
import '../../../../../core/widgets/custom_text_widget.dart';
import '../../../../../core/widgets/toast_notifier.dart';
import '../../../verify_email/present/view/verify_email_otp_view.dart';
import '../../data/models/sign_up_req_body.dart';
import '../bloc/sign_up_bloc.dart';
import '../bloc/sign_up_event.dart';
import '../bloc/sign_up_state.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({
    super.key,
  });
  @override
  State<SignUpView> createState() => _SignUpViewState();
}

SignUpReqBody signUpReqBody = const SignUpReqBody();

class _SignUpViewState extends State<SignUpView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final String _isoCode = "SD";
  bool isLoading = false;
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final t = AppLocalizations.of(context);
    return BlocProvider<SignUpBloc>(
      create: (context) => getIt<SignUpBloc>(),
      child: BlocConsumer<SignUpBloc, SignUpState>(
        listener: (context, state) {
          state.whenOrNull(
            success: (apiErrorModel) {
              ToastNotifier().showSuccess(
                context: context,
                message: t!.success,
              );
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const VerifyEmailOtp(),
                ),
                (route) => false,
              );
            },
            error: (apiErrorModel) async {
              ToastNotifier().showError(
                context: context,
                message: apiErrorModel.error ?? t!.error,
              );
            },
          );
        },
        builder: (context, state) {
          return Scaffold(
            key: _scaffoldKey,
            appBar: AppBar(
              backgroundColor: AppColors.third,
              title: const Text(
                "AQUAN",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              elevation: 2,
              centerTitle: true,
            ),
            body: Container(
              padding: const EdgeInsets.only(
                bottom: 20,
                left: 20,
                right: 20,
              ),
              alignment: Alignment.center,
              color: Colors.white,
              child: Form(
                key: formKey,
                child: ListView(
                  children: [
                    Gap(
                      20.h,
                    ),
                    CustomText(
                      text: t!.createAccount,
                      fontWeight: FontWeight.bold,
                      color: Colors.amber,
                      fontSize: 30,
                      textAlign: TextAlign.center,
                    ),
                    Gap(
                      30.h,
                    ),
                    CustomTextFormField(
                      onChanged: (v) {
                        signUpReqBody = signUpReqBody.copyWith(
                          firstName: v,
                        );
                      },
                      labelText: t.first_name,
                      suffixIcon: const Icon(
                        FontAwesomeIcons.user,
                      ),
                    ),
                    Gap(
                      30.h,
                    ),
                    CustomTextFormField(
                      onChanged: (v) {
                        signUpReqBody = signUpReqBody.copyWith(
                          lastName: v,
                        );
                      },
                      labelText: t.last_name,
                      suffixIcon: const Icon(
                        FontAwesomeIcons.user,
                      ),
                    ),
                    Gap(
                      30.h,
                    ),
                    Container(
                      height: 70.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.grey[200],
                      ),
                      child: InternationalPhoneNumberInput(
                        onInputChanged: (PhoneNumber v) {
                          signUpReqBody = signUpReqBody.copyWith(
                            phone: v.phoneNumber,
                          );
                          signUpReqBody = signUpReqBody.copyWith(
                            countryCode: v.isoCode!,
                          );
                        },
                        selectorConfig: const SelectorConfig(
                          selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                          useBottomSheetSafeArea: true,
                          trailingSpace: false,
                        ),
                        ignoreBlank: false,
                        autoValidateMode: AutovalidateMode.disabled,
                        selectorTextStyle: const TextStyle(
                          color: Colors.black,
                        ),
                        initialValue: PhoneNumber(
                          isoCode: signUpReqBody.countryCode ?? _isoCode,
                          dialCode: signUpReqBody.countryCode ?? _isoCode,
                        ),
                        hintText: t.phoneNumber,
                        formatInput: true,
                        keyboardType: const TextInputType.numberWithOptions(
                          signed: true,
                          decimal: true,
                        ),
                        inputDecoration: const InputDecoration(
                          border: InputBorder.none, // إزالة الخط السفلي
                          enabledBorder: InputBorder.none,
                          // إزالة الخط السفلي في الوضع العادي
                          focusedBorder: InputBorder
                              .none, // إزالة الخط السفلي في وضع التركيز
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ), // نمط النص التوضيحي
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 20,
                          ),
                        ),
                      ),
                    ),
                    Gap(
                      30.h,
                    ),
                    CustomTextFormField(
                      labelText: t.e_mail,
                      onChanged: (v) {
                        signUpReqBody = signUpReqBody.copyWith(
                          email: v,
                        );
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return t.required;
                        } else if (!RegExp(
                                r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value)) {
                          return t.invalid_email;
                        }
                        return null;
                      },
                      suffixIcon: const Icon(
                        Icons.email,
                      ),
                    ),
                    Gap(
                      30.h,
                    ),
                    CustomTextFormPasswordField(
                      labelText: t.password,
                      showTogglePassword: true,
                      onChanged: (v) {
                        signUpReqBody = signUpReqBody.copyWith(
                          password: v,
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
                        signUpReqBody = signUpReqBody.copyWith(
                          passwordConfirmation: v,
                        );
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return t.required;
                        } else if (value != signUpReqBody.password) {
                          return t.password_mis_match;
                        }
                        return null;
                      },
                    ),
                    Gap(
                      30.h,
                    ),
                    CustomTextButtonWidget(
                      onPressed: () async {
                        if (!formKey.currentState!.validate()) {
                          return;
                        } else {
                          context.read<SignUpBloc>().add(
                                SignUpEvent.signUp(
                                  signUpReqBody: signUpReqBody,
                                ),
                              );
                        }
                      },
                      widget: state.maybeWhen(
                        orElse: () {
                          return CustomText(
                            text: t.signUp,
                            color: Colors.white,
                            fontFamily: "Arial",
                            fontSize: 20.sp,
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
          );
        },
      ),
    );
  }
}
