import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../auth/login/present/view/login_view.dart';
import '../../../auth/verify_email/present/view/send_email_verivication_llnk_view.dart';
import '../../../home/home_view.dart';
import '../bloc/main_bloc.dart';
import '../bloc/main_event.dart';
import '../bloc/main_state.dart';

class MainView extends StatefulWidget {
  const MainView({
    super.key,
    required this.ckeckEmailVeification,
  });
  final bool? ckeckEmailVeification;
  static const String routeName = "MainView";

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  void initState() {
    super.initState();
    if (widget.ckeckEmailVeification == false) {
      context.read<MainBloc>().add(
            MainEvent.checkLogedIn(),
          );
    } else if (widget.ckeckEmailVeification == true) {
      context.read<MainBloc>().add(
            MainEvent.checkEmailVerification(),
          );
    }
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      body: BlocConsumer<MainBloc, MainState>(
        listener: (
          context,
          state,
        ) async {
          state.mapOrNull(
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
            notVerify: (
              data,
            ) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => SendEmailVerivicationLinkView(),
                ),
                (route) => false,
              );
            },
            logedOut: (_) {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => const LoginView(),
                ),
                (route) => false,
              );
            },
          );
        },
        builder: (context, state) {
          return Image.asset(
            "assets/icon/aquan-logo-gif.gif",
          );
        },
      ),
    );
  }
}
