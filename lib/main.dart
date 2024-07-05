import 'package:aquan/Helpers/Storage.dart';
import 'package:aquan/Helpers/colors.dart';
import 'package:aquan/Helpers/settings.dart';
import 'package:aquan/Helpers/styles.dart';
import 'package:aquan/Language/bloc/language_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Helpers/app_observer.dart';
import 'app/Auth/login/view/login_view.dart';
import 'app/Widgets/language_set.dart';
import 'app/navigator_bottom_bar/navigator_bottom_bar_view.dart';
import 'app/verify_code/verify_vode_view.dart';
import 'app/sign_up/bloc/auth_bloc.dart';

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
  if (prefs.getBool("notifications") == null) {
    prefs.setBool("notifications", false);
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
  String locale = Storage.getString('language') ?? 'en';
  Color color = primary;
  bool error = false;

  setupColors() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(
      () {
        String? c = prefs.getString('color');
        if (c != null) {
          color = Color(int.parse("0x${prefs.getString('color')!}"));
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
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider<LanguageBloc>(
            create: (BuildContext context) =>
                LanguageBloc()..add(CheckLanguage()),
          ),
          BlocProvider<AuthBloc>(
            create: (BuildContext context) => AuthBloc()..add(CheckLogedIn()),
          ),
        ],
        child: MaterialApp(
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
                  child: Text(errorDetails.toString()),
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
          theme: ThemeData(
            primaryColor: color,
            colorScheme: ColorScheme.fromSeed(
              seedColor: Theme.of(context).primaryColor,
            ),
            fontFamily: "Arial",
            useMaterial3: true,
          ),
          home: Scaffold(
            backgroundColor: Colors.white,
            body: BlocBuilder<LanguageBloc, LanguageState>(
              builder: (context, state) {
                if (state is SetLanguage) {
                  return LanguageSetWidget(
                    onPress: () {
                      context.read<LanguageBloc>().add(
                            SetLocale(locale: locale),
                          );
                    },
                    onChanged: (value) => {
                      setState(
                        () {
                          locale = value!;
                        },
                      )
                    },
                  );
                }
                if (state is LanguageSeted) {
                  WidgetsBinding.instance.addPostFrameCallback(
                    (_) => setState(
                      () {
                        locale = Storage.getString('language') ?? 'en';
                      },
                    ),
                  );
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
                        if (state is AuthLogedIn) {
                          context.read<AuthBloc>().add(
                                CheckEmailVerification(),
                              );
                        }
                        if (state is EmailNotVerify) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => VerifyCode(
                                user: state.user,
                              ),
                            ),
                          );
                        }
                        if (state is EmailVerified) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const NavigateBarView(),
                            ),
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
                        return const Center(
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.white,
                            color: Colors.amber,
                          ),
                        );
                      },
                    ),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.white,
                    color: Colors.amber,
                  ),
                );
              },
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
