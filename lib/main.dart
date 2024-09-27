// ignore_for_file: unused_import
import 'package:aquan/core/Helpers/settings.dart';
import 'package:aquan/core/Helpers/styles.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/Helpers/app_observer.dart';
import 'core/Helpers/snack_bar.dart';
import 'core/Helpers/storage.dart';
import 'core/utils/app_colors.dart';
import 'features/Auth/login/view/login_view.dart';
import 'features/navigator_bottom_bar/bottom_navigation_bar_view.dart';
import 'features/verify_code/verify_vode_view.dart';
import 'features/Auth/sign_up/bloc/sign_up_bloc.dart';
import 'test_two.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterError.onError = (details) {
    FlutterError.presentError(details);
  };
  Bloc.observer = AppBlocObserver();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await Storage.init();
  await Settings.setup();
  if (prefs.getBool("fingerprints") == null) {
    prefs.setBool(
      "fingerprints",
      false,
    );
  }
  runApp(
    // DevicePreview(
    //   enabled: !kReleaseMode,
    //   builder: (context) => MyApp(), // Wrap your app
    // ),
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String locale = Storage.getString('language') ?? 'ar';
  Color color = AppColors.primary;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        child: BlocProvider(
          create: (context) => SignUpBloc()..add(CheckLogedIn()),
          child: MaterialApp(
            color: Colors.white,
            title: 'AQUAN',
            debugShowCheckedModeBanner: false,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: Locale(locale),
            home: Scaffold(
              backgroundColor: Colors.white,
              body: BlocConsumer<SignUpBloc, SignUpState>(
                listener: (context, state) async {
                  if (state is AuthLogedIn) {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NavigateBarView(),
                      ),
                      (route) => false,
                    );
                  }
                  if (state is EmailNotVerify) {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VerifyCode(
                          user: state.user,
                        ),
                      ),
                      (route) => false,
                    );
                  }
                  if (state is EmailVerified) {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NavigateBarView(),
                      ),
                      (route) => false,
                    );
                  }

                  if (state is AuthLogedOut) {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => const LoginView(),
                      ),
                      (route) => false,
                    );
                  }
                  if (state is AuthErrors) {
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
                        snackBar(
                          status: false,
                          message: state.message!,
                        ),
                      );
                  }
                },
                builder: (context, state) {
                  return
                      // const LoginView();
                      Image.asset("assets/icon/aquan-logo-gif.gif");
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class RestartWidget extends StatefulWidget {
  const RestartWidget({super.key, required this.child});
  final Widget child;
  static void restartApp(BuildContext context) {
    context.findAncestorStateOfType<_RestartWidgetState>()?.restartApp();
  }

  @override
  _RestartWidgetState createState() => _RestartWidgetState();
}

class _RestartWidgetState extends State<RestartWidget> {
  Key key = UniqueKey();
  void restartApp() {
    StyleColors.init();
    setState(
      () {
        key = UniqueKey();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: widget.child,
    );
  }
}
