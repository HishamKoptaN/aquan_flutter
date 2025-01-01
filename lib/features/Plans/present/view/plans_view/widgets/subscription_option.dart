import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../../../core/singletons/user_singleton.dart';
import '../../../../../../core/widgets/custom_text_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../data/model/plan.dart';

class SubscriptionOption extends StatefulWidget {
  const SubscriptionOption({
    super.key,
    required this.plan,
    required this.selectedPlanId,
  });
  final Plan plan;
  final int? selectedPlanId;

  @override
  State<SubscriptionOption> createState() => _SubscriptionOptionState();
}

class _SubscriptionOptionState extends State<SubscriptionOption> {
  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    List<String> features = [
      '${t.transfer_commission} ${widget.plan.transferCommission.toString()}%',
      '${t.dailyTransfers} ${widget.plan.dailyTransferCount.toString()}\$',
      '${t.monthlyTransfers} ${widget.plan.monthlyTransferCount.toString()}\$',
      '${t.max_transfer} ${widget.plan.maxTransferCount.toString()}\$',
    ];

    return Container(
      height: 130.h,
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        border: Border.all(
          color: widget.selectedPlanId == widget.plan.id
              ? Colors.yellow[700]!
              : Colors.grey,
          width: 3,
        ),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Gap(
              5.w,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...features.map(
                  (feature) => Row(
                    children: [
                      Icon(
                        Icons.check,
                        color: Colors.yellow[700],
                        size: 25.sp,
                      ),
                      CustomText(
                        text: feature,
                        fontSize: 10.sp,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                (widget.plan.id ==
                        UserSingleton.instance.user!.userPlan!.planId)
                    ? Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () async {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(t.subscription_details),
                                  content: const Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [],
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
                          child: const Icon(Icons.error),
                        ),
                      )
                    : const SizedBox(),
                CustomText(
                  text: "${t.level} ${widget.plan.name}",
                  fontSize: 15.sp,
                  color: Colors.black,
                ),
                CustomText(
                  text: widget.plan.amount! > 0
                      ? '\$${widget.plan.amount}'
                      : t.free,
                  fontSize: 15.sp,
                  color: Colors.amber,
                  fontWeight: FontWeight.bold,
                ),
                (widget.plan.id ==
                        UserSingleton.instance.user!.userPlan!.planId)
                    ? Container(
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
                      )
                    : const SizedBox(),
              ],
            ),
            Gap(
              25.w,
            ),
          ],
        ),
      ),
    );
  }
}
