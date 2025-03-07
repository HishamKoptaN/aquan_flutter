import 'package:aquan/features/plans/data/model/plan_rate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/widgets/custom_text_widget.dart';
import '../../../../data/model/plan.dart';

class PayDetailsWidget extends StatefulWidget {
  const PayDetailsWidget({
    super.key,
    required this.planRate,
    required this.plan,
  });
  final PlanRate planRate;
  final Plan plan;

  @override
  State<PayDetailsWidget> createState() => _PayDetailsWidgetState();
}

class _PayDetailsWidgetState extends State<PayDetailsWidget> {
  double rate = 0.0;
  int? selectedIndex = 0;

  @override
  Widget build(
    context,
  ) {
    final t = AppLocalizations.of(context)!;
    return Container(
      height: 300.h,
      margin: EdgeInsets.only(bottom: 10.h),
      child: Center(
        child: ListView.builder(
          itemCount: widget.planRate.accountInfo.length,
          itemBuilder: (context, index) {
            final currency = widget.planRate.accountInfo[index];
            int? amount = widget.plan.amount;
            if (currency.id == 1) rate = 1;
            if (currency.bankId == 3 || currency.bankId == 4) {
              return const SizedBox.shrink();
            }
            if (currency.bankId == 2) {
              amount = widget.plan.amount! *
                  widget.planRate.toBinanceRates.first.price;
            }
            return Padding(
              padding: EdgeInsets.all(2.w),
              child: Container(
                margin: EdgeInsets.only(bottom: 10.h),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.hint,
                    width: 3,
                  ),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Center(
                  child: ExpansionTile(
                    key: UniqueKey(),
                    initiallyExpanded: selectedIndex == index,
                    onExpansionChanged: (isExpanded) {
                      setState(
                        () {
                          selectedIndex = isExpanded ? index : selectedIndex;
                        },
                      );
                    },
                    title: CustomText(
                      text: currency.currency.name ?? '',
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 15.sp,
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(
                                  text: t.accountNumber,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 14.sp,
                                ),
                                Row(
                                  children: [
                                    CustomText(
                                      text: currency.accountNumber.toString(),
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 12.sp,
                                    ),
                                    IconButton(
                                      onPressed: () async {
                                        await Clipboard.setData(
                                          ClipboardData(
                                            text: currency.accountNumber,
                                          ),
                                        );
                                      },
                                      icon: Icon(
                                        FontAwesomeIcons.copy,
                                        size: 20.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(
                                  text: t.name,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 14.sp,
                                ),
                                CustomText(
                                  text: currency.currency.name ?? '',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 14.sp,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(
                                  text: t.comment,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 14.sp,
                                ),
                                CustomText(
                                  text: currency.comment,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 14.sp,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(
                                  text: t.amount,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 14.sp,
                                ),
                                CustomText(
                                  text: amount.toString(),
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 14.sp,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
