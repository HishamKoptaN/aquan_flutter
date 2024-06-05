import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:aquan/Helpers/storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:aquan/Auth/bloc/auth_bloc.dart';
import 'package:aquan/Helpers/colors.dart';
import 'package:aquan/Helpers/styles.dart';
import 'package:aquan/Screens/convert.dart';
import 'package:aquan/Screens/dashboard.dart';
import 'package:aquan/Screens/notifications.dart';
import 'package:aquan/Screens/profile.dart';
import 'package:aquan/Screens/referal.dart';
import 'package:aquan/Screens/settings.dart';
import 'package:aquan/Screens/support.dart';
import 'package:aquan/Screens/tasks.dart';

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
  final iconList = <IconData>[
    Icons.brightness_5,
    Icons.brightness_4,
    Icons.brightness_6,
    Icons.brightness_7,
  ];

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
        "name": t.referals,
        "icon": Icons.verified_user_outlined,
        "route": const ReferalScreen(),
      },
      {
        "name": t.settings,
        "icon": Icons.settings,
        "route": const SettingsScreen(),
      },
    ];
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 2,
        leading: const SizedBox(),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.route != t.changeProfile && emailVerified)
                SizedBox(
                  width: 30,
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProfileScreen(),
                        ),
                      ).then((value) => setState(() => {}));
                    },
                    icon: const FaIcon(
                      FontAwesomeIcons.user,
                      color: black,
                      size: 16,
                    ),
                  ),
                ),
            ],
          ),
          Expanded(
            child: Text(
              widget.route,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          if (widget.route != t.notifications && emailVerified)
            SizedBox(
              width: 30,
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NotificationsScreen(),
                    ),
                  ).then((value) => setState(() => {}));
                },
                icon: const FaIcon(
                  FontAwesomeIcons.bell,
                  color: black,
                  size: 16,
                ),
              ),
            ),
          (Navigator.of(context).canPop())
              ? IconButton(
                  icon: Icon(
                    Storage.getString('language') == 'en'
                        ? FontAwesomeIcons.angleRight
                        : FontAwesomeIcons.angleLeft,
                    color: black,
                  ),
                  onPressed: () {
                    if (Navigator.of(context).canPop()) {
                      Navigator.of(context).pop();
                    }
                  },
                )
              : const SizedBox(
                  width: 30,
                ),
        ],
      ),
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
      bottomNavigationBar: emailVerified && widget.showBottomBar
          ? AnimatedBottomNavigationBar.builder(
              height: 60,
              activeIndex: 0,
              itemCount: bottomBarList.length,
              gapWidth: 30,
              gapLocation: GapLocation.none,
              splashRadius: 20,
              blurEffect: true,
              leftCornerRadius: 30,
              rightCornerRadius: 30,

              tabBuilder: (int index, bool isActive) {
                Map<String, dynamic> list = bottomBarList[index];
                return Container(
                  decoration: BoxDecoration(
                    color: (list['name'] == widget.route)
                        ? Theme.of(context).primaryColor
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: InkWell(
                    splashColor: secondary,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Icon(
                            list['icon'],
                            size: 24,
                            color: black,
                          ),
                          Text(
                            list['name'],
                            style: const TextStyle(
                              fontSize: 12,
                              color: black,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
              backgroundColor: Colors.grey.shade300,
              onTap: (index) => {
                if (bottomBarList[index]['name'] != widget.route)
                  {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => bottomBarList[index]['route'],
                      ),
                    )
                  }
              },
              //other params
            )
          : const SizedBox(),
      body: BlocProvider<AuthBloc>(
        create: (context) => AuthBloc()..add(CheckEmailVerification()),
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is AuthLoading) {
              return Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ),
              );
            }

            if (state is EmailVerified) {
              if (state.verified) {
                return widget.body;
              } else {
                WidgetsBinding.instance.addPostFrameCallback(
                  (_) => setState(() => emailVerified = false),
                );

                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          t.verifyEmail,
                          style: cartHeading,
                        ),
                      ),
                    ),
                    const Gap(20),
                    Center(
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          t.verifyEmailText,
                          style: cartHeading,
                        ),
                      ),
                    ),
                    const Gap(20),
                    if (state.message != null)
                      Container(
                        padding: const EdgeInsets.all(15),
                        width: size.width - 20,
                        decoration: const BoxDecoration(
                          color: danger,
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        child: Text(
                          state.message!,
                          style: const TextStyle(
                            color: white,
                          ),
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Directionality(
                        textDirection: TextDirection.ltr,
                        child: SizedBox(
                          height: (size.width - 20 - 5 * 6) / 6,
                          width: size.width,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return const Gap(5);
                            },
                            separatorBuilder: (context, index) {
                              return Container(
                                width: (size.width - 20 - 5 * 6) / 6,
                                height: (size.width - 20 - 5 * 6) / 6,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: TextFormField(
                                  controller: fields[index]['controller'],
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    counterText: "",
                                  ),
                                  keyboardType: TextInputType.number,
                                  onChanged: (value) {
                                    if (index <= 5) {
                                      FocusScope.of(context).nextFocus();
                                    }
                                  },
                                  textAlign: TextAlign.center,
                                  maxLength: 1,
                                  showCursor: false,
                                  style: const TextStyle(
                                    color: white,
                                    fontSize: 30,
                                  ),
                                ),
                              );
                            },
                            itemCount: 7,
                          ),
                        ),
                      ),
                    ),
                    const Gap(20),
                    SizedBox(
                      width: size.width - 30,
                      child: TextButton(
                        onPressed: () {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            String code = "";
                            fields.every((e) {
                              code = code + e['controller'].text;
                              return true;
                            });

                            context
                                .read<AuthBloc>()
                                .add(VerifyEmail(code: code));
                          });
                        },
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 20),
                          backgroundColor: Theme.of(context).primaryColor,
                          padding: const EdgeInsets.all(15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: BorderSide(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                        child: Text(
                          t.submit,
                          style: const TextStyle(
                            color: white,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }
            }

            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            );
          },
        ),
      ),
    );
  }
}
