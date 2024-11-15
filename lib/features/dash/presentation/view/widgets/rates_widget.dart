import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../core/widgets/custom_text_widget.dart';

class RatesWidget extends StatelessWidget {
  const RatesWidget({
    super.key,
    required this.t,
  });

  final AppLocalizations t;

  @override
  Widget build(BuildContext context) {
    List exchangeRates = [];
    List sellingPrices = [];
    List buyingPrices = [];

    dynamic commission = [1];

    return ListView.builder(
      padding: const EdgeInsets.all(8),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: exchangeRates.length,
      itemBuilder: (context, index) {
        var exchangeRate = exchangeRates[index];
        var comission = commission;
        final sellingRateValue = sellingPrices
            .firstWhere(
              (sellingRate) => sellingRate.from == exchangeRate.id,
            )
            .price;
        final buyingRateValue = buyingPrices
            .firstWhere(
              (buyingRate) => buyingRate.to == exchangeRate.id,
            )
            .price;
        String formattedSellingRate = NumberFormat('#,##0').format(
          ((sellingRateValue / 100) * comission - sellingRateValue).abs(),
        );
        final formattedBuyingRate = NumberFormat('#,##0').format(
          ((buyingRateValue / 100) * comission + buyingRateValue).abs(),
        );
        return Container(
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey.shade200,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Column(
                    children: [
                      Gap(5.h),
                      CustomText(
                        text: exchangeRate.name,
                        fontSize: 18.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      Gap(5.h),
                      CustomText(
                        text: t.lastUpdate,
                        fontSize: 14.sp,
                        color: Colors.black,
                        maxLines: 2,
                      ),
                      CustomText(
                        text: " ${exchangeRate.updatedAt}",
                        fontSize: 14.sp,
                        color: Colors.black,
                        maxLines: 2,
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Column(
                    children: [
                      CustomText(
                        text: t.sell,
                        fontSize: 16.sp,
                        color: Colors.red,
                      ),
                      CustomText(
                        text: formattedSellingRate,
                        fontSize: 16.sp,
                        color: Colors.black,
                      ),
                    ],
                  ),
                  const Gap(10),
                  Column(
                    children: [
                      CustomText(
                        text: t.buy,
                        fontSize: 16.sp,
                        color: Colors.green,
                      ),
                      CustomText(
                        text: formattedBuyingRate,
                        fontSize: 16.sp,
                        color: Colors.black,
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
