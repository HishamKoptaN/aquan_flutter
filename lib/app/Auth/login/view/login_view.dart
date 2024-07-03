import 'package:aquan/app/sign_up/bloc/auth_bloc.dart';
import 'package:aquan/Helpers/colors.dart';

import 'package:aquan/app/home_page/view/dashboard.dart';
import 'package:aquan/app/Auth/view/forget_password.dart';
import 'package:aquan/app/sign_up/view/sign_up_view.dart';
import 'package:aquan/Screens/signup_google.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:local_auth/local_auth.dart';

import '../../../navigator_bottom_bar/navigator_bottom_bar_view.dart';

// ignore: must_be_immutable
class LoginView extends StatefulWidget {
  LoginView({super.key, this.logout = false});

  bool logout;

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool showPassword = true;

  final LocalAuthentication auth = LocalAuthentication();
  bool canAuth = false;

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final t = AppLocalizations.of(context)!;

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
      create: (context) => AuthBloc()..add(CheckLogedIn()),
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
          if (widget.logout) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  backgroundColor: danger,
                  duration: const Duration(seconds: 3),
                  content: Text(
                    t.logedOut,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: white,
                      fontSize: 16,
                    ),
                  ),
                  onVisible: () {
                    setState(
                      () {
                        widget.logout = false;
                      },
                    );
                  },
                ),
              );
          }
          if (state is AuthLogedIn) {
            if (state.createPassword) {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => const SignUpGoogle(),
                  ),
                  (route) => false);
            } else {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => const NavigateBarScreen(),
                  ),
                  (route) => false);
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            key: _scaffoldKey,
            backgroundColor: third,
            appBar: AppBar(
              backgroundColor: third,
              title: const Text(
                "AQUAN",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: white,
                ),
              ),
              elevation: 2,
              centerTitle: true,
            ),
            body: Container(
              padding: const EdgeInsets.all(20),
              alignment: Alignment.center,
              color: white,
              child: (state is CheckLoginLoading)
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: white,
                      ),
                    )
                  : Form(
                      key: _formKey,
                      child: ListView(
                        children: [
                          Text(
                            t.pleaseLogin,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                              fontSize: 30,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const Gap(20),
                          TextFormField(
                            controller: _email,
                            validator: validator,
                            decoration: InputDecoration(
                              labelText: t.email,
                              border: const OutlineInputBorder(),
                              suffixIcon: const Icon(
                                Icons.email,
                              ),
                            ),
                          ),
                          const Gap(30),
                          TextFormField(
                            controller: _password,
                            validator: validator,
                            obscureText: showPassword,
                            decoration: InputDecoration(
                              labelText: t.password,
                              border: const OutlineInputBorder(),
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
                            ),
                          ),
                          const Gap(30),
                          SizedBox(
                            width: size.width,
                            child: TextButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  context.read<AuthBloc>().add(
                                        AuthLogin(
                                          email: _email.text,
                                          password: _password.text,
                                        ),
                                      );
                                }
                              },
                              style: TextButton.styleFrom(
                                textStyle: const TextStyle(fontSize: 20),
                                backgroundColor: Theme.of(context).primaryColor,
                                padding: const EdgeInsets.all(15),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              child: (state is AuthLoading)
                                  ? const CircularProgressIndicator(
                                      color: white,
                                    )
                                  : Text(
                                      t.login,
                                      style: const TextStyle(
                                        color: white,
                                        fontFamily: "Arial",
                                      ),
                                    ),
                            ),
                          ),
                          const Gap(20),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const ForgetPasswordScreen(),
                                  ),
                                );
                              },
                              child: Text(
                                t.forgetPassword,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontFamily: "Arial",
                                ),
                              ),
                            ),
                          ),
                          const Gap(20),
                          GestureDetector(
                            onTap: () {
                              _handleSignIn(context.read<AuthBloc>());
                            },
                            child: InkWell(
                              onTap: () {
                                _handleSignIn(context.read<AuthBloc>());
                              },
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: white,
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    _handleSignIn(context.read<AuthBloc>());
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(6),
                                    child: Wrap(
                                      alignment: WrapAlignment.center,
                                      crossAxisAlignment:
                                          WrapCrossAlignment.center,
                                      children: [
                                        Image.asset(
                                          "assets/images/google_logo.png",
                                          width: 20,
                                        ),
                                        const Gap(
                                          0,
                                          crossAxisExtent: 20,
                                        ),
                                        Text(t.signInWithGoogle),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Gap(30),
                          Container(
                            alignment: Alignment.center,
                            child: Text(t.oo),
                          ),
                          const Gap(30),
                          SizedBox(
                            width: size.width,
                            child: TextButton(
                              onPressed: () {
                                WidgetsBinding.instance.addPostFrameCallback(
                                  (_) => Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const SignUpScreen(),
                                    ),
                                  ),
                                );
                              },
                              style: TextButton.styleFrom(
                                textStyle: const TextStyle(fontSize: 20),
                                backgroundColor: white,
                                padding: const EdgeInsets.all(15),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  side: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ),
                              child: Text(
                                t.signUp,
                                style: const TextStyle(
                                  color: black,
                                  fontFamily: "Arial",
                                ),
                              ),
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
}

void _handleSignIn(bloc) async {
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
    // print(error);
  }
}
