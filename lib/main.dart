import 'package:aquan/all_imports.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  configureDependencies();
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
    // DevicePreview(
    //   enabled: !kReleaseMode,
    //   builder: (context) => MyApp(), // Wrap your app
    // ),
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
            locale: Locale(locale),
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
                    notVerify: (data) {
                      // Navigator.pushAndRemoveUntil(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => VerifyCode(
                      //       userEmail: data.user.name,
                      //     ),
                      //   ),
                      //   (route) => false,
                      // );
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
                  state.whenOrNull();
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
