import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_text_widget.dart';

Widget buildColumnHeader(String label) {
  return SizedBox(
    width: 40.w,
    child: Text(
      label,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Widget buildTransactionDetail({
  required String text,
  bool? isPrice = false,
}) {
  return SizedBox(
    width: 40.w,
    child: CustomText(
      text: text,
      fontSize: 12,
      color: Colors.black,
      isPrice: isPrice!,
    ),
  );
}
