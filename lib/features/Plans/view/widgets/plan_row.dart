import 'package:aquan/features/Plans/bloc/plan_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../core/utils/app_colors.dart';
import 'check_widget.dart';
import "package:http/http.dart" as http;

class SubscriptionOption extends StatelessWidget {
  final String level;
  final String price;
  final List<String> features;
  final bool isSelected;
  void Function()? onTap;
  PlansDone planState;
  SubscriptionOption({
    super.key,
    required this.level,
    required this.price,
    required this.features,
    required this.isSelected,
    required this.onTap,
    required this.planState,
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
          padding: const EdgeInsets.all(6.0),
          child: Row(
            children: [
              SizedBox(
                width: 120.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    isSelected
                        ? Align(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                                onTap: () async {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text(t.subscription_details),
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                                '${t.start_date}:${planState.startDate}'),
                                            Text(
                                                '${t.end_date}: ${planState.endDate}'),
                                          ],
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text(t.close),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: const Icon(Icons.error)),
                          )
                        : const SizedBox(),
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
                    isSelected ? AnimatedCheck() : const SizedBox(),
                  ],
                ),
              ),
              SizedBox(
                width: 170.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Gap(20.h),
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
