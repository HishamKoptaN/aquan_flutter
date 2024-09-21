import 'package:aquan/features/Auth/sign_up/bloc/sign_up_bloc.dart';
import 'package:aquan/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:gap/gap.dart';
import 'package:motion_toast/resources/colors.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  bool loading = false;
  final TextEditingController _email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final t = AppLocalizations.of(context);

    return BlocProvider<SignUpBloc>(
      create: (context) => SignUpBloc()..add(CheckLogedIn()),
      child: BlocBuilder<SignUpBloc, SignUpState>(
        builder: (context, state) {
          //   String? errorText;
          if (state is AuthErrors) {
            WidgetsBinding.instance.addPostFrameCallback(
              (_) {
                setState(() => loading = false);
              },
            );
          }

          return Scaffold(
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
                    t!.wantToResetPassword,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.amber,
                      fontSize: 30,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Gap(50),
                  if (state is AuthErrors)
                    Container(
                      padding: const EdgeInsets.all(15),
                      margin: const EdgeInsets.only(bottom: 20),
                      decoration: const BoxDecoration(
                        color: AppColors.danger,
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      child: Text(
                        state.message!,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  if (state is ResetPassowrdEmailSent)
                    Container(
                      padding: const EdgeInsets.all(15),
                      margin: const EdgeInsets.only(bottom: 20),
                      decoration: const BoxDecoration(
                        color: successColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      child: Text(
                        state.message,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  TextFormField(
                    controller: _email,
                    decoration: InputDecoration(
                      labelText: t.email,
                      border: const OutlineInputBorder(),
                      suffixIcon: const Icon(
                        Icons.email,
                      ),
                    ),
                  ),
                  const Gap(50),
                  SizedBox(
                    width: size.width,
                    child: TextButton(
                      onPressed: () {
                        setState(() => loading = true);
                        context.read<SignUpBloc>().add(
                              ResetPassword(
                                email: _email.text,
                              ),
                            );
                      },
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 20),
                        backgroundColor: Colors.amber,
                        padding: const EdgeInsets.all(15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: !loading
                          ? Text(
                              t.resetPassword,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            )
                          : const CircularProgressIndicator(
                              color: Colors.white,
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
