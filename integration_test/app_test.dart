import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:aquan/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding binding =
      IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('test login', (WidgetTester tester) async {
    //! بدء التطبيق
    await app.main();
    await tester.pumpAndSettle();
    //! البحث عن واجهة تسجيل الدخول والتأكد من وجودها
    expect(find.byKey(const Key('login_view')), findsOneWidget);
    //! البحث عن حقول الإدخال وإدخال البيانات
    await tester.enterText(
        find.byKey(const Key('email_field')), 'manager@example.com');
    await tester.enterText(find.byKey(const Key('password_field')), 'password');
    //! النقر على زر تسجيل الدخول
    await tester.tap(find.byKey(const Key('login_button')));
    await tester.pumpAndSettle();
    //! التحقق من أن شريط التنقل موجود بعد تسجيل الدخول
    expect(find.byKey(const Key('dash_view')), findsOneWidget);
    final String screenshotPath =
        '${Directory.current.path}/test_screenshots/login_test.png';
    await binding.takeScreenshot('login_test');
    print('Screenshot saved at $screenshotPath');
  });
}
