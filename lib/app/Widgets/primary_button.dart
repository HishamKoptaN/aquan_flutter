import 'package:aquan/Helpers/colors.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    this.onPressed,
    required this.text,
    this.width,
    this.bgColor,
    this.padding,
  });

  final void Function()? onPressed;
  final String text;
  final double? width;
  final Color? bgColor;
  final double? padding;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          textStyle: const TextStyle(
            fontSize: 20,
          ),
          backgroundColor: bgColor ?? amber,
          padding: EdgeInsets.all(padding ?? 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: BorderSide(
              color: amber,
            ),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: black,
            fontFamily: "Arial",
          ),
        ),
      ),
    );
  }
}
