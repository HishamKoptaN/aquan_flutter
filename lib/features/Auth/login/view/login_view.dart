import 'package:aquan/features/Auth/sign_up/bloc/sign_up_bloc.dart';
import 'package:aquan/core/utils/app_colors.dart';
import 'package:aquan/features/Auth/view/forget_password.dart';
import 'package:aquan/features/Auth/sign_up/view/sign_up_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../../core/Helpers/snack_bar.dart';
import '../../../navigator_bottom_bar/bottom_navigation_bar_view.dart';
import '../bloc/login_bloc.dart';

class LoginView extends StatefulWidget {
  const LoginView({
    super.key,
  });

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool showPassword = true;

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final size = MediaQuery.of(context).size;
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

    return BlocProvider<LoginBloc>(
      create: (context) => LoginBloc(),
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginErrors) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                snackBar(
                  status: false,
                  message: state.message!,
                ),
              );
          }
          if (state is AuthLogedInSuccessfully) {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => const NavigateBarView(),
              ),
              (route) => false,
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Gap(40.h),
                    Image.asset(
                      'assets/icon/aquan-yellow-logo.png',
                      height: 100.h,
                      width: 100.w,
                    ),
                    Text(
                      'أكوان',
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.yellow[700],
                      ),
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Gap(40.h),
                          SizedBox(
                            width: width / 1.3,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                t.sign_in,
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: width / 1.3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: Colors.grey[200],
                            ),
                            child: TextFormField(
                              controller: _email,
                              validator: validator,
                              decoration: InputDecoration(
                                labelText: t.email,
                                suffixIcon: const Icon(Icons.email),
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 20,
                                ),
                              ),
                            ),
                          ),
                          Gap(20.h),
                          Container(
                            width: width / 1.3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: Colors.grey[200],
                            ),
                            child: TextFormField(
                              controller: _password,
                              validator: validator,
                              obscureText: showPassword,
                              decoration: InputDecoration(
                                labelText: t.password,
                                suffixIcon: InkWell(
                                  onTap: () {
                                    setState(
                                      () {
                                        showPassword = !showPassword;
                                      },
                                    );
                                  },
                                  child: Icon(
                                    showPassword
                                        ? FontAwesomeIcons.eye
                                        : FontAwesomeIcons.eyeSlash,
                                  ),
                                ),
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 20,
                                ),
                              ),
                            ),
                          ),
                          const Gap(10),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const ForgetPasswordScreen(),
                                  ),
                                );
                              },
                              child: Text(t.forgetPassword),
                            ),
                          ),
                          const Gap(20),
                          GestureDetector(
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                context.read<LoginBloc>().add(
                                      Login(
                                        email: _email.text,
                                        password: _password.text,
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
                                child: (state is AuthLoading)
                                    ? const CircularProgressIndicator(
                                        color: Colors.white,
                                      )
                                    : Text(
                                        t.login,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: "Arial",
                                            fontSize: 25.sp),
                                      ),
                              ),
                            ),
                          ),
                          Gap(40.h),
                          Row(
                            children: <Widget>[
                              const Expanded(
                                child: Divider(
                                  thickness: 2,
                                  color: Colors.black,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  t.or,
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
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
                          const Gap(20),
                          GestureDetector(
                            onTap: () {
                              _handleSignIn(
                                context.read<SignUpBloc>(),
                              );
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
                          Text(
                            t.google,
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const Gap(20),
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
    );
  }

  void _handleSignIn(SignUpBloc bloc) async {
    try {
      GoogleSignIn googleSignIn = GoogleSignIn();
      GoogleSignInAccount? account = await googleSignIn.signIn();

      if (account != null) {
        bloc.add(
          SignInWithGoogle(
            email: account.email,
            name: account.displayName!,
          ),
        );
      }
    } catch (error) {}
  }
}
