import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/custom_text_widget.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    this.controller,
    this.label,
    this.hint,
    this.initialValue,
    this.enabled,
    this.icon,
    required this.onChanged,
    this.keyboardType,
  });
  final TextEditingController? controller;
  final String? initialValue;
  final String? label;
  final String? hint;
  final Widget? icon;
  final bool? enabled;
  final Function(dynamic value) onChanged;
  TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height / 10,
      width: width,
      child: TextFormField(
        controller: controller,
        initialValue: initialValue,
        keyboardType: keyboardType,
        enabled: enabled,
        onChanged: onChanged,
        style: TextStyle(
          fontSize: 15.sp,
        ),
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(10),
          ),
          suffixIcon: icon,
          labelStyle: TextStyle(
            fontSize: 15.sp,
            color: Colors.black,
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          disabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
        ),
        inputFormatters: [
          CurrencyTextInputFormatter.currency(
            locale: 'en',
            symbol: '',
            decimalDigits: 0,
          )
        ],
        validator: (value) {
          if (value == null || value.isEmpty) {
            if (value == null || value.isEmpty) {
              return "required";
            }
            return 'Please enter $label';
          }
          return null;
        },
      ),
    );
  }
}

class CustomTextButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final Color color;
  final Color buttonColor;

  const CustomTextButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.color,
    required this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: CustomText(
            text: text,
            color: color,
            fontSize: 5.sp,
            maxLines: 1,
            fontWeight: null,
          ),
        ),
      ),
    );
  }
}
