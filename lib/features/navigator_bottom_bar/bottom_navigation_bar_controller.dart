// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import '../../test_one.dart';
import '../Screens/settings_view.dart';
import '../accounts/presentation/pages/accounts_view.dart';
import '../buy_sell/view/buy_sell_view.dart';
import '../dashboard/view/dashboard_view.dart';
import '../profile/profile_view.dart';
import '../qr_code/view/qr_code_view.dart';
import '../send_to_account/view/send_to_account_view.dart';

class NavigatorBottomBarCnr {
  final List<Widget> pages = [
    // MyAppOne(),
    const DashboardView(),
    const SendToAccountView(),
    // const MyAppOne(),
    const BuySellview(),
    const QrCodeView(),
    // MyAppOne(),

    const SettingsScreen(),
  ];
  int currentIndex = 0;

  void setCurrentIndex(int index) async {
    currentIndex = index;
  }
}
