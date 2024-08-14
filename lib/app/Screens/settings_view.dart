import 'package:aquan/Helpers/colors.dart';
import 'package:aquan/Helpers/storage.dart';
import 'package:aquan/app/Layouts/app_layout.dart';
import 'package:aquan/app/deposits_withdraws/view/deposits_withdraws_view.dart';
import 'package:aquan/app/Auth/login/view/login_view.dart';
import 'package:aquan/app/notifications/view/notifications_view.dart';
import 'package:aquan/app/profile/profile_view.dart';
import 'package:aquan/app/transaction/view/transactions_view.dart';
import 'package:aquan/app/Widgets/settings_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Language/view/change_language_view.dart';
import '../Plans/view/plans_view.dart';
import '../referal/referal_view.dart';
import '../support/view/support_view.dart';
import '../tasks/view/tasks_view.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  void setFingerprints(value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('fingerprints', value);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final t = AppLocalizations.of(context)!;
    return AppLayout(
      route: t.settings,
      showAppBar: true,
      backArow: false,
      body: ListView(
        children: [
          const Gap(15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: SizedBox(
              width: size.width,
              child: TextButton(
                onPressed: () {
                  WidgetsBinding.instance.addPostFrameCallback(
                    (_) => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const PlansView(),
                      ),
                    ),
                  );
                },
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20),
                  backgroundColor: amber,
                  padding: const EdgeInsets.all(15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: BorderSide(
                      color: amber,
                    ),
                  ),
                ),
                child: Text(
                  t.upgradeAccount,
                  style: const TextStyle(
                    color: black,
                    fontFamily: "Arial",
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          const Gap(10),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              t.myProfile,
              style: const TextStyle(
                color: black,
                fontSize: 18,
              ),
            ),
          ),
          const Gap(10),
          SettingsTabWidget(
            title: t.changeProfile,
            icon: FontAwesomeIcons.user,
            onTap: () => {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const ProfileView(),
                ),
              )
            },
          ),
          SettingsTabWidget(
            title: t.withdrawsAndDeposits,
            icon: FontAwesomeIcons.arrowDownUpAcrossLine,
            onTap: () => {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const WithdrawsAndDepositsView(),
                ),
              )
            },
          ),
          SettingsTabWidget(
            title: t.transactions,
            icon: FontAwesomeIcons.arrowsUpDown,
            onTap: () => {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const TransactionsScreen(),
                ),
              )
            },
          ),
          SettingsTabWidget(
            title: t.changeLanguage,
            icon: FontAwesomeIcons.language,
            onTap: () => {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const ChangeLanguage(),
                ),
              )
            },
          ),
          // IconButton(
          //   icon: const Icon(Icons.brightness_6),
          //   onPressed: () => context.read<ThemeCubit>().toggleTheme(),
          // ),
          // SettingsTabWidget(
          //   title: t.changeColor,
          //   icon: FontAwesomeIcons.brush,
          //   onTap: () {
          //     List<Widget> childs = [];
          //     colors.every(
          //       (color) {
          //         childs.add(
          //           GestureDetector(
          //             onTap: () {
          //               Storage.setString(
          //                 "color",
          //                 color.value.toRadixString(16),
          //               );

          //               RestartWidget.restartApp(context);
          //             },
          //             child: Container(
          //               height: 50,
          //               width: 50,
          //               decoration: BoxDecoration(
          //                 color: color,
          //                 borderRadius: BorderRadius.circular(100),
          //               ),
          //             ),
          //           ),
          //         );

          //         return true;
          //       },
          //     );
          //     showModalBottomSheet(
          //       useRootNavigator: true,
          //       useSafeArea: true,
          //       enableDrag: true,
          //       context: context,
          //       builder: (context) {
          //         return Container(
          //           height: size.height * .5,
          //           width: size.width,
          //           padding: const EdgeInsets.all(10),
          //           child: Wrap(
          //             spacing: 10,
          //             runSpacing: 10,
          //             children: childs,
          //           ),
          //         );
          //       },
          //     );
          //   },
          // ),
          SettingsTabWidget(
            title: t.enableNotifications,
            icon: FontAwesomeIcons.bell,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NotificationsView(),
                ),
              );
            },
          ),
          SettingsTabWidget(
            title: t.biometricsButton,
            icon: FontAwesomeIcons.fingerprint,
            onTap: () {
              showBiometricBottomSheet(context);
            },
          ),
          SettingsTabWidget(
            title: t.tasks,
            icon: Icons.task,
            onTap: () => {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const TasksScreen(),
                ),
              )
            },
          ),
          SettingsTabWidget(
            title: t.referals,
            icon: Icons.verified_user_outlined,
            onTap: () => {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const ReferalView(),
                ),
              )
            },
          ),
          const Gap(10),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              t.more,
              style: const TextStyle(
                color: black,
                fontSize: 18,
              ),
            ),
          ),
          SettingsTabWidget(
            title: t.support,
            icon: FontAwesomeIcons.headset,
            onTap: () => {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const SupportScreen(),
                ),
              ),
            },
          ),
          SettingsTabWidget(
            title: t.shareApp,
            icon: FontAwesomeIcons.share,
            onTap: () => {
              Share.share(Storage.getString("app_link") ?? 'AQUAN app'),
            },
          ),
          SettingsTabWidget(
            title: t.aboutUs,
            icon: FontAwesomeIcons.info,
            onTap: () async {
              Uri url = Uri.parse(
                  Storage.getString("about_us_link") ?? 'htpps://google.com');
              if (!await launchUrl(url)) {
                throw Exception('Could not launch $url');
              }
            },
          ),
          SettingsTabWidget(
            title: t.logout,
            icon: FontAwesomeIcons.arrowRightFromBracket,
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    title: Center(
                      child: Text(
                        t.logout,
                        style: const TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          t.areYouSure,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        const Divider(thickness: 1),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: TextButton(
                                onPressed: () async {
                                  Storage.setString("auth_token", '');
                                  Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                      builder: (context) => const LoginView(),
                                    ),
                                    (route) => false,
                                  );
                                },
                                child: Text(
                                  t.logout,
                                  style: const TextStyle(
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 40,
                              width: 1,
                              color: Colors.grey,
                            ),
                            Expanded(
                              child: TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  t.close,
                                  style: const TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
          const Gap(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () async {
                  Uri url = Uri.parse(Storage.getString("facebook_link") ??
                      'htpps://facebook.com');
                  if (!await launchUrl(url)) {
                    throw Exception('Could not launch $url');
                  }
                },
                icon: const Icon(FontAwesomeIcons.facebook),
              ),
              IconButton(
                onPressed: () async {
                  Uri url = Uri.parse(Storage.getString("instagram_link") ??
                      'htpps://instagram.com');
                  if (!await launchUrl(url)) {
                    throw Exception('Could not launch $url');
                  }
                },
                icon: const Icon(FontAwesomeIcons.instagram),
              ),
              IconButton(
                onPressed: () async {
                  Uri url = Uri.parse(Storage.getString("whatsapp_link") ??
                      'htpps://whatsapp.com');
                  if (!await launchUrl(url)) {
                    throw Exception('Could not launch $url');
                  }
                },
                icon: const Icon(FontAwesomeIcons.whatsapp),
              )
            ],
          ),
          const Gap(20),
          Text(
            t.copyrights,
            textAlign: TextAlign.center,
          ),
          const Gap(50),
        ],
      ),
    );
  }

  void showBiometricBottomSheet(BuildContext context) {
    showModalBottomSheet(
      useRootNavigator: true,
      useSafeArea: true,
      enableDrag: true,
      context: context,
      builder: (context) {
        final size = MediaQuery.of(context).size;
        return Container(
          height: size.height * .2,
          width: size.width,
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Biometrics Authentication', // استخدم النص الخاص بك هنا
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 20),
              CupertinoSwitch(
                value: Storage.getBool("fingerprints", defaultValue: false) ??
                    false,
                onChanged: (value) async {
                  final prefs = await SharedPreferences.getInstance();
                  await prefs.setBool('fingerprints', value);
                  await Future.delayed(const Duration(microseconds: 50));
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
