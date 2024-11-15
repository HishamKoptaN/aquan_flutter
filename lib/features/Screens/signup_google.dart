import 'package:aquan/features/Auth/sign_up/bloc/sign_up_bloc.dart';
import 'package:aquan/core/utils/app_colors.dart';
import 'package:aquan/features/dash/presentation/view/dash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../core/di/dependency_injection.dart';
import '../Auth/login/presentation/view/login_view.dart';
import '../Auth/sign_up/bloc/sign_up_state.dart';

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
        BlocProvider<SignUpBloc>(
          create: (context) => getIt<SignUpBloc>(),
        )
      ],
      child: BlocConsumer<SignUpBloc, SignUpState>(
        listener: (context, state) {
          // if (state is AuthErrors) {
          //   ScaffoldMessenger.of(context)
          //     ..hideCurrentSnackBar()
          //     ..showSnackBar(
          //       SnackBar(
          //         backgroundColor: AppColors.danger,
          //         duration: const Duration(seconds: 3),
          //         content: Text(
          //           state.message!,
          //           textAlign: TextAlign.center,
          //           style: const TextStyle(
          //             color: Colors.white,
          //             fontSize: 16,
          //           ),
          //         ),
          //       ),
          //     );
          // }

          // if (state is SignUpCompleted) {
          //   Navigator.of(context).pushAndRemoveUntil(
          //       MaterialPageRoute(
          //         builder: (context) => LoginView(),
          //       ),
          //       (route) => false);
          // }
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
              child: ListView(
                children: [
                  const Gap(20),
                  Text(
                    t!.createAccountGoogle,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.amber,
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
                    // child: TextButton(
                    //   onPressed: () {
                    //   context.read<SignUpBloc>().add(CompleteSignUp(
                    //         password: _password.text,
                    //         passwordConfirmation: _passwordConfirmation.text,
                    //         code: _code.text,
                    //       ));
                    // },
                    // style: TextButton.styleFrom(
                    //   textStyle: const TextStyle(fontSize: 20),
                    //   backgroundColor: Colors.amber,
                    //   padding: const EdgeInsets.all(15),
                    //   shape: RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.circular(15),
                    //   ),
                    // ),
                    // child: (state is AuthLoading)
                    //     ? const CircularProgressIndicator(
                    //         color: Colors.white,
                    //       )
                    //     : Text(
                    //         t.submit,
                    //         style: const TextStyle(
                    //           color: Colors.black,
                    //           fontFamily: "Arial",
                    //         ),
                    //       ),
                    // ),
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
