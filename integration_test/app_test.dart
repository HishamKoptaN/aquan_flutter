import 'dart:io';
import 'dart:ui';
import 'package:aquan/features/auth/login/present/view/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:aquan/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("التقاط صورة لواجهة تسجيل الدخول وحفظها في جذر المشروع",
      (WidgetTester tester) async {
    print("اختبار البداية");
    // إعداد FlutterError.onError
    final originalErrorHandler = FlutterError.onError;
    FlutterError.onError = (FlutterErrorDetails details) {
      print("تم التعامل مع الخطأ: ${details.exception}");
      originalErrorHandler!(details);
    };
    try {
      print("بدء تشغيل التطبيق");
      // تشغيل التطبيق مع واجهة تسجيل الدخول
      await app.main();
      await tester.pumpAndSettle(); // التأكد من استقرار واجهة المستخدم
      print("تم تحميل واجهة تسجيل الدخول");
      // البحث عن LoginView باستخدام النوع
      final loginViewFinder = find.byType(LoginView);
      print("البحث عن LoginView");
      // التأكد من أن LoginView موجود
      expect(loginViewFinder, findsOneWidget);
      // تحديد RenderRepaintBoundary لواجهة تسجيل الدخول
      final boundary = tester.firstRenderObject(loginViewFinder);
      if (boundary is RenderRepaintBoundary) {
        // التقاط الصورة فقط إذا كان الكائن من النوع RenderRepaintBoundary
        final image = await boundary.toImage(pixelRatio: 3.0);
        final byteData = await image.toByteData(format: ImageByteFormat.png);
        if (byteData != null) {
          // تحديد مسار مجلد "screenshots" في جذر المشروع
          final projectDirectory =
              Directory('${Directory.current.path}/screenshots');
          // التأكد من أن المجلد موجود أو إنشاؤه
          if (!await projectDirectory.exists()) {
            await projectDirectory.create(recursive: true);
          }
          // تحديد اسم الصورة وحفظها
          final filePath =
              '${projectDirectory.path}/screenshot_${DateTime.now().millisecondsSinceEpoch}.png';
          final file = File(filePath);
          await file.writeAsBytes(byteData.buffer.asUint8List());

          // طباعة مسار الصورة
          print('تم حفظ الصورة بنجاح في: $filePath');
        } else {
          print("لم يتمكن من استخراج البيانات من الصورة");
        }
      } else {
        print("الكائن الذي تم تحديده ليس من نوع RenderRepaintBoundary");
      }
    } catch (e) {
      print("حدث خطأ: $e");
    } finally {
      // استعادة FlutterError.onError إلى حالته الأصلية
      FlutterError.onError = originalErrorHandler;
    }
  });
}
