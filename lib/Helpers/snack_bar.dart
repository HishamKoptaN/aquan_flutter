import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motion_toast/resources/colors.dart';

import '../core/utils/app_colors.dart';
import 'global_widgets.dart';

SnackBar snackBar({required bool status, required String message}) {
  return SnackBar(
    backgroundColor: status ? successColor : Colors.red,
    duration: const Duration(seconds: 3),
    content: CustomText(
      text: message,
      color: status ? Colors.white : Colors.white,
      fontSize: 15.sp,
      maxLines: 2,
      fontWeight: null,
    ),
  );
}
