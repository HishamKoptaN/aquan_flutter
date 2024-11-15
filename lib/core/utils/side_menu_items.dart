import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/custom_text_widget.dart';

DataColumn dataColumn({
  required String label,
}) {
  return DataColumn(
    label: CustomText(
      text: label,
      color: Colors.black,
      fontSize: 10.sp,
      maxLines: 2,
      fontWeight: FontWeight.bold,
    ),
  );
}

DataCell dataCell({
  required String title,
  Color? color,
}) {
  return DataCell(
    CustomText(
      text: title,
      color: color ?? Colors.black,
      fontSize: 10.sp,
      maxLines: 2,
      fontWeight: null,
    ),
  );
}
