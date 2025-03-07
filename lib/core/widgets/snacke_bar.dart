import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:delightful_toast/toast/utils/enums.dart';
import '../../all_imports.dart';

enum ToastType { success, failure }

class CustomToast {
  // دالة لعرض Toast مع تخصيص العنوان والأيقونة بناءً على نوع الحالة
  static void showToast({
    Key? key, // إضافة النوع (نجاح أو فشل)
    required BuildContext context,
    required String title,
    Icon? leadingIcon,
    double iconSize = 28,
    TextStyle? titleStyle,
    ToastType toastType = ToastType.success,
  }) {
    // تخصيص الأيقونة ولون الخلفية بناءً على نوع الحالة
    Icon toastIcon;
    Color toastBackgroundColor;

    switch (toastType) {
      case ToastType.success:
        toastIcon = const Icon(
          Icons.check_circle,
          size: 28,
          color: Colors.green, // لون أيقونة النجاح
        );
        toastBackgroundColor = Colors.green.shade100; // خلفية النجاح
        break;
      case ToastType.failure:
        toastIcon = const Icon(
          Icons.error,
          size: 28,
          color: Colors.red, // لون أيقونة الفشل
        );
        toastBackgroundColor = Colors.red.shade100; // خلفية الفشل
        break;
    }

    DelightToastBar(
      position: DelightSnackbarPosition.bottom,
      snackbarDuration: const Duration(seconds: 3),
      autoDismiss: true,
      builder: (context) => SizedBox(
        width: 200.w,
        child: Container(
          color: toastBackgroundColor, // تحديد اللون كخلفية باستخدام Container
          child: ToastCard(
            leading: leadingIcon ?? toastIcon,
            title: Text(
              title,
              style: titleStyle ??
                  const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
            ),
          ),
        ),
      ),
    ).show(context);
  }
}
