import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<bool> isUserLoggedIn() async {
    try {
      await FirebaseAuth.instance.currentUser
          ?.reload(); // ✅ تحديث بيانات المستخدم
      final user = FirebaseAuth.instance.currentUser;
      return user != null;
    } catch (e) {
      return false; // ✅ تجنب حدوث تعليق في حالة حدوث خطأ
    }
  }

  Future<void> resendVerificationEmail() async {
    User? user = _auth.currentUser;
    if (user != null && !user.emailVerified) {
      await user.sendEmailVerification();
    }
  }

  //! ✅ فحص حالة تأكيد البريد الإلكتروني
  Future<bool> isEmailVerified() async {
    User? user = _auth.currentUser;
    await user?.reload();
    return user?.emailVerified ?? false;
  }

  ///! ✅ تسجيل الخروج
  Future<void> signOut() async {
    await _auth.signOut();
  }

  void logIdToken() async {
    User? user = FirebaseAuth.instance.currentUser;
    String? idToken = await user?.getIdToken() ?? '';
    log("id token $idToken");
  }
}
