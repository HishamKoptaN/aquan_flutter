// ignore_for_file: unused_import
import 'package:aquan/Helpers/Storage.dart';
import 'package:aquan/Helpers/colors.dart';
import 'package:aquan/Helpers/settings.dart';
import 'package:aquan/Helpers/styles.dart';
import 'package:aquan/app/Plans/view/plans_view.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Helpers/app_observer.dart';
import 'app/Auth/login/view/login_view.dart';
import 'app/Widgets/language_set.dart';
import 'app/navigator_bottom_bar/bottom_navigation_bar_view.dart';
import 'app/verify_code/verify_vode_view.dart';
import 'app/sign_up/bloc/auth_bloc.dart';
import 'test_three.dart';
import 'test_two.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

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
    prefs.setBool("fingerprints", false);
  }

  runApp(
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
  Color color = primary;
  bool error = false;

  setupColors() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(
      () {
        String? c = prefs.getString('color');
        if (c != null) {
          color = Color(
            int.parse("0x${prefs.getString('color')!}"),
          );
        }
      },
    );
  }

  @override
  void initState() {
    setupColors();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MultiBlocProvider(
          providers: [
            BlocProvider<AuthBloc>(
              create: (BuildContext context) => AuthBloc()..add(CheckLogedIn()),
            ),
            BlocProvider<ThemeCubit>(
              create: (BuildContext context) => ThemeCubit(),
            ),
          ],
          child: BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, themeState) {
              return MaterialApp(
                color: Colors.white,
                builder: (context, widget) {
                  FlutterError.onError = (details) async {
                    FlutterError.presentError(details);
                    WidgetsBinding.instance.addPostFrameCallback(
                      (_) {
                        setState(() => error = true);
                      },
                    );
                  };
                  ErrorWidget.builder = (errorDetails) {
                    return Scaffold(
                      backgroundColor: Colors.white,
                      body: Center(
                        child: Text(
                          errorDetails.toString(),
                        ),
                      ),
                    );
                  };
                  if (widget != null) return widget;
                  throw StateError('widget is null');
                },
                title: 'AQUAN',
                debugShowCheckedModeBanner: false,
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                supportedLocales: AppLocalizations.supportedLocales,
                locale: Locale(locale),
                theme: themeState.themeData.copyWith(
                  primaryColor: color,
                  colorScheme: ColorScheme.fromSeed(
                    seedColor: color,
                  ),
                ),
                home: Scaffold(
                  backgroundColor: Colors.white,
                  body: BlocConsumer<AuthBloc, AuthState>(
                    listener: (context, state) async {
                      await Future.delayed(const Duration(seconds: 5));
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
                    },
                    builder: (context, state) {
                      return Image.asset("assets/icon/aquan-logo-gif.gif");
                    },
                  ),
                ),
              );
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

class ThemeState extends Equatable {
  final ThemeData themeData;

  const ThemeState({required this.themeData});

  @override
  List<Object> get props => [themeData];
}

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState(themeData: ThemeData.light()));

  void toggleTheme() {
    emit(state.themeData.brightness == Brightness.dark
        ? ThemeState(themeData: ThemeData.light())
        : ThemeState(themeData: ThemeData.dark()));
  }

  void setLightTheme() {
    emit(ThemeState(themeData: ThemeData.light()));
  }

  void setDarkTheme() {
    emit(ThemeState(themeData: ThemeData.dark()));
  }
}
