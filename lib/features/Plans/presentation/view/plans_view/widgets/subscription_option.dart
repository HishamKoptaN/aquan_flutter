import 'package:aquan/features/plans/data/model/change_plan_request_body_model.dart';
import 'package:aquan/features/plans/data/model/plan_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/singletons/user_singleton.dart';
import '../../../../../../core/widgets/custom_text_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SubscriptionOption extends StatefulWidget {
  SubscriptionOption({
    super.key,
    required this.plan,
  });
  final Plan plan;
  @override
  State<SubscriptionOption> createState() => _SubscriptionOptionState();
}

class _SubscriptionOptionState extends State<SubscriptionOption> {
  int? selectedPlanId;

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
          color: ChangePlanRequestBodyModel().planInvoiceId == widget.plan.id
              ? Colors.yellow[700]!
              : Colors.grey,
          width: 3,
        ),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Column(
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
                        Expanded(
                          child: Text(
                            feature,
                            style: TextStyle(
                              fontSize: 10.sp,
                            ),
                            maxLines: 1,
                          ),
                        ),
                      ],
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
                  (widget.plan.id == UserSingleton.instance.user!.planId)
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
                    text: widget.plan.amount > 0
                        ? '\$${widget.plan.amount}'
                        : t.free,
                    fontSize: 15.sp,
                    color: Colors.amber,
                    fontWeight: FontWeight.bold,
                  ),
                  (widget.plan.id == UserSingleton.instance.user!.planId)
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
            ),
          ],
        ),
      ),
    );
  }
}
