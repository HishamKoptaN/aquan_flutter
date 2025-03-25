import 'package:flutter/material.dart';
import '../../features/auth/login/present/view/login_view.dart';
import '../helpers/shared_pref_helper.dart';
import 'authentication_helper.dart';

Future<void> handleLogout({
  required BuildContext context,
}) async {
  AuthService authService = AuthService();

  await SharedPrefHelper.clearAllData();
  await SharedPrefHelper.clearAllSecuredData();
  await authService.signOut();

  Navigator.of(context).pushAndRemoveUntil(
    MaterialPageRoute(builder: (context) => const LoginView()),
    (route) => false,
  );
}
