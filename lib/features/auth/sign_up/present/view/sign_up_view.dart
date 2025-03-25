import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import '../../../../../all_imports.dart';
import '../../../../../core/helpers/validate_password.dart';
import '../../../../../core/validator.dart';
import '../../../../../core/widgets/terms_and_privacy_view.dart';
import '../../../../main/present/view/main_view.dart';
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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final String _isoCode = "SD";
  bool isLoading = false;
  @override
  void dispose() {
    super.dispose();
  }

  final Validator validator = Validator();
  bool validated = false;
  bool isAcceptedTermsAndConditions = false;

  void _register() {
    if (!isAcceptedTermsAndConditions) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("يجب الموافقة على الشروط وسياسة الخصوصية")),
      );
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    return BlocProvider<SignUpBloc>(
      create: (context) => getIt<SignUpBloc>(),
      child: BlocConsumer<SignUpBloc, SignUpState>(
        listener: (context, state) {
          state.whenOrNull(
            success: (apiErrorModel) {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => const MainView(
                    ckeckEmailVeification: true,
                  ),
                ),
                (route) => false,
              );
            },
            failure: (
              apiErrorModel,
            ) async {
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
                key: _formKey,
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
                        if (validated) {
                          _formKey.currentState!.validate();
                        }
                      },
                      labelText: t.first_name,
                      suffixIcon: const Icon(
                        FontAwesomeIcons.user,
                      ),
                    ),
                    Gap(
                      15.h,
                    ),
                    CustomTextFormField(
                      onChanged: (v) {
                        signUpReqBody = signUpReqBody.copyWith(
                          lastName: v,
                        );
                        if (validated) {
                          _formKey.currentState!.validate();
                        }
                      },
                      labelText: t.last_name,
                      suffixIcon: const Icon(
                        FontAwesomeIcons.user,
                      ),
                    ),
                    Gap(
                      15.h,
                    ),
                    SizedBox(
                      height: 70.h,
                      width: double.infinity,
                      child: InternationalPhoneNumberInput(
                        onInputChanged: (PhoneNumber v) {
                          signUpReqBody = signUpReqBody.copyWith(
                            phone: v.phoneNumber,
                          );
                          signUpReqBody = signUpReqBody.copyWith(
                            countryCode: v.isoCode!,
                          );
                          if (validated) {
                            _formKey.currentState!.validate();
                          }
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
                        validator: (value) => Validator.validatePhoneNum(
                          value: value,
                          t: t,
                        ),
                        inputDecoration: InputDecoration(
                          border: InputBorder.none,
                          filled: true,
                          fillColor: Colors.grey[200],
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.blue,
                              width: 1.5,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.red,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.red,
                              width: 1.5,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    Gap(
                      15.h,
                    ),
                    CustomTextFormField(
                      labelText: t.e_mail,
                      onChanged: (v) {
                        signUpReqBody = signUpReqBody.copyWith(
                          email: v,
                        );
                        if (validated) {
                          _formKey.currentState!.validate();
                        }
                      },
                      validator: (v) => Validator.emailValidator(
                        value: v ?? '',
                        t: t,
                      ),
                      suffixIcon: const Icon(
                        Icons.email,
                      ),
                    ),
                    Gap(
                      15.h,
                    ),
                    CustomTextFormPasswordField(
                      labelText: t.password,
                      showTogglePassword: true,
                      onChanged: (v) {
                        signUpReqBody = signUpReqBody.copyWith(
                          password: v,
                        );
                        if (validated) {
                          _formKey.currentState!.validate();
                        }
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
                      15.h,
                    ),
                    CustomTextFormPasswordField(
                      labelText: t.passwordConfirmation,
                      showTogglePassword: true,
                      onChanged: (v) {
                        signUpReqBody = signUpReqBody.copyWith(
                          passwordConfirmation: v,
                        );
                        if (validated) {
                          _formKey.currentState!.validate();
                        }
                      },
                      validator: (value) =>
                          PasswordValidator.confirmationPasswordValidator(
                        value: value ?? '',
                        t: t,
                        password: signUpReqBody.password ?? '',
                      ),
                    ),
                    Gap(
                      15.h,
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: isAcceptedTermsAndConditions,
                          onChanged: (value) {
                            setState(
                              () {
                                isAcceptedTermsAndConditions = value!;
                              },
                            );
                          },
                        ),
                        Expanded(
                          child: Text.rich(
                            TextSpan(
                              text: "أوافق على ",
                              children: [
                                TextSpan(
                                  text: "الشروط والأحكام",
                                  style: TextStyle(color: Colors.blue),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const TermsAndPrivacyView(),
                                        ),
                                      );
                                    },
                                ),
                                TextSpan(
                                  text: " و ",
                                ),
                                TextSpan(
                                  text: "سياسة الخصوصية",
                                  style: TextStyle(color: Colors.blue),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const TermsAndPrivacyView(),
                                        ),
                                      );
                                    },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    CustomTextButtonWidget(
                      onPressed: () async {
                        if (_formKey.currentState!.validate() &&
                            isAcceptedTermsAndConditions == true) {
                          context.read<SignUpBloc>().add(
                                SignUpEvent.signUp(
                                  signUpReqBody: signUpReqBody,
                                ),
                              );
                        } else {
                          validated = true;
                        }
                      },
                      widget: state.maybeWhen(
                        orElse: () {
                          return CustomText(
                            text: t.signUp,
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
