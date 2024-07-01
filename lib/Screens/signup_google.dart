import 'package:aquan/app/sign_up/bloc/auth_bloc.dart';
import 'package:aquan/Helpers/colors.dart';
import 'package:aquan/app/home_page/view/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignUpGoogle extends StatefulWidget {
  const SignUpGoogle({super.key});

  @override
  State<SignUpGoogle> createState() => _SignUpGoogleState();
}

class _SignUpGoogleState extends State<SignUpGoogle> {
  final TextEditingController _password = TextEditingController();
  final TextEditingController _passwordConfirmation = TextEditingController();
  final TextEditingController _code = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    _password.dispose();
    _passwordConfirmation.dispose();
    _code.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final t = AppLocalizations.of(context);

    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(),
        )
      ],
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

          if (state is SignUpCompleted) {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => const DashboardScreen(),
                ),
                (route) => false);
          }
        },
        builder: (context, state) {
          return Scaffold(
            key: _scaffoldKey,
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
              padding: const EdgeInsets.only(
                bottom: 20,
                left: 20,
                right: 20,
              ),
              alignment: Alignment.center,
              color: white,
              child: ListView(
                children: [
                  const Gap(20),
                  Text(
                    t!.createAccountGoogle,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                      fontSize: 30,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Gap(30),
                  TextFormField(
                    controller: _password,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: t.password,
                      border: const OutlineInputBorder(),
                      suffixIcon: const Icon(
                        Icons.password,
                      ),
                    ),
                  ),
                  const Gap(30),
                  TextFormField(
                    controller: _passwordConfirmation,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: t.passwordConfirmation,
                      border: const OutlineInputBorder(),
                      suffixIcon: const Icon(
                        Icons.password,
                      ),
                    ),
                  ),
                  const Gap(30),
                  TextFormField(
                    controller: _code,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: t.invitationCode,
                      border: const OutlineInputBorder(),
                      suffixIcon: const Icon(
                        Icons.abc,
                      ),
                    ),
                  ),
                  const Gap(30),
                  SizedBox(
                    width: size.width,
                    child: TextButton(
                      onPressed: () {
                        context.read<AuthBloc>().add(CompleteSignUp(
                              password: _password.text,
                              passwordConfirmation: _passwordConfirmation.text,
                              code: _code.text,
                            ));
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
                              t.submit,
                              style: const TextStyle(
                                color: black,
                                fontFamily: "Arial",
                              ),
                            ),
                    ),
                  ),
                  const Gap(10),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
