import 'package:aquan/core/di/dependency_injection.dart';
import 'package:aquan/core/helpers/app_observer.dart';
import 'package:aquan/core/helpers/constants.dart';
import 'package:aquan/core/helpers/settings.dart';
import 'package:aquan/core/helpers/shared_pref_helper.dart';
import 'package:aquan/firebase_options.dart';
import 'package:aquan/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('اختبار تسجيل الدخول بنجاح', (tester) async {
    // قم بتشغيل التطبيق
    await tester.pumpWidget(MyApp(
      locale: 'ar',
    ));

    // ابحث عن الحقول التي نحتاج لاختبارها
    final emailField = find.byKey(const Key('emailField'));
    final passwordField = find.byKey(const Key('passwordField'));
    final loginButton = find.byKey(const Key('loginButton'));
    // إدخال اسم المستخدم وكلمة المرور
    await tester.enterText(emailField, 'user');
    await tester.enterText(passwordField, 'admin');
    // اضغط على زر تسجيل الدخول
    await tester.tap(loginButton);
    // انتظر حتى يتم تحديث واجهة المستخدم بعد الضغط على الزر
    await tester.pumpAndSettle();
    // تحقق من الانتقال إلى الشاشة التالية
    expect(find.byKey(const Key('NavigateBarView')), findsOneWidget);
  });
}
