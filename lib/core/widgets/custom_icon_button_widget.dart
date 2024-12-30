import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class CustomIconButtonWidget extends StatelessWidget {
  const CustomIconButtonWidget({
    super.key,
    required this.onPressed,
    this.text,
    this.buttonColor = AppColors.primaryColor,
    this.textColor = AppColors.white,
    this.widget,
    this.width,
  });

  final void Function()? onPressed;
  final String? text;
  final Color? buttonColor;
  final Color? textColor;
  final Widget? widget;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 0,
      ),
      onPressed: onPressed,
      child: widget ?? const SizedBox(),
    );
  }
}
