import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import '../../../../../core/di/dependency_injection.dart';
import '../../../../../core/widgets/custom_circular_progress.dart';
import '../../../../../core/widgets/custom_text_widget.dart';
import '../../bloc/dash_bloc.dart';
import '../../bloc/dash_event.dart';
import '../../bloc/dash_state.dart';

class RatesWidget extends StatelessWidget {
  const RatesWidget({
    super.key,
  });

  @override
  Widget build(context) {
    final t = AppLocalizations.of(context)!;
    return BlocProvider<DashBloc>(
      create: (context) => DashBloc(
        getDashUseCase: getIt(),
      ),
      child: BlocBuilder<DashBloc, DashState>(
        builder: (context, state) {
          state.whenOrNull(
            initial: () {
              context.read<DashBloc>().add(
                    const DashEvent.get(),
                  );
            },
          );
          return state.maybeWhen(
            dashloaded: (dashResModel) {
              return ListView.builder(
                padding: const EdgeInsets.all(8),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: dashResModel.exchangeRates?.length,
                itemBuilder: (context, index) {
                  var exchangeRate = dashResModel.exchangeRates![index];
                  var comission = dashResModel.commission;
                  final sellingRateValue = dashResModel.sellingPrices
                      ?.firstWhere(
                        (sellingRate) => sellingRate.from == exchangeRate.id,
                      )
                      .price;
                  final buyingRateValue = dashResModel.buyingPrices
                      ?.firstWhere(
                        (buyingRate) => buyingRate.to == exchangeRate.id,
                      )
                      .price;
                  String formattedSellingRate = NumberFormat('#,##0').format(
                    ((sellingRateValue! / 100) * comission! - sellingRateValue)
                        .abs(),
                  );
                  final formattedBuyingRate = NumberFormat('#,##0').format(
                    ((buyingRateValue! / 100) * comission + buyingRateValue)
                        .abs(),
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
                                  text: exchangeRate.name ?? '',
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
                                  text: exchangeRate.updatedAt ?? '',
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
            },
            loading: () {
              return const CustomCircularProgress();
            },
            orElse: () {
              return const SizedBox();
            },
          );
        },
      ),
    );
  }
}
