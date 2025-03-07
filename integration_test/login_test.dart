// import 'dart:io';
// import 'dart:developer';
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:integration_test/integration_test.dart';
// import 'package:aquan/main.dart' as app;

// void main() {
//   IntegrationTestWidgetsFlutterBinding binding =
//       IntegrationTestWidgetsFlutterBinding.ensureInitialized();

//   testWidgets(
//     'test login',
//     (tester) async {
//       try {
//         //! بدء التطبيق
//         await app.main();
//         await tester.pumpAndSettle();
//         //! البحث عن واجهة تسجيل الدخول والتأكد من وجودها
//         expect(find.byKey(const Key('login_view')), findsOneWidget,
//             reason: 'Login view not found.');
//         //! البحث عن حقول الإدخال وإدخال البيانات
//         await tester.enterText(
//             find.byKey(const Key('email_field')), 'manager@example.com');
//         await tester.enterText(
//             find.byKey(const Key('password_field')), 'password');
//         await binding.convertFlutterSurfaceToImage();
//         await tester.pumpAndSettle();
//         await binding.takeScreenshot('test-screenshot');
//         final bytes = await binding.takeScreenshot('test-screenshot');
//         final screenshotDir =
//             Directory('${Directory.current.path}/screenshots');

//         if (!screenshotDir.existsSync()) {
//           screenshotDir.createSync(recursive: true);
//         }
//         final filePath = '${screenshotDir.path}/login_test.png';
//         final file = File(filePath);
//         await file.writeAsBytes(bytes); // كتابة الصورة كملف
//         //! النقر على زر تسجيل الدخول
//         await tester.tap(find.byKey(const Key('login_button')));
//         await tester.pumpAndSettle();
//         //! التحقق من أن شريط التنقل موجود بعد تسجيل الدخول
//         expect(find.byKey(const Key('dash_view')), findsOneWidget,
//             reason: 'Dashboard view not found.');
//         //! حفظ لقطة الشاشة
//         log('Screenshot saved ');
//       } catch (e) {
//         log('Error occurred during the test: $e');
//       }
//     },
//   );
// }
