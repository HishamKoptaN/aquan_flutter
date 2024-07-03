import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Screens/settings_view.dart';
import '../convert/convert_view.dart';
import '../home_page/view/dashboard.dart';
import '../qr_code/view/qr_code_view.dart';
import '../tasks/view/tasks_view.dart';

class NavigatorBottomBarCnr extends GetxController {
  final List<Widget> pages = [
    const SettingsScreen(),
    const QrCodeView(),
    const ConvertScreen(),
    const TasksScreen(),
    const DashboardScreen(),
  ];
  int currentIndex = 4;
  void setCurrentIndex(int index) async {
    currentIndex = index;
    update();
  }
}
