import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'check_widget.dart';

class SubscriptionOption extends StatelessWidget {
  final String level;
  final String price;
  final List<String> features;
  final bool isSelected;
  void Function()? onTap;
  SubscriptionOption({
    super.key,
    required this.level,
    required this.price,
    required this.features,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        border: Border.all(
            color: isSelected ? Colors.yellow[700]! : Colors.grey, width: 3),
        borderRadius: BorderRadius.circular(8),
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              SizedBox(
                width: 120.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "${t.level} $level",
                      style: TextStyle(
                          fontSize: 18.sp, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      price,
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color:
                              isSelected ? Colors.yellow[700] : Colors.black),
                    ),
                    isSelected ? AnimatedCheck() : SizedBox(),
                  ],
                ),
              ),
              SizedBox(
                width: 170.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...features
                        .map(
                          (feature) => Padding(
                            padding: const EdgeInsets.only(bottom: 4.0),
                            child: Row(
                              children: [
                                Icon(Icons.check,
                                    color: Colors.yellow[700], size: 25.sp),
                                Expanded(
                                  child: Text(
                                    feature,
                                    style: TextStyle(fontSize: 12.sp),
                                    maxLines: 1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                        .toList(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
