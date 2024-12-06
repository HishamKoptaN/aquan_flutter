import 'package:aquan/features/plans/data/model/plan_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PlanDetailsWidget extends StatelessWidget {
  const PlanDetailsWidget({
    super.key,
    required this.t,
    required this.features,
    required this.plan,
  });

  final AppLocalizations t;
  final List<String> features;
  final Plan plan;

  @override
  Widget build(
    context,
  ) {
    return Container(
      height: 150.h,
      margin: EdgeInsets.only(
        bottom: 10.h,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.yellow[700]!,
          width: 3,
        ),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: EdgeInsets.all(6.w),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${t.level} ${plan.name}",
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    plan.amount > 0 ? '\$${plan.amount}' : t.free,
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 22.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...features.map(
                    (feature) => Padding(
                      padding: EdgeInsets.symmetric(vertical: 2.h),
                      child: Row(
                        children: [
                          Icon(
                            Icons.check,
                            color: Colors.yellow[700],
                            size: 25.sp,
                          ),
                          Expanded(
                            child: Text(
                              feature,
                              style: TextStyle(
                                fontSize: 15.sp,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
