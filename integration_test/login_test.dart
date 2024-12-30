import 'package:aquan/features/auth/login/present/view/login_view.dart';
import 'package:aquan/features/navigator_bottom_bar/bottom_navigation_bar_view.dart';
import 'package:aquan/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:aquan/main.dart' as app;

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets(
    'start app',
    (tester) async {
      // إذا لم يكن المستخدم قد سجل الدخول، سنعرض الـ LoginView
      app.main();
      await tester.pumpAndSettle();
      await tester.pumpWidget(
        MyApp(
          locale: 'ar',
        ),
      );
      // انتظار حتى تحميل الصفحة
      await tester.pumpAndSettle();
      expect(
        find.byType(LoginView),
        findsOneWidget,
      );
    },
  );
  testWidgets(
    'test login',
    (tester) async {
      // ابحث عن الحقول التي نحتاج لاختبارها
      final emailField = find.byKey(
        const Key(
          'emailField',
        ),
      );
      final passwordField = find.byKey(
        const Key(
          'passwordField',
        ),
      );
      final loginButton = find.byKey(
        const Key(
          'loginButton',
        ),
      );
      // تحقق من وجود الحقول
      expect(
        emailField,
        findsOneWidget,
      );
      await tester.enterText(
        emailField,
        'user',
      );
      expect(
        passwordField,
        findsOneWidget,
      );
      await tester.enterText(
        passwordField,
        'admin',
      );
      expect(
        loginButton,
        findsOneWidget,
      );
      // تأكد من أن التحديث تم بعد إدخال النصوص
      await tester.pump();
      // اضغط على زر تسجيل الدخول
      await tester.tap(
        loginButton,
      );
      // انتظر حتى يتم تحديث واجهة المستخدم
      await tester.pumpAndSettle();
      // تحقق من الانتقال إلى الشاشة التالية
      expect(
        find.byType(
          NavigateBarView,
        ),
        findsOneWidget,
      );
    },
  );
}
