import 'package:aquan/features/profile/present/profile_view.dart';
import 'package:aquan/features/widgets/settings_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/helpers/constants.dart';
import '../../core/helpers/shared_pref_helper.dart';
import '../auth/login/present/view/login_view.dart';
import '../deposit/pesent/view/deposits_view/deposits_view.dart';
import '../language/view/change_language_view.dart';
import '../layouts/app_layout.dart';
import '../notifications/present/view/notifications_view.dart';
import '../plans/present/view/plans_view/plans_view.dart';
import '../support/view/support_view.dart';
import '../tasks/present/bloc/view/tasks_view.dart';
import '../trans/present/view/trans_view.dart';
import '../withdraw/present/view/withdraws_view.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  void setFingerprints(value) async {
    await SharedPrefHelper.setData(
      key: SharedPrefKeys.fingerprints,
      value: value,
    );
  }

  Future<bool> getFingerprints() async {
    return await SharedPrefHelper.getBool(
      key: SharedPrefKeys.fingerprints,
    );
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
                  backgroundColor: Colors.amber,
                  padding: const EdgeInsets.all(15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: const BorderSide(
                      color: Colors.amber,
                    ),
                  ),
                ),
                child: Text(
                  t.upgradeAccount,
                  style: const TextStyle(
                    color: Colors.black,
                    fontFamily: "Arial",
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              t.myProfile,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ),
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
            title: t.withdraws,
            icon: FontAwesomeIcons.arrowDownUpAcrossLine,
            onTap: () => {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const WithdrawsView(),
                ),
              )
            },
          ),
          SettingsTabWidget(
            title: t.deposits,
            icon: FontAwesomeIcons.arrowDownUpAcrossLine,
            onTap: () => {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const DepositsView(),
                ),
              )
            },
          ),
          // SettingsTabWidget(
          //   title: t.withdrawsAndDeposits,
          //   icon: FontAwesomeIcons.arrowDownUpAcrossLine,
          //   onTap: () => {
          //     Navigator.of(context).push(
          //       MaterialPageRoute(
          //         builder: (context) => const WithdrawsAndDepositsView(),
          //       ),
          //     )
          //   },
          // ),
          SettingsTabWidget(
            title: t.transactions,
            icon: FontAwesomeIcons.arrowsUpDown,
            onTap: () => {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const TransactionsView(),
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
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const TasksScreen(),
                ),
              );
            },
          ),
          // SettingsTabWidget(
          //   title: t.referals,
          //   icon: Icons.verified_user_outlined,
          //   onTap: () => {
          //     Navigator.of(context).push(
          //       MaterialPageRoute(
          //         builder: (context) => const ReferalView(),
          //       ),
          //     )
          //   },
          // ),
          const Gap(10),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              t.more,
              style: const TextStyle(
                color: Colors.black,
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
                  builder: (context) => const SupportView(),
                ),
              ),
            },
          ),
          SettingsTabWidget(
            title: t.shareApp,
            icon: FontAwesomeIcons.share,
            onTap: () async {
              Share.share(await SharedPrefHelper.getString(key: "app_link") ??
                  'AQUAN app');
            },
          ),
          SettingsTabWidget(
            title: t.aboutUs,
            icon: FontAwesomeIcons.info,
            onTap: () async {
              Uri url = Uri.parse(
                  await SharedPrefHelper.getString(key: "about_us_link") ??
                      'htpps://google.com');
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
                                  await SharedPrefHelper.clearAllSecuredData();
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
                  Uri url = Uri.parse(
                      await SharedPrefHelper.getString(key: "facebook_link") ??
                          'htpps://facebook.com');
                  if (!await launchUrl(url)) {
                    throw Exception('Could not launch $url');
                  }
                },
                icon: const Icon(FontAwesomeIcons.facebook),
              ),
              IconButton(
                onPressed: () async {
                  Uri url = Uri.parse(
                      await SharedPrefHelper.getString(key: "instagram_link") ??
                          'htpps://instagram.com');
                  if (!await launchUrl(url)) {
                    throw Exception('Could not launch $url');
                  }
                },
                icon: const Icon(FontAwesomeIcons.instagram),
              ),
              IconButton(
                onPressed: () async {
                  Uri url = Uri.parse(
                    await SharedPrefHelper.getString(key: "whatsapp_link") ??
                        "",
                  );
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

  void showBiometricBottomSheet(BuildContext context) async {
    showModalBottomSheet(
      useRootNavigator: true,
      useSafeArea: true,
      enableDrag: true,
      context: context,
      builder: (context) {
        final size = MediaQuery.of(context).size;
        return FutureBuilder<bool>(
          future: getFingerprints(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return const Center(
                child: Text('Error loading biometric settings.'),
              );
            }
            bool initValue = snapshot.data ?? false;

            return StatefulBuilder(
              builder: (context, setState) {
                return Container(
                  height: size.height * .2,
                  width: size.width,
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Biometrics Authentication',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 20),
                      CupertinoSwitch(
                        value: initValue,
                        onChanged: (value) async {
                          setState(
                            () {
                              initValue = value;
                            },
                          );
                          setFingerprints(
                            value,
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
