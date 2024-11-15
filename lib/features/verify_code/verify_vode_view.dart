import 'dart:async';
import 'package:another_flushbar/flushbar.dart';
import 'package:aquan/features/Layouts/app_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../navigator_bottom_bar/bottom_navigation_bar_view.dart';
import 'bloc/verify_email_bloc.dart';

class VerifyCode extends StatefulWidget {
  String userEmail;
  VerifyCode({
    super.key,
    required this.userEmail,
  });

  @override
  State<VerifyCode> createState() => _VerifyCodeState();
}

class _VerifyCodeState extends State<VerifyCode> {
  TextEditingController textEditingController = TextEditingController();
  StreamController<ErrorAnimationType>? errorController;
  int _timerSeconds = 0;
  Timer? _timer;
  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();
    super.dispose();
  }

  void _startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        setState(
          () {
            if (_timerSeconds < 1) {
              timer.cancel();
            } else {
              _timerSeconds--;
            }
          },
        );
      },
    );
  }

  void _startEmailVerification() {
    setState(
      () {
        _timerSeconds = 60;
      },
    );
    _startTimer();
  }

  // snackBar Widget
  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message!),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(context) {
    final t = AppLocalizations.of(context)!;
    return AppLayout(
      route: '',
      showAppBar: false,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                Column(
                  children: [
                    Image.asset(
                      'assets/icon/aquan_AppColors.black_logo.png',
                      width: 55,
                      height: 55,
                    ),
                    Text(
                      t.aquan,
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Gap(20.h),
            Icon(
              Icons.verified,
              color: Colors.black,
              size: 100.sp,
            ),
            Text(
              t.verify_email,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Gap(50.h),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40),
                      topLeft: Radius.circular(40)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Gap(15.h),
                        Text(
                          t.verify_email,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Gap(15.h),
                        Text(
                          t.enter_6_digits,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Gap(15.h),
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: Form(
                        key: formKey,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 1,
                            horizontal: 10,
                          ),
                          child: PinCodeTextField(
                            appContext: context,
                            pastedTextStyle: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            textStyle: const TextStyle(color: Colors.white),
                            length: 6,
                            pinTheme: PinTheme(
                              shape: PinCodeFieldShape.box,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                              fieldHeight: 50.h,
                              fieldWidth: 50.w,
                              inactiveColor: Colors.black,
                              activeFillColor: Colors.black,
                              activeColor: Colors.black,
                              selectedColor: Colors.black,
                              selectedFillColor: Colors.black,
                              inactiveFillColor: Colors.black,
                            ),
                            hintCharacter: "-",
                            cursorColor: Colors.black,
                            animationDuration:
                                const Duration(milliseconds: 300),
                            enableActiveFill: true,
                            errorAnimationController: errorController,
                            controller: textEditingController,
                            keyboardType: TextInputType.number,
                            boxShadows: const [
                              BoxShadow(
                                offset: Offset(0, 1),
                                color: Colors.black,
                                blurRadius: 10,
                              )
                            ],
                            blinkWhenObscuring: true,
                            animationType: AnimationType.fade,
                            validator: (v) {
                              if (v!.length < 3) {
                                return t.required;
                              } else {
                                return null;
                              }
                            },
                            onCompleted: (v) {
                              debugPrint("Completed");
                            },
                            onChanged: (value) {
                              debugPrint(value);
                              setState(
                                () {
                                  currentText = value;
                                },
                              );
                            },
                            beforeTextPaste: (text) {
                              debugPrint("Allowing to paste $text");
                              return true;
                            },
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Flexible(
                          child: TextButton(
                            child: const Text("Clear"),
                            onPressed: () {
                              textEditingController.clear();
                            },
                          ),
                        ),
                      ],
                    ),
                    Gap(10.h),
                    Text(
                      hasError ? "*Please fill up all the cells properly" : "",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Gap(10.h),
                    BlocProvider(
                      create: (context) => VerifyEmailBloc(),
                      child: BlocConsumer<VerifyEmailBloc, VerifyEmailState>(
                        listener: (context, state) {
                          if (state is EmailVerified) {
                            Flushbar(
                              title: t.success,
                              message: t.account_verified_done,
                              duration: const Duration(seconds: 3),
                              flushbarPosition: FlushbarPosition.TOP,
                            ).show(context);
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const NavigateBarView(),
                              ),
                            );
                          }
                        },
                        builder: (context, state) {
                          return Column(
                            children: [
                              TextButton(
                                onPressed: () {
                                  if (_timerSeconds == 0) {
                                    context.read<VerifyEmailBloc>().add(
                                          SendEmailVerification(
                                            email: widget.userEmail,
                                          ),
                                        );
                                    _startEmailVerification();
                                    snackBar(
                                        "The OTP has been sent successfully");
                                  } else {
                                    snackBar("The code has already been sent");
                                  }
                                },
                                child: Text(
                                  _timerSeconds == 0
                                      ? t.resend_code
                                      : '$_timerSeconds seconds',
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              Gap(10.h),
                              Container(
                                width: 200.w,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(40),
                                  boxShadow: [
                                    const BoxShadow(
                                        color: Colors.black,
                                        offset: Offset(1, -2),
                                        blurRadius: 5),
                                    BoxShadow(
                                        color: Colors.green.shade200,
                                        offset: const Offset(-1, 2),
                                        blurRadius: 5)
                                  ],
                                ),
                                child: ButtonTheme(
                                  child: TextButton(
                                    onPressed: () async {
                                      formKey.currentState!.validate();
                                      if (currentText.length != 6) {
                                        errorController!
                                            .add(ErrorAnimationType.shake);
                                        setState(() => hasError = true);
                                      } else {
                                        context.read<VerifyEmailBloc>().add(
                                              VerifyEmail(code: currentText),
                                            );
                                        if (state is EmailVerified) {
                                          setState(
                                            () {
                                              hasError = false;
                                              snackBar("OTP Verified!!");
                                            },
                                          );
                                        }
                                      }
                                    },
                                    child: Center(
                                      child: Text(
                                        t.verify,
                                        style: TextStyle(
                                          color: Colors.amberAccent,
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    Gap(10.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
