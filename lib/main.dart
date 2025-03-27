import 'package:aquan/all_imports.dart';
import 'package:aquan/features/main/present/view/main_view.dart';
import 'features/controll/present/bloc/controll_bloc.dart';
import 'features/controll/present/bloc/controll_event.dart';
import 'features/tasks/present/bloc/task_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  configureDependencies();
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
  // await SharedPrefHelper.clearAllData();
  if (!kReleaseMode) {
    await SharedPrefHelper.setSecuredString(
      key: SharedPrefKeys.userToken,
      value: '67|Ic8EJwfpA5g6zjZ4P5b5KsHhhgcDP7Rx9eCcv7Gobc654b09',
    );
  }
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<ControllBloc>(
          create: (context) => getIt<ControllBloc>()
            ..add(
              ControllEvent.get(),
            ),
        ),
        BlocProvider<MainBloc>(
          create: (context) => getIt<MainBloc>(),
        ),
        BlocProvider<TasksBloc>(
          create: (context) => getIt<TasksBloc>(),
        ),
      ],
      child: MyApp(
        locale: locale,
      ),
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
        child: MaterialApp(
          color: Colors.white,
          title: 'AQUAN',
          debugShowCheckedModeBanner: false,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: Locale(locale),
          home: MainView(
            ckeckEmailVeification: false,
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
