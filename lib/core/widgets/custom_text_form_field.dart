import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    this.decoration,
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
  final InputDecoration? decoration;
  @override
  Widget build(context) {
    final t = AppLocalizations.of(context)!;

    return SizedBox(
      height: height ?? 75.h,
      width: width ?? 300.w,
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        decoration: decoration ??
            InputDecoration(
              filled: true,
              fillColor: Colors.grey[200],
              labelText: labelText,
              hintText: hintText,
              suffixIcon: suffixIcon,
              border: InputBorder.none,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  10,
                ),
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1.5.h,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1.5.h,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.red,
                  width: 1.5.h,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.red,
                  width: 1.5.h,
                ),
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
