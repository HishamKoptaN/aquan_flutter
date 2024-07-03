import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:gap/gap.dart';

import 'package:aquan/Helpers/colors.dart';
import 'package:aquan/Helpers/styles.dart';
import 'package:aquan/app/sign_up/bloc/auth_bloc.dart';

class VerifyCodeView extends StatefulWidget {
  const VerifyCodeView({
    super.key,
    required this.t,
    required this.size,
    required this.fields,
  });

  final AppLocalizations t;
  final Size size;
  final List<Map<String, dynamic>> fields;

  @override
  State<VerifyCodeView> createState() => _VerifyCodeViewState();
}

class _VerifyCodeViewState extends State<VerifyCodeView> {
  int _timerSeconds = 0;
  Timer? _timer;

  void _startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (Timer timer) {
      setState(() {
        if (_timerSeconds < 1) {
          timer.cancel();
        } else {
          _timerSeconds--;
        }
      });
    });
  }

  void _startEmailVerification() {
    setState(() {
      _timerSeconds = 60;
    });
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (BuildContext context, state) {
        if (state is SendECodeToEmail) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    widget.t.verifyEmail,
                    style: cartHeading,
                  ),
                ),
              ),
              const Gap(20),
              Center(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    widget.t.verifyEmailText,
                    style: cartHeading,
                  ),
                ),
              ),
              const Gap(20),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Directionality(
                  textDirection: TextDirection.ltr,
                  child: SizedBox(
                    height: (widget.size.width - 20 - 5 * 6) / 5,
                    width: widget.size.width,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return const Gap(5);
                      },
                      separatorBuilder: (context, index) {
                        return Container(
                          width: (widget.size.width - 20 - 5 * 6) / 6,
                          height: (widget.size.width - 20 - 5 * 6) / 6,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: TextFormField(
                            controller: widget.fields[index]['controller'],
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              counterText: "",
                            ),
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              if (index <= 5) {
                                FocusScope.of(context).nextFocus();
                              }
                            },
                            textAlign: TextAlign.center,
                            maxLength: 1,
                            showCursor: false,
                            style: const TextStyle(
                              color: white,
                              fontSize: 30,
                            ),
                          ),
                        );
                      },
                      itemCount: 7,
                    ),
                  ),
                ),
              ),
              const Gap(20),
              SizedBox(
                width: widget.size.width - 30,
                child: TextButton(
                  onPressed: () {
                    WidgetsBinding.instance.addPostFrameCallback(
                      (_) {
                        String code = "";
                        widget.fields.every(
                          (e) {
                            code = code + e['controller'].text;
                            return true;
                          },
                        );
                        context.read<AuthBloc>().add(VerifyEmail(code: code));
                      },
                    );
                  },
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 20),
                    backgroundColor: Theme.of(context).primaryColor,
                    padding: const EdgeInsets.all(15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: BorderSide(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                  child: Text(
                    widget.t.submit,
                    style: const TextStyle(
                      color: white,
                    ),
                  ),
                ),
              ),
              const Gap(20),
              SizedBox(
                width: widget.size.width - 30,
                child: TextButton(
                  onPressed: _timerSeconds == 0
                      ? () {
                          context.read<AuthBloc>().add(
                                SendEmailVerification(
                                  email: state.user.email!,
                                ),
                              );
                          _startEmailVerification();
                        }
                      : null,
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 20),
                    backgroundColor: _timerSeconds == 0
                        ? Theme.of(context).primaryColor
                        : Colors.grey,
                    padding: const EdgeInsets.all(15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: BorderSide(
                        color: _timerSeconds == 0
                            ? Theme.of(context).primaryColor
                            : Colors.grey,
                      ),
                    ),
                  ),
                  child: Text(
                    _timerSeconds == 0
                        ? widget.t.send_verification_code
                        : '$_timerSeconds seconds',
                    style: const TextStyle(
                      color: white,
                    ),
                  ),
                ),
              ),
            ],
          );
        }
        return const Center(
          child: CircularProgressIndicator(color: Colors.red),
        );
      },
    );
  }
}
