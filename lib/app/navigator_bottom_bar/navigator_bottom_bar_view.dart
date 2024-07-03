// ignore_for_file: unused_import
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:motion_tab_bar/MotionBadgeWidget.dart';
import 'package:motion_tab_bar/MotionTabBar.dart';
import 'package:motion_tab_bar/MotionTabBarController.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'navigator_bottom_bar_controller.dart';

class NavigateBarScreen extends StatefulWidget {
  const NavigateBarScreen({super.key});
  @override
  State<NavigateBarScreen> createState() => _NavigateBarScreenState();
}

class _NavigateBarScreenState extends State<NavigateBarScreen>
    with TickerProviderStateMixin {
  MotionTabBarController? _motionTabBarController;

  @override
  void initState() {
    super.initState();
    _motionTabBarController = MotionTabBarController(
      initialIndex: 1,
      length: 5,
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _motionTabBarController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    return Directionality(
      textDirection: TextDirection.ltr,
      child: GetBuilder<NavigatorBottomBarCnr>(
        init: NavigatorBottomBarCnr(),
        builder: (cnr) {
          return Scaffold(
            resizeToAvoidBottomInset: true,
            body: SizedBox(child: cnr.pages[cnr.currentIndex]),
            bottomNavigationBar: MotionTabBar(
              controller: _motionTabBarController,
              initialSelectedTab: t.home,
              useSafeArea: true,
              labels: [
                t.settings,
                t.qr_code,
                t.buyandsell,
                t.tasks,
                t.home,
              ],
              icons: const [
                Icons.settings,
                Icons.qr_code_2_rounded,
                FontAwesomeIcons.moneyBillTransfer,
                Icons.task,
                Icons.home,
              ],
              tabSize: 50,
              tabBarHeight: 55,
              textStyle: TextStyle(
                fontSize: 10.sp,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
              tabIconColor: Colors.amber,
              tabIconSize: 28.0,
              tabIconSelectedSize: 26.0,
              tabSelectedColor: Colors.white,
              tabIconSelectedColor: Colors.amber,
              tabBarColor: Colors.white,
              onTabItemSelected: (int index) async {
                cnr.setCurrentIndex(index);
                setState(() {
                  _motionTabBarController!.index = index;
                });
              },
            ),
          );
        },
      ),
    );
  }
}

class MainPageContentComponent extends StatelessWidget {
  const MainPageContentComponent({
    required this.title,
    required this.controller,
    Key? key,
  }) : super(key: key);

  final String title;
  final MotionTabBarController controller;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title,
              style:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 50),
          const Text('Go to "X" page programmatically'),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () => controller.index = 0,
            child: const Text('Dashboard Page'),
          ),
          ElevatedButton(
            onPressed: () => controller.index = 1,
            child: const Text('Home Page'),
          ),
          ElevatedButton(
            onPressed: () => controller.index = 2,
            child: const Text('Profile Page'),
          ),
          ElevatedButton(
            onPressed: () => controller.index = 3,
            child: const Text('Settings Page'),
          ),
          ElevatedButton(
            onPressed: () => controller.index = 4,
            child: const Text('More Page'),
          ),
        ],
      ),
    );
  }
}
