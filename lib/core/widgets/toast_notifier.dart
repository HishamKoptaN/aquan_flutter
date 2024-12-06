import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';

class ToastNotifier {
  static final ToastNotifier _instance = ToastNotifier._internal();
  factory ToastNotifier() {
    return _instance;
  }
  ToastNotifier._internal();

  void showSuccess({
    required BuildContext context,
    required String message,
  }) {
    MotionToast.success(
      description: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
    ).show(context);
  }

  void showError({
    required BuildContext context,
    required String message,
  }) {
    MotionToast.error(
      description: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
    ).show(context);
  }

  void showWarning({
    required BuildContext context,
    required String message,
  }) {
    MotionToast.warning(
      description: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
    ).show(context);
  }
}
