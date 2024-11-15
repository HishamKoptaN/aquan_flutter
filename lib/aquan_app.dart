import 'package:aquan/core/Helpers/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/utils/app_colors.dart';

class AquanApp extends StatelessWidget {
  final AppRouter appRouter;
  const AquanApp({super.key, required this.appRouter});

  // String locale = Storage.getString('language') ?? 'ar';

  // Color color = AppColors.primary;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: ScreenUtilInit(
        designSize: Size(
          width,
          height,
        ),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MaterialApp(
          title: "",
          theme: ThemeData(primaryColor: AppColors.amber),
          onGenerateRoute: appRouter.generateRoutes,
        ),

        // BlocProvider(
        //   create: (context) => SignUpBloc()..add(CheckLogedIn()),
        //   child: MaterialApp(
        //     color: Colors.white,
        //     title: 'AQUAN',
        //     debugShowCheckedModeBanner: false,
        //     localizationsDelegates: AppLocalizations.localizationsDelegates,
        //     supportedLocales: AppLocalizations.supportedLocales,
        //     locale: Locale(locale),
        //     home: Scaffold(
        //       backgroundColor: Colors.white,
        //       body: BlocConsumer<SignUpBloc, SignUpState>(
        //         listener: (context, state) async {
        //           if (state is AuthLogedIn) {
        //             Navigator.pushAndRemoveUntil(
        //               context,
        //               MaterialPageRoute(
        //                 builder: (context) => const NavigateBarView(),
        //               ),
        //               (route) => false,
        //             );
        //           }
        //           if (state is EmailNotVerify) {
        //             Navigator.pushAndRemoveUntil(
        //               context,
        //               MaterialPageRoute(
        //                 builder: (context) => VerifyCode(
        //                   user: state.user,
        //                 ),
        //               ),
        //               (route) => false,
        //             );
        //           }
        //           if (state is EmailVerified) {
        //             Navigator.pushAndRemoveUntil(
        //               context,
        //               MaterialPageRoute(
        //                 builder: (context) => const NavigateBarView(),
        //               ),
        //               (route) => false,
        //             );
        //           }

        //           if (state is AuthLogedOut) {
        //             Navigator.of(context).pushAndRemoveUntil(
        //               MaterialPageRoute(
        //                 builder: (context) => const LoginView(),
        //               ),
        //               (route) => false,
        //             );
        //           }
        //           if (state is AuthErrors) {
        //             ScaffoldMessenger.of(context)
        //               ..hideCurrentSnackBar()
        //               ..showSnackBar(
        //                 snackBar(
        //                   status: false,
        //                   message: state.message!,
        //                 ),
        //               );
        //           }
        //         },
        //         builder: (context, state) {
        //           return
        //               // const LoginView();
        //               Image.asset("assets/icon/aquan-logo-gif.gif");
        //         },
        //       ),
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
