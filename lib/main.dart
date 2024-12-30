import 'package:aquan/core/helpers/settings.dart';
import 'package:aquan/core/di/dependency_injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/helpers/app_observer.dart';
import 'core/helpers/constants.dart';
import 'core/helpers/shared_pref_helper.dart';
import 'core/utils/app_colors.dart';
import 'features/auth/login/present/view/login_view.dart';
import 'features/auth/verify_email/present/view/send_email_otp_view.dart';
import 'features/layouts/app_layout.dart';
import 'features/main/present/bloc/main_bloc.dart';
import 'features/main/present/bloc/main_event.dart';
import 'features/main/present/bloc/main_state.dart';
import 'features/navigator_bottom_bar/bottom_navigation_bar_view.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Injection.inject();
  await ScreenUtil.ensureScreenSize();
  SharedPrefHelper;
  String locale = await SharedPrefHelper.getString(
        key: SharedPrefKeys.languageCode,
      ) ??
      'ar';
  FlutterError.onError = (
    details,
  ) {
    FlutterError.presentError(
      details,
    );
  };
  Bloc.observer = AppBlocObserver();
  await Settings.setup();
  runApp(
    MyApp(
      locale: locale,
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({
    super.key,
    required this.locale,
  });
  final String locale;
  Color color = AppColors.primary;
  @override
  Widget build(
    context,
  ) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: ScreenUtilInit(
        designSize: Size(
          width,
          height,
        ),
        minTextAdapt: true,
        splitScreenMode: true,
        child: BlocProvider(
          create: (context) => MainBloc(
            checkUseCase: getIt(),
            editPassUseCase: getIt(),
          )..add(
              const MainEvent.check(),
            ),
          child: MaterialApp(
            color: Colors.white,
            title: 'AQUAN',
            debugShowCheckedModeBanner: false,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: Locale(
              locale,
            ),
            home: AppLayout(
              route: "",
              showAppBar: false,
              body: BlocConsumer<MainBloc, MainState>(
                listener: (context, state) async {
                  state.mapOrNull(
                    logedIn: (notVerify) {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NavigateBarView(),
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
                    notVerify: (data) {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SendEmailOtpView(),
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
            ),
          ),
        ),
      ),
    );
  }
}

class RestartWidget extends StatefulWidget {
  const RestartWidget({
    super.key,
    required this.child,
  });
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
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: widget.child,
    );
  }
}
