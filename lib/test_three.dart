import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:motion_tab_bar/MotionBadgeWidget.dart';
import 'package:motion_tab_bar/MotionTabBar.dart';
import 'package:motion_tab_bar/MotionTabBarController.dart';

import 'app/qr_code/view/qr_code_view.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    super.key,
  });

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  MotionTabBarController? _motionTabBarController;

  @override
  void initState() {
    super.initState();
    _motionTabBarController = MotionTabBarController(
      initialIndex: 0,
      length: 5, // تغيير الطول إلى 5
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
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          // if (widget.route != t.support) {
          //   Navigator.of(context).push(
          //     MaterialPageRoute(
          //       builder: (context) => const SupportScreen(),
          //     ),
          //   );
          // }
        },
        child: const InkWell(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                FontAwesomeIcons.headset,
                size: 24,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: MotionTabBar(
        controller: _motionTabBarController,

        initialSelectedTab: "Home",
        useSafeArea: true,
        labels: const [
          "Dashboard",
          "Home",
          "Profile",
          "Settings",
          "More"
        ], // إضافة تسمية جديدة
        icons: const [
          Icons.home,
          Icons.task,
          FontAwesomeIcons.moneyBillTransfer,
          Icons.qr_code_2_rounded,
          Icons.settings,
        ],
        badges: [
          // const MotionBadgeWidget(
          //   text: '10+',
          //   textColor: Colors.white,
          //   color: Colors.red,
          //   size: 18,
          // ),
          // Container(
          //   color: Colors.black,
          //   padding: const EdgeInsets.all(2),
          //   child: const Text(
          //     '48',
          //     style: TextStyle(
          //       fontSize: 14,
          //       color: Colors.white,
          //     ),
          //   ),
          // ),
          // null,
          // const MotionBadgeWidget(
          //   isIndicator: true,
          //   color: Colors.red,
          //   size: 5,
          //   show: true,
          // ),
          // null, // يمكن ترك الشارة فارغة للعنصر الجديد
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
        onTabItemSelected: (int value) {
          setState(() {
            _motionTabBarController!.index = value;
          });
        },
      ),
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _motionTabBarController,
        children: <Widget>[
          QrCodeView(),
          // MainPageContentComponent(
          //     title: "Dashboard Page", controller: _motionTabBarController!),
          MainPageContentComponent(
              title: "Home Page", controller: _motionTabBarController!),
          MainPageContentComponent(
              title: "Profile Page", controller: _motionTabBarController!),
          MainPageContentComponent(
              title: "Settings Page", controller: _motionTabBarController!),
          MainPageContentComponent(
              title: "More Page",
              controller: _motionTabBarController!), // إضافة شاشة جديدة
        ],
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
            child:
                const Text('More Page'), // إضافة زر جديد للتنقل للشاشة الجديدة
          ),
        ],
      ),
    );
  }
}
