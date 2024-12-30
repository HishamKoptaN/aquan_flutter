import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/app_colors.dart';
import 'custom_text_widget.dart';

class CustomDropdownButton<T> extends StatelessWidget {
  const CustomDropdownButton({
    super.key,
    this.height,
    this.width,
    required this.hint,
    required this.items,
    required this.selectedItem,
    required this.onChanged,
    required this.itemLabel,
    this.fontSize,
  });

  final double? height;
  final double? width;
  final String hint;
  final List<T> items;
  final T? selectedItem;
  final ValueChanged<T?> onChanged;
  final String Function(T) itemLabel;
  final double? fontSize;

  @override
  Widget build(context) {
    return Container(
      height: height ?? 65.h,
      width: width ?? 300.w,
      padding: EdgeInsets.symmetric(
        horizontal: 10.w,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
      ),
      child: DropdownButton<T>(
        value: selectedItem,
        isExpanded: true,
        underline: const SizedBox(),
        onChanged: onChanged,
        dropdownColor: AppColors.white,
        hint: Align(
          alignment: Alignment.centerLeft,
          child: CustomText(
            text: hint,
            color: Colors.grey,
            fontSize: fontSize ?? 16.sp,
          ),
        ),
        style: TextStyle(
          color: Colors.black,
          fontSize: fontSize ?? 16.sp,
        ),
        items: items.map((item) {
          return DropdownMenuItem<T>(
            value: item,
            child: Text(
              itemLabel(item),
              style: TextStyle(
                color: Colors.black,
                fontSize: fontSize ?? 16.sp,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
