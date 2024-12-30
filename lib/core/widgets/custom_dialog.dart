import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../methods/log_out.dart';
import 'custom_text_widget.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    late final AppLocalizations t = AppLocalizations.of(context)!;
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: Center(
        child: CustomText(
          text: t.logout,
          color: Colors.blue,
          fontWeight: FontWeight.bold,
          fontSize: 16.sp,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomText(
            text: t.areYouSure,
            textAlign: TextAlign.center,
            fontSize: 16.sp,
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () async {
                    await handleLogout(context);
                  },
                  child: CustomText(
                    text: t.logout,
                    color: Colors.blue,
                    fontSize: 16.sp,
                  ),
                ),
              ),
              Container(
                height: 40,
                width: 1,
                color: Colors.grey,
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: CustomText(
                    text: t.close,
                    color: Colors.black,
                    fontSize: 16.sp,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
