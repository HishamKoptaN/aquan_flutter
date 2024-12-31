import 'package:aquan/features/Layouts/app_layout.dart';
import 'package:aquan/features/auth/sign_up/present/view/sign_up_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:google_sign_in/google_sign_in.dart';
import '../../../../../core/di/dependency_injection.dart';
import '../../../../../core/widgets/custom_circular_progress.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../core/widgets/custom_text_form_password_field.dart';
import '../../../../../core/widgets/custom_text_widget.dart';
import '../../../../../core/widgets/toast_notifier.dart';
import '../../../../navigator_bottom_bar/bottom_navigation_bar_view.dart';
import '../../../reset_password/present/view/enter_email_view.dart';
import '../../../sign_up/present/bloc/sign_up_bloc.dart';
import '../../../verify_email/present/view/send_email_otp_view.dart';
import '../bloc/login_bloc.dart';
import '../bloc/login_event.dart';
import '../bloc/login_state.dart';
import '../../data/models/login_req_body.dart';

class LoginView extends StatefulWidget {
  const LoginView({
    super.key,
  });

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  LoginReqBody loginReqBody = const LoginReqBody();
  bool showPassword = true;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    late final AppLocalizations t = AppLocalizations.of(context)!;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    validator(String? value) {
      if (value == null) {
        return t.required;
      }
      if (value.isEmpty) {
        return t.required;
      }
      return null;
    }

    return AppLayout(
      showAppBar: false,
      body: BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(
          getIt(),
        ),
        child: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            state.mapOrNull(
              success: (data) {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => const NavigateBarView(),
                  ),
                  (route) => false,
                );
              },
              notVerify: (data) {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SendEmailOtpView(),
                  ),
                  (route) => false,
                );
              },
              failure: (apiErrorModel) {
                ToastNotifier().showError(
                  context: context,
                  message: apiErrorModel.apiErrorModel.error ?? t.error,
                );
              },
            );
          },
          builder: (context, state) {
            return AppLayout(
              showAppBar: false,
              body: Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Gap(
                        40.h,
                      ),
                      Image.asset(
                        'assets/icon/aquan-yellow-logo.png',
                        height: 100.h,
                        width: 100.w,
                      ),
                      CustomText(
                        text: 'أكوان',
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.yellow[700],
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Gap(
                              40.h,
                            ),
                            SizedBox(
                              width: width / 1.3,
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: CustomText(
                                  text: t.sign_in,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            CustomTextFormField(
                              key: const Key('emailField'),
                              onChanged: (v) {
                                loginReqBody = loginReqBody.copyWith(
                                  email: v,
                                );
                              },
                              validator: validator,
                              labelText: t.e_mail,
                              suffixIcon: const Icon(
                                Icons.email,
                              ),
                            ),
                            Gap(
                              20.h,
                            ),
                            CustomTextFormPasswordField(
                              key: const Key('passwordField'),
                              labelText: t.password,
                              showTogglePassword: true,
                              onChanged: (v) {
                                loginReqBody = loginReqBody.copyWith(
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
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const EnterEmailView(),
                                    ),
                                  );
                                },
                                child: CustomText(
                                  text: t.forgetPassword,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Gap(
                              20.h,
                            ),
                            GestureDetector(
                              key: const Key('loginButton'),
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  context.read<LoginBloc>().add(
                                        LoginEvent.login(
                                          loginReqBody: loginReqBody,
                                        ),
                                      );
                                }
                              },
                              child: Container(
                                width: width / 2,
                                height: height / 14,
                                decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Center(
                                  child: state.maybeWhen(
                                    loading: () {
                                      return const CustomCircularProgress();
                                    },
                                    orElse: () {
                                      return Text(
                                        t.login,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: "Arial",
                                            fontSize: 25.sp),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Gap(
                              40.h,
                            ),
                            Row(
                              children: <Widget>[
                                const Expanded(
                                  child: Divider(
                                    thickness: 2,
                                    color: Colors.black,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                  child: CustomText(
                                    text: t.or,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                const Expanded(
                                  child: Divider(
                                    thickness: 2,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            Gap(
                              20.h,
                            ),
                            GestureDetector(
                              onTap: () {
                                // _handleSignIn(
                                //   context.read<SignUpBloc>(),
                                // );
                              },
                              child: Container(
                                height: 40.h,
                                width: 40.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.grey),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Image.asset(
                                    'assets/images/google_logo.png',
                                  ),
                                ),
                              ),
                            ),
                            CustomText(
                              text: t.google,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            Gap(
                              20.h,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const SignUpView(),
                                  ),
                                );
                              },
                              child: Text.rich(
                                TextSpan(
                                  text: t.dont_have_account,
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: t.open_account,
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        color: Colors.blue,
                                        decorationThickness: 2.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // void _handleSignIn(SignUpBloc bloc) async {
  //   try {
  //     GoogleSignIn googleSignIn = GoogleSignIn();
  //     GoogleSignInAccount? account = await googleSignIn.signIn();

  //     if (account != null) {
  //       // bloc.add(
  //       //   SignInWithGoogle(
  //       //     email: account.email,
  //       //     name: account.displayName!,
  //       //   ),
  //       // );
  //     }
  //   } catch (error) {}
  // }
}
