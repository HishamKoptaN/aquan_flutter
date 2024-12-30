import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/app_colors.dart';
import 'custom_text_widget.dart';

class CustomTextButtonWidget extends StatelessWidget {
  const CustomTextButtonWidget({
    super.key,
    required this.onPressed,
    this.text,
    this.buttonColor = AppColors.primaryColor,
    this.textColor = AppColors.white,
    this.widget,
    this.height,
    this.width,
  });

  final void Function()? onPressed;
  final String? text;
  final Color? buttonColor;
  final Color? textColor;
  final Widget? widget;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 50.h,
      width: width ?? 300.w,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor ?? Colors.yellow[700],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onPressed,
        child: widget ??
            CustomText(
              text: text ?? "",
              fontSize: 20.sp,
              color: textColor,
              maxLines: 1,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}
