// ignore_for_file: unused_import
import 'package:aquan/Helpers/Storage.dart';
import 'package:aquan/Helpers/colors.dart';
import 'package:aquan/Helpers/settings.dart';
import 'package:aquan/Helpers/styles.dart';
import 'package:aquan/Language/bloc/language_bloc.dart';
import 'package:aquan/app/Auth/login/view/login_view.dart';
import 'package:aquan/app/Widgets/language_set.dart';
import 'package:aquan/app/home_page/view/dashboard.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Helpers/simpleBloc.dart';
import 'app/Plans/view/plans_view.dart';
import 'app/level_details/view/subscribtion_view.dart';
import 'app/sign_up/bloc/auth_bloc.dart';
import 'app/local_auth/local_auth_view.dart';
import 'test_three.dart';
import 'test_two.dart';

void main() async {
  Bloc.observer = SimpleBlocDelegate();
  WidgetsFlutterBinding.ensureInitialized();
  FlutterError.onError = (details) {
    FlutterError.presentError(details);
  };
  await Future.wait(
    [
      SharedPreferences.getInstance(),
      Storage.init(),
      Settings.setup(),
    ],
  );

  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => const MaterialApp(
        home:
            //  MyApp(),
            MyAppThree(),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String locale = Storage.getString('language') ?? 'en';
  Color color = primary;

  @override
  void initState() {
    super.initState();
    setupColors();
  }

  Future<void> setupColors() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(
      () {
        String? colorString = prefs.getString('color');
        if (colorString != null) {
          color = Color(int.parse("0x$colorString"));
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        title: 'AQUAN',
        debugShowCheckedModeBanner: false,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: Locale(locale),
        theme: ThemeData(
          primaryColor: color,
          colorScheme: ColorScheme.fromSeed(
            seedColor: color,
          ),
          fontFamily: "Arial",
          useMaterial3: true,
        ),
        home: BlocProvider<LanguageBloc>(
          create: (BuildContext context) =>
              LanguageBloc()..add(CheckLanguage()),
          child: BlocBuilder<LanguageBloc, LanguageState>(
            builder: (context, state) {
              if (state is SetLanguage) {
                return LanguageSetWidget(
                  onPress: () {
                    context.read<LanguageBloc>().add(SetLocale(locale: locale));
                  },
                  onChanged: (value) => setState(
                    () {
                      locale = value!;
                    },
                  ),
                );
              }
              if (state is LanguageSeted) {
                WidgetsBinding.instance.addPostFrameCallback(
                  (_) {
                    setState(
                      () {
                        locale = Storage.getString('language') ?? 'en';
                      },
                    );
                  },
                );
                bool enableFingerprints =
                    Storage.getBool('fingerprints') ?? false;
                return BlocProvider<AuthBloc>(
                  create: (context) => AuthBloc()..add(CheckLogedIn()),
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
                    },
                    builder: (context, state) {
                      // if (state is LogedIn) {
                      //   return const DashboardScreen();
                      // } else if (state is AuthLogedOut) {
                      //   return LoginView();
                      // } else if (state is AuthBiometrically) {
                      //   return const BiometricScreen();
                      // }
                      // return LoginView();
                      return const DashboardScreen();
                    },
                  ),
                );
              }
              return const Center(child: CircularProgressIndicator());
            },
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
