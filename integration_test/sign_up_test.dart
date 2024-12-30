// import 'package:aquan/core/helpers/app_observer.dart';
// import 'package:aquan/core/helpers/constants.dart';
// import 'package:aquan/core/helpers/shared_pref_helper.dart';
// import 'package:aquan/features/auth/login/present/view/login_view.dart';
// import 'package:aquan/features/navigator_bottom_bar/bottom_navigation_bar_view.dart';
// import 'package:aquan/firebase_options.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:integration_test/integration_test.dart';
// import 'package:aquan/core/helpers/settings.dart';
// import 'package:aquan/core/di/dependency_injection.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:firebase_core/firebase_core.dart';

// void main() async {
//   IntegrationTestWidgetsFlutterBinding.ensureInitialized();
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   await Injection.inject();
//   await ScreenUtil.ensureScreenSize();
//   SharedPrefHelper;
//   String locale = await SharedPrefHelper.getString(
//         key: SharedPrefKeys.languageCode,
//       ) ??
//       'ar';
//   FlutterError.onError = (
//     details,
//   ) {
//     FlutterError.presentError(
//       details,
//     );
//   };
//   Bloc.observer = AppBlocObserver();
//   await Settings.setup();
//   testWidgets('test login', (tester) async {
//     // قم بتشغيل التطبيق
//     await tester.pumpWidget(
//       const MaterialApp(
//         home: LoginView(),
//         locale: Locale('en'),
//       ),
//     );
//     await tester.pumpAndSettle();
//     // ابحث عن الحقول التي نحتاج لاختبارها
//     final emailField = find.byKey(const Key('email_field'));
//     final passwordField = find.byKey(const Key('password_field'));
//     final loginButton = find.byKey(const Key('sign_up_button'));
//     // تحقق من وجود الحقول
//     expect(emailField, findsOneWidget);
//     expect(passwordField, findsOneWidget);
//     expect(loginButton, findsOneWidget);
//     // إدخال اسم المستخدم وكلمة المرور
//     await tester.enterText(emailField, 'user');
//     await tester.enterText(passwordField, 'admin');
//     await tester.pump(); // تأكد من أن التحديث تم بعد إدخال النصوص
//     // اضغط على زر تسجيل الدخول
//     await tester.tap(loginButton);
//     // انتظر حتى يتم تحديث واجهة المستخدم
//     await tester.pumpAndSettle();
//     // تحقق من الانتقال إلى الشاشة التالية
//     expect(find.byType(NavigateBarView), findsOneWidget);
//   });
// }
