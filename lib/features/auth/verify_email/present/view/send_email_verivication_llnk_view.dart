import 'dart:async';
import 'package:aquan/features/layouts/app_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../core/widgets/custom_dialog.dart';
import '../../../../../core/widgets/custom_icon_button_widget.dart';
import '../../../../../core/widgets/custom_text_widget.dart';
import '../../../../../core/widgets/toast_notifier.dart';
import '../../../../home/home_view.dart';
import '../../../../main/present/bloc/main_bloc.dart';
import '../../../../main/present/bloc/main_event.dart';
import '../../../../main/present/bloc/main_state.dart';
import '../../../login/present/view/login_view.dart';

class SendEmailVerivicationLinkView extends StatefulWidget {
  const SendEmailVerivicationLinkView({
    super.key,
  });
  @override
  State<SendEmailVerivicationLinkView> createState() =>
      _SendEmailVerivicationLinkViewState();
}

class _SendEmailVerivicationLinkViewState
    extends State<SendEmailVerivicationLinkView> {
  StreamController<ErrorAnimationType>? errorController;
  int _timerSeconds = 0;
  bool isSend = false;
  Timer? _timer;
  void _startEmailVerification() {
    isSend = true;
    setState(
      () {
        _timerSeconds = 60;
      },
    );
    _startTimer();
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

  @override
  void initState() {
    super.initState();
    context.read<MainBloc>().add(
          MainEvent.sendVerificationLink(),
        );
  }

  @override
  Widget build(context) {
    final t = AppLocalizations.of(context)!;
    return AppLayout(
      route: '',
      showAppBar: false,
      body: BlocConsumer<MainBloc, MainState>(
        listener: (context, state) {
          state.whenOrNull(
            emailVerificationLinkSent: () {
              _startEmailVerification();
            },
            logedIn: (
              biometric,
            ) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeView(),
                ),
                (route) => false,
              );
            },
            logedOut: () {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => const LoginView(),
                ),
                (route) => false,
              );
            },
            failure: (apiErrorModel) async {
              ToastNotifier().showError(
                context: context,
                message: apiErrorModel.error ?? t.error,
              );
            },
          );
        },
        builder: (
          context,
          state,
        ) {
          return SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/icon/aquan_black_logo.png',
                          height: 50.h,
                          width: 50.w,
                        ),
                        CustomText(
                          text: t.aquan,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    CustomIconButtonWidget(
                      buttonColor: Colors.black,
                      onPressed: () async {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return const CustomDialog();
                          },
                        );
                      },
                      widget: FaIcon(
                        FontAwesomeIcons.arrowRightFromBracket,
                        color: Colors.black,
                        size: 25.sp,
                      ),
                    ),
                  ],
                ),
                Gap(
                  20.h,
                ),
                Icon(
                  Icons.cancel,
                  color: Colors.black,
                  size: 75.sp,
                ),
                CustomText(
                  text: t.not_verified,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.center,
                ),
                Gap(
                  50.h,
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(
                          40,
                        ),
                        topLeft: Radius.circular(
                          40,
                        ),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Gap(
                          50.h,
                        ),
                        Padding(
                          padding: EdgeInsets.all(
                            8.sp,
                          ),
                          child: CustomText(
                            text: t.email_not_verified,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            maxLines: 5,
                          ),
                        ),
                        Gap(
                          15.h,
                        ),
                        Gap(
                          10.h,
                        ),
                        if (isSend)
                          //! Timer
                          TextButton(
                            onPressed: () {
                              if (_timerSeconds == 0) {
                                context.read<MainBloc>().add(
                                      MainEvent.sendVerificationLink(),
                                    );
                              }
                            },
                            child: CustomText(
                              text: _timerSeconds == 0
                                  ? t.send_code_again
                                  : '${t.send_code_after} $_timerSeconds ${t.seconds}',
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
