import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    super.key,
    this.initialValue,
    this.controller,
    this.labelText,
    this.hintText,
    this.height,
    this.width,
    this.enabled,
    this.suffixIcon,
    this.onChanged,
    this.keyboardType,
    this.obscureText = false,
    this.isPrice = false,
    this.backgroundColor = Colors.white,
    this.validator,
  });
  final String? initialValue;
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final double? height;
  final double? width;
  final Widget? suffixIcon;
  final bool? enabled;
  final bool? obscureText;
  final ValueChanged<String?>? onChanged;
  TextInputType? keyboardType;
  final bool isPrice;
  final Color? backgroundColor;
  String? Function(String?)? validator;
  @override
  Widget build(context) {
    final t = AppLocalizations.of(context)!;
    return Container(
      height: height ?? 60.h,
      width: width ?? 300.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey[200],
      ),
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          border: InputBorder.none,
          suffixIcon: suffixIcon,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          ),
        ),
        keyboardType: keyboardType,
        enabled: enabled,
        obscureText: obscureText!,
        inputFormatters: isPrice
            ? <TextInputFormatter>[
                CurrencyTextInputFormatter.currency(
                  locale: 'en',
                  symbol: '',
                  decimalDigits: 0,
                ),
              ]
            : null,
        validator: validator ??
            (value) {
              if (value == null || value.isEmpty) {
                return t.required;
              }
              return null;
            },
      ),
    );
  }
}
