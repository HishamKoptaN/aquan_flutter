import 'package:flutter/material.dart';
import '../home_page/view/dashboard.dart';

class NavigatorBottomBarCnr {
  final List<Widget> pages = [
    const DashboardView(),
    const DashboardView(),
    const DashboardView(),
    const DashboardView(),
    const DashboardView()
  ];
  int currentIndex = 3;
  void setCurrentIndex(int index) async {
    switch (index) {
      case 0:
      case 1:
      case 2:
    }
    currentIndex = index;
  }
}
