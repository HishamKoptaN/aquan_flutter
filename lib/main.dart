import 'package:aquan/core/Helpers/settings.dart';
import 'package:aquan/core/di/dependency_injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/Helpers/app_observer.dart';
import 'core/Helpers/constants.dart';
import 'core/Helpers/shared_pref_helper.dart';
import 'core/networking/dio_factory.dart';
import 'core/utils/app_colors.dart';
import 'features/Auth/login/presentation/view/login_view.dart';
import 'features/Layouts/app_layout.dart';
import 'features/main/presentation/bloc/main_bloc.dart';
import 'features/main/presentation/bloc/main_event.dart';
import 'features/main/presentation/bloc/main_state.dart';
import 'features/navigator_bottom_bar/bottom_navigation_bar_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Injection.inject();
  await ScreenUtil.ensureScreenSize();
  SharedPrefHelper;
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
    MyApp(),
    // DevicePreview(
    //   enabled: !kReleaseMode,
    //   builder: (context) => MyApp(), // Wrap your app
    // ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  String locale = 'ar';
  Color color = AppColors.primary;
  @override
  Widget build(BuildContext context) {
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
            getIt(),
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
                    verified: (veified) {
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
                  );
                },
                builder: (context, state) {
                  state.whenOrNull();
                  return Image.asset("assets/icon/aquan-logo-gif.gif");
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
    // StyleColors.init();
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

Future<void> saveUserToken(String token) async {
  await SharedPrefHelper.setSecuredString(
    key: SharedPrefKeys.userToken,
    value: token,
  );
  DioFactory.setTokenIntoHeaderAfterLogin(
    token,
  );
}
