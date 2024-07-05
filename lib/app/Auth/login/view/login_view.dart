import 'package:aquan/app/sign_up/bloc/auth_bloc.dart';
import 'package:aquan/Helpers/colors.dart';
import 'package:aquan/app/Auth/view/forget_password.dart';
import 'package:aquan/app/sign_up/view/sign_up_view.dart';
import 'package:aquan/Screens/signup_google.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../navigator_bottom_bar/navigator_bottom_bar_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({
    Key? key,
  }) : super(key: key);

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

    return BlocProvider<AuthBloc>(
      create: (context) => AuthBloc(),
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthErrors) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  backgroundColor: danger,
                  duration: const Duration(seconds: 3),
                  content: Text(
                    state.message!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: white,
                      fontSize: 16,
                    ),
                  ),
                ),
              );
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: white,
            body: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/icon/aquan_icon.png',
                        height: 125.h,
                        width: 125.w,
                      ),
                      Text(
                        'أكوان',
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.yellow[700],
                        ),
                      ),
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
                          borderRadius:
                              BorderRadius.circular(40), // جعل الحدود دائرية
                          color: Colors.grey[200], // لون خلفية الحقل
                        ),
                        child: TextFormField(
                          controller: _email,
                          validator: validator,
                          decoration: InputDecoration(
                            labelText: t.email,
                            suffixIcon: const Icon(Icons.email),
                            border: InputBorder.none, // إخفاء الخط السفلي
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 20, // لضبط المسافات الداخلية
                            ),
                          ),
                        ),
                      ),
                      Gap(20.h),
                      Container(
                        width: width / 1.3,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(40), // جعل الحدود دائرية
                          color: Colors.grey[200], // لون خلفية الحقل
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
                            context.read<AuthBloc>().add(
                                  AuthLogin(
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
                                    color: white,
                                  )
                                : Text(
                                    t.login,
                                    style: TextStyle(
                                        color: black,
                                        fontFamily: "Arial",
                                        fontSize: 25.sp),
                                  ),
                          ),
                        ),
                      ),
                      const Gap(20),
                      Row(
                        children: <Widget>[
                          const Expanded(
                            child: Divider(
                              thickness: 2,
                              color: Colors.black,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
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
                            context.read<AuthBloc>(),
                          );
                        },
                        child: Container(
                          height: 50.h,
                          width: 60.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Image.asset(
                              'assets/images/google_logo.png',
                              height: 24,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        t.google,
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const Gap(20),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const SignUpScreen(),
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
                                  fontSize: 20.sp,
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
              ),
            ),
          );
        },
      ),
    );
  }

  void _handleSignIn(AuthBloc bloc) async {
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
    } catch (error) {
      // Handle sign in error
    }
  }
}
