import 'package:aquan/Helpers/colors.dart';
import 'package:aquan/Helpers/storage.dart';
import 'package:aquan/Helpers/styles.dart';
import 'package:aquan/app/Layouts/app_layout.dart';
import 'package:aquan/Language/view/change_language_view.dart';
import 'package:aquan/app/deposit/view/deposits_withdraws_view.dart';
import 'package:aquan/app/Auth/login/view/login_view.dart';
import 'package:aquan/app/notifications/notifications_view.dart';
import 'package:aquan/app/profile/profile_view.dart';
import 'package:aquan/Screens/send_to_account.dart';
import 'package:aquan/app/transaction/view/transactions_view.dart';
import 'package:aquan/app/Widgets/primary_button.dart';
import 'package:aquan/app/Widgets/settings_tab.dart';
import 'package:aquan/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import '../app/Plans/view/plans_view.dart';

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
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              t.appSettings,
              style: cartHeading,
            ),
          ),
          const Gap(10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: SizedBox(
              width: size.width,
              child: TextButton(
                onPressed: () {
                  WidgetsBinding.instance.addPostFrameCallback(
                    (_) => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const PlansScreen(),
                    )),
                  );
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
                  builder: (context) => const ProfileScreen(),
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
                  builder: (context) => const WithdrawsAndDepositsScreen(),
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
          SettingsTabWidget(
            title: t.changeColor,
            icon: FontAwesomeIcons.brush,
            onTap: () {
              List<Widget> childs = [];

              colors.every(
                (color) {
                  childs.add(
                    GestureDetector(
                      onTap: () {
                        Storage.setString(
                          "color",
                          color.value.toRadixString(16),
                        );

                        RestartWidget.restartApp(context);
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: color,
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ),
                  );

                  return true;
                },
              );
              showModalBottomSheet(
                useRootNavigator: true,
                useSafeArea: true,
                enableDrag: true,
                context: context,
                builder: (context) {
                  return Container(
                    height: size.height * .5,
                    width: size.width,
                    padding: const EdgeInsets.all(10),
                    child: Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: childs,
                    ),
                  );
                },
              );
            },
          ),
          SettingsTabWidget(
            title: t.enableNotifications,
            icon: FontAwesomeIcons.bell,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NotificationsScreen(),
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
            title: t.sendToAnOtherAccount,
            icon: FontAwesomeIcons.connectdevelop,
            onTap: () => {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const SendToAccount(),
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
                  builder: (context) => const SendToAccount(),
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
                  return Center(
                    child: Container(
                      height: 130,
                      width: size.width * .75,
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            t.areYouSure,
                            style: cartHeading.copyWith(
                              decoration: TextDecoration.none,
                            ),
                          ),
                          const Gap(30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: PrimaryButton(
                                  text: t.submit,
                                  padding: 10,
                                  onPressed: () {
                                    Storage.setString("auth_token", '');
                                    Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            LoginView(logout: true),
                                      ),
                                      (route) => false,
                                    );
                                  },
                                ),
                              ),
                              const Gap(20),
                              Expanded(
                                child: PrimaryButton(
                                  text: t.annuler,
                                  bgColor: Colors.red.shade400,
                                  padding: 10,
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
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
