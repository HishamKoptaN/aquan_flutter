import 'package:aquan/Helpers/colors.dart';
import 'package:aquan/app/Layouts/app_layout.dart';
import 'package:aquan/app/Auth/User/bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:motion_toast/resources/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:aquan/Helpers/styles.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  bool loading = false;

  final TextEditingController _currentPassword = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _passwordConfirmation = TextEditingController();

  bool currentPasswordShow = true;
  bool passwordShow = true;
  bool passwordConfirmationShow = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final t = AppLocalizations.of(context)!;

    return AppLayout(
      route: t.changePassword,
      body: Container(
        padding: const EdgeInsets.all(10),
        child: BlocProvider<UserBloc>(
          create: (context) => UserBloc(),
          child: BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              String? error;
              if (state is UserError) {
                error = state.message;
              }

              if (state is ProfileDone && state.updated) {
                _password.text = '';
                _passwordConfirmation.text = '';
                _currentPassword.text = '';
              }

              return ListView(
                children: [
                  const Gap(20),
                  Text(
                    t.changePasswordText,
                    style: cartHeading,
                    textAlign: TextAlign.center,
                  ),
                  if (error != null)
                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: const BoxDecoration(
                        color: danger,
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      child: Text(
                        error,
                        style: const TextStyle(
                          color: white,
                        ),
                      ),
                    ),
                  if (state is ProfileDone && state.updated)
                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: const BoxDecoration(
                        color: successColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      child: Text(
                        t.passwordChanged,
                        style: const TextStyle(
                          color: white,
                        ),
                      ),
                    ),
                  const Gap(50),
                  TextFormField(
                    controller: _currentPassword,
                    obscureText: currentPasswordShow,
                    decoration: InputDecoration(
                      labelText: t.currentPassword,
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(
                          currentPasswordShow
                              ? FontAwesomeIcons.eye
                              : FontAwesomeIcons.eyeSlash,
                          color: black,
                          size: 16,
                        ),
                        onPressed: () {
                          setState(() {
                            currentPasswordShow = !currentPasswordShow;
                          });
                        },
                      ),
                    ),
                  ),
                  const Gap(30),
                  TextFormField(
                    controller: _password,
                    obscureText: passwordShow,
                    decoration: InputDecoration(
                      labelText: t.newPassword,
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(
                          passwordShow
                              ? FontAwesomeIcons.eye
                              : FontAwesomeIcons.eyeSlash,
                          color: black,
                          size: 16,
                        ),
                        onPressed: () {
                          setState(() {
                            passwordShow = !passwordShow;
                          });
                        },
                      ),
                    ),
                  ),
                  const Gap(30),
                  TextFormField(
                    controller: _passwordConfirmation,
                    obscureText: passwordConfirmationShow,
                    decoration: InputDecoration(
                      labelText: t.newPasswordConfirmation,
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(
                          passwordConfirmationShow
                              ? FontAwesomeIcons.eye
                              : FontAwesomeIcons.eyeSlash,
                          color: black,
                          size: 16,
                        ),
                        onPressed: () {
                          setState(() {
                            passwordConfirmationShow =
                                !passwordConfirmationShow;
                          });
                        },
                      ),
                    ),
                  ),
                  const Gap(30),
                  SizedBox(
                    width: size.width,
                    child: TextButton(
                      onPressed: () {
                        setState(() => loading = true);
                        context.read<UserBloc>().add(
                              ChangePassword(
                                currentPassword: _currentPassword.text,
                                newPassword: _password.text,
                                newPasswordConfirmation:
                                    _passwordConfirmation.text,
                              ),
                            );
                      },
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 20),
                        backgroundColor: Theme.of(context).primaryColor,
                        padding: const EdgeInsets.all(15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: state is UserLoading
                          ? const CircularProgressIndicator(
                              color: white,
                            )
                          : Text(
                              t.change,
                              style: const TextStyle(
                                color: white,
                              ),
                            ),
                    ),
                  ),
                  const Gap(10),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
