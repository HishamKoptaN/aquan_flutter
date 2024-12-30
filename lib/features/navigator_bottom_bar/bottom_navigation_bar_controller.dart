// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import '../../test_one.dart';
import '../views/settings_view.dart';
import '../accounts/presentation/pages/accounts_view.dart';
import '../buy_sell/present/view/buy_sell_view.dart';
import '../dash/present/view/dash_view.dart';
import '../profile/present/profile_view.dart';
import '../qr_code/view/qr_code_view.dart';
import '../send_to_account/present/view/send_to_account_view.dart';

class NavigatorBottomBarCnr {
  final List<Widget> pages = [
    const DashView(),
    const SendToAccountView(),
    const BuySellview(),
    const QrCodeView(),
    const SettingsScreen(),
  ];
  int currentIndex = 0;
  void setCurrentIndex(int index) async {
    currentIndex = index;
  }
}
