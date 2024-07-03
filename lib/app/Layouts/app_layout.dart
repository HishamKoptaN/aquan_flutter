import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:aquan/app/sign_up/bloc/auth_bloc.dart';
import 'package:aquan/Helpers/colors.dart';
import 'package:aquan/app/home_page/view/dashboard.dart';
import '../../Screens/settings_view.dart';
import '../convert/convert_view.dart';
import '../qr_code/view/qr_code_view.dart';
import '../support/view/support_view.dart';
import '../tasks/view/tasks_view.dart';
import '../verify_code/VerifyCode.dart';
class AppLayout extends StatefulWidget {
  const AppLayout({
    super.key,
    required this.route,
    required this.body,
    this.showBottomBar = true,
  });

  final String route;
  final Widget body;
  final bool showBottomBar;

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  bool emailVerified = true;
  final List<Map<String, dynamic>> fields = [
    {'controller': TextEditingController(), 'node': FocusNode()},
    {'controller': TextEditingController(), 'node': FocusNode()},
    {'controller': TextEditingController(), 'node': FocusNode()},
    {'controller': TextEditingController(), 'node': FocusNode()},
    {'controller': TextEditingController(), 'node': FocusNode()},
    {'controller': TextEditingController(), 'node': FocusNode()},
  ];

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final List<Map<String, dynamic>> bottomBarList = [
      {
        "name": t.home,
        "icon": Icons.home,
        "route": const DashboardScreen(),
      },
      {
        "name": t.tasks,
        "icon": Icons.task,
        "route": const TasksScreen(),
      },
      {
        "name": t.buyandsell,
        "icon": FontAwesomeIcons.moneyBillTransfer,
        "route": const ConvertScreen(),
      },
      {
        "name": t.qr_code,
        "icon": Icons.qr_code_2_rounded,
        "route": const QrCodeView(),
      },
      {
        "name": t.settings,
        "icon": Icons.settings,
        "route": const SettingsScreen(),
      },
      // {
      //   "name": t.qr_code,
      //   "icon": Icons.qr_code_2_rounded,
      //   "route": MyAppThree(),
      // },
      // {
      //   "name": t.settings,
      //   "icon": Icons.settings,
      //   "route": const PlansScreen(),
      // },
    ];
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      floatingActionButton: emailVerified && widget.route != t.support
          ? FloatingActionButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
              backgroundColor: Theme.of(context).primaryColor,
              onPressed: () {
                if (widget.route != t.support) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const SupportScreen(),
                    ),
                  );
                }
              },
              child: const InkWell(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      FontAwesomeIcons.headset,
                      size: 24,
                      color: black,
                    ),
                  ],
                ),
              ),
            )
          : const SizedBox(),
      // bottomNavigationBar: emailVerified
      //     ? AnimatedBottomNavigationBar.builder(
      //         height: 60,
      //         activeIndex: 0,
      //         itemCount: bottomBarList.length,
      //         gapWidth: 30,
      //         gapLocation: GapLocation.none,
      //         splashRadius: 20,
      //         blurEffect: true,
      //         leftCornerRadius: 30,
      //         rightCornerRadius: 30,
      //         tabBuilder: (int index, bool isActive) {
      //           Map<String, dynamic> list = bottomBarList[index];
      //           return Container(
      //             decoration: BoxDecoration(
      //               color: (list['name'] == widget.route)
      //                   ? Theme.of(context).primaryColor
      //                   : Colors.transparent,
      //               borderRadius: BorderRadius.circular(100),
      //             ),
      //             child: InkWell(
      //               splashColor: secondary,
      //               child: Padding(
      //                 padding: const EdgeInsets.all(8.0),
      //                 child: Column(
      //                   children: [
      //                     Icon(
      //                       list['icon'],
      //                       size: 24,
      //                       color: black,
      //                     ),
      //                     Text(
      //                       list['name'],
      //                       style: const TextStyle(
      //                         fontSize: 12,
      //                         color: black,
      //                       ),
      //                     )
      //                   ],
      //                 ),
      //               ),
      //             ),
      //           );
      //         },
      //         backgroundColor: Colors.grey.shade300,
      //         onTap: (index) => {
      //           if (bottomBarList[index]['name'] != widget.route)
      //             {
      //               Navigator.of(context).pushReplacement(
      //                 MaterialPageRoute(
      //                   builder: (context) => bottomBarList[index]['route'],
      //                 ),
      //               )
      //             }
      //         },
      //       )
      //     : const SizedBox(),
      body: BlocProvider<AuthBloc>(
        create: (context) => AuthBloc()..add(CheckEmailVerification()),
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is AuthLoading) {
              // Storage.setString("auth_token", '');
              // Navigator.of(context).pushAndRemoveUntil(
              //   MaterialPageRoute(
              //     builder: (context) => LoginView(logout: true),
              //   ),
              //   (route) => false,
              // );
              return Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ),
              );
            }
            if (state is SendECodeToEmail) {
              WidgetsBinding.instance.addPostFrameCallback(
                (_) => setState(() => emailVerified = false),
              );
              return VerifyCodeView(t: t, size: size, fields: fields);
            }
            if (state is EmailVerified) {
              WidgetsBinding.instance.addPostFrameCallback(
                (_) => setState(() => emailVerified = true),
              );
              return Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: widget.body,
              );
            } else {
              return Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
