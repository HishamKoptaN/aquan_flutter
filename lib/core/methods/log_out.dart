import 'package:flutter/material.dart';

import '../../features/auth/login/present/view/login_view.dart';
import '../helpers/shared_pref_helper.dart';

Future<void> handleLogout(BuildContext context) async {
  await SharedPrefHelper.clearAllData();
  await SharedPrefHelper.clearAllSecuredData();
  Navigator.of(context).pushAndRemoveUntil(
    MaterialPageRoute(builder: (context) => const LoginView()),
    (route) => false,
  );
}
