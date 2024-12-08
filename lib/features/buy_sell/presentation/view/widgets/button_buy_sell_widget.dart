import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ButtonBuySellWidget extends StatelessWidget {
  ButtonBuySellWidget({
    super.key,
    required this.onTap,
  });

  void Function()? onTap;
  @override
  Widget build(context) {
    final t = AppLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          InkWell(
            onTap: onTap,
            child: Container(
              height: 50.h,
              width: 90.w,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    t!.next,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 20.sp),
                  ),
                  FaIcon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                    size: 20.sp,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
