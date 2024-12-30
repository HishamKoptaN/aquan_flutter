import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../utils/app_colors.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    this.fontSize,
    this.color = AppColors.black,
    this.maxLines = 2,
    this.overflow,
    this.fontWeight,
    this.textAlign,
    this.fontFamily,
    this.isPrice = false,
    this.showCurrencySymbol = false,
  });

  final String text;
  final double? fontSize;
  final Color? color;
  final TextOverflow? overflow;
  final int? maxLines;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final String? fontFamily;
  final bool isPrice;
  final bool showCurrencySymbol;

  String _formatPrice(String value) {
    if (isPrice) {
      final formatter = NumberFormat.simpleCurrency(
        locale: "en",
        decimalDigits: 0,
      );
      try {
        final number = double.tryParse(
          value.replaceAll(
            ',',
            '',
          ),
        );
        String formattedValue = formatter.format(
          number ?? 0,
        );

        // إذا كانت الخاصية showCurrencySymbol غير مفعلة، نقوم بإزالة علامة الدولار
        if (!showCurrencySymbol) {
          formattedValue = formattedValue.replaceAll(RegExp(r'\$'), '');
        }

        return formattedValue;
      } catch (e) {
        return value;
      }
    }
    return value;
  }

  @override
  Widget build(context) {
    return Text(
      _formatPrice(
        text,
      ),
      style: TextStyle(
        fontWeight: fontWeight,
        color: color,
        fontSize: fontSize ?? 25.sp,
        fontFamily: fontFamily,
      ),
      maxLines: maxLines,
      overflow: overflow ?? TextOverflow.ellipsis,
      softWrap: true,
      textAlign: textAlign,
    );
  }
}
