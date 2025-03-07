import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class CustomPinCodeWidget extends StatelessWidget {
  const CustomPinCodeWidget({
    super.key,
    required this.onChanged,
    required this.context,
    this.controller,
    this.length = 6,
    this.fieldHeight = 50.0,
    this.fieldWidth = 50.0,
    this.hintCharacter = "-",
    this.cursorColor = Colors.black,
    this.inactiveColor = Colors.black,
    this.activeColor = Colors.black,
    this.selectedColor = Colors.black,
    this.fieldBorderRadius = 20.0,
    this.validator,
    this.errorController,
    this.boxShadows,
  });

  final void Function(String) onChanged;
  final BuildContext context;
  final TextEditingController? controller;
  final int length;
  final double fieldHeight;
  final double fieldWidth;
  final String hintCharacter;
  final Color cursorColor;
  final Color inactiveColor;
  final Color activeColor;
  final Color selectedColor;
  final double fieldBorderRadius;
  final String? Function(String?)? validator;
  final StreamController<ErrorAnimationType>? errorController;
  final List<BoxShadow>? boxShadows;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: PinCodeTextField(
          controller: controller,
          appContext: this.context,
          pastedTextStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          textStyle: const TextStyle(
            color: Colors.white,
          ),
          length: length,
          pinTheme: PinTheme(
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(
              fieldBorderRadius,
            ),
            fieldHeight: fieldHeight.h,
            fieldWidth: fieldWidth.w,
            inactiveColor: inactiveColor,
            activeFillColor: activeColor,
            activeColor: activeColor,
            selectedColor: selectedColor,
            selectedFillColor: activeColor,
            inactiveFillColor: inactiveColor,
          ),
          hintCharacter: hintCharacter,
          cursorColor: cursorColor,
          animationDuration: const Duration(
            milliseconds: 300,
          ),
          validator: validator,
          enableActiveFill: true,
          errorAnimationController: errorController,
          keyboardType: TextInputType.number,
          boxShadows: boxShadows ??
              const [
                BoxShadow(
                  offset: Offset(0, 1),
                  color: Colors.black,
                  blurRadius: 10,
                )
              ],
          blinkWhenObscuring: true,
          animationType: AnimationType.fade,
          onChanged: onChanged,
          beforeTextPaste: (text) {
            debugPrint(
              "Allowing to paste $text",
            );
            return true;
          },
        ),
      ),
    );
  }
}
