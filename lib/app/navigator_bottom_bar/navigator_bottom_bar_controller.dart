import 'package:flutter/material.dart';

import '../../Screens/settings_view.dart';
import '../convert/convert_view.dart';
import '../home_page/view/dashboard.dart';
import '../qr_code/view/qr_code_view.dart';
import '../tasks/view/tasks_view.dart';

class NavigatorBottomBarCnr {
  final List<Widget> pages = [
    const DashboardScreen(),
    const TasksScreen(),
    const ConvertScreen(),
    const QrCodeView(),
    const SettingsScreen(),
  ];
  int currentIndex = 0;

  void setCurrentIndex(int index) async {
    currentIndex = index;
  }
}
