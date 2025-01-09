import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomTextFormPasswordField extends StatefulWidget {
  final String? labelText;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool obscureText;
  final bool showTogglePassword;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Icon? prefixIcon;
  final double? height;
  final double? width;
  final InputBorder? border;
  const CustomTextFormPasswordField({
    super.key,
    this.labelText,
    this.onChanged,
    this.validator,
    this.height,
    this.width,
    this.obscureText = true,
    this.showTogglePassword = false,
    this.controller,
    this.keyboardType,
    this.prefixIcon,
    this.border,
  });

  @override
  State<CustomTextFormPasswordField> createState() =>
      _CustomTextFormPasswordFieldState();
}

class _CustomTextFormPasswordFieldState
    extends State<CustomTextFormPasswordField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height ?? 75.h,
      width: widget.width ?? 300.w,
      child: TextFormField(
        controller: widget.controller,
        onChanged: widget.onChanged,
        validator: widget.validator,
        obscureText: _obscureText,
        keyboardType: widget.keyboardType,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[200],
          labelText: widget.labelText,
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.showTogglePassword
              ? InkWell(
                  onTap: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  child: Icon(
                    _obscureText
                        ? FontAwesomeIcons.eye
                        : FontAwesomeIcons.eyeSlash,
                  ),
                )
              : null,
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
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.red,
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
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.red,
              width: 1.5.h,
            ),
          ),
        ),
      ),
    );
  }
}
