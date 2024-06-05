// import 'package:aquan/Controllers/error_handling.dart';
import 'package:aquan/Helpers/Storage.dart';
import 'package:aquan/Helpers/colors.dart';
import 'package:aquan/Helpers/settings.dart';
import 'package:aquan/Helpers/styles.dart';
import 'package:aquan/Language/bloc/language_bloc.dart';
import 'package:aquan/Screens/login.dart';
import 'package:aquan/Widgets/language_set.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterError.onError = (details) {
    FlutterError.presentError(details);
  };

  SharedPreferences prefs = await SharedPreferences.getInstance();

  await Storage.init();
  await Settings.setup();
  if (prefs.getBool("fingerprints") == null) {
    prefs.setBool("fingerprints", false);
  }
  if (prefs.getBool("notifications") == null) {
    prefs.setBool("notifications", false);
  }

  runApp(const RestartWidget(child: MyApp()));
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
    setState(() {
      String? c = prefs.getString('color');
      if (c != null) {
        color = Color(int.parse("0x${prefs.getString('color')!}"));
      }
    });
  }

  @override
  void initState() {
    setupColors();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, widget) {
        FlutterError.onError = (details) async {
          FlutterError.presentError(details);

          //   await ErrorHandler.sendError(details.context!.toDescription());
          //   await ErrorHandler.sendError(details.exception.toString());

          WidgetsBinding.instance.addPostFrameCallback(
            (_) {
              setState(() => error = true);
            },
          );
        };

        ErrorWidget.builder = (errorDetails) {
          return Scaffold(
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
      home: BlocProvider<LanguageBloc>(
        create: (BuildContext context) => LanguageBloc()
          ..add(
            CheckLanguage(),
          ),
        child: BlocBuilder<LanguageBloc, LanguageState>(
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
                (_) => setState(() {
                  locale = Storage.getString('language') ?? 'en';
                }),
              );
              return LoginScreen();
            }
            return const CircularProgressIndicator();
          },
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
  // ignore: library_private_types_in_public_api
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
