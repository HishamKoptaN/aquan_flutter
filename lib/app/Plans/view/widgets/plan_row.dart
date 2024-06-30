import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../level_details/bloc/subscrition_bloc.dart';
import '../../../level_details/bloc/subscrition_event.dart';
import '../../../level_details/bloc/subscrition_state.dart';
import 'check_widget.dart';
import 'details_widget.dart';

class SubscriptionOption extends StatelessWidget {
  final String level;
  final String price;
  final List<String> features;
  final int planId;
  void Function()? onTap;
  SubscriptionOption({
    super.key,
    required this.level,
    required this.price,
    required this.features,
    required this.planId,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    void showSubscriptionDetailsDialog(BuildContext context) {
      showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: SizedBox(
              height: 175.h,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: BlocProvider(
                    create: (context) => SubscritionDetailsBloc()
                      ..add(GetSubscribtionDetailsEvent(userId: 1)),
                    child: BlocBuilder<SubscritionDetailsBloc,
                        SubscritionDetailsState>(
                      builder: (context, state) {
                        if (state is SubscritionDetailsLoading) {
                          return Center(
                            child: CircularProgressIndicator(
                              color: Theme.of(context).primaryColor,
                            ),
                          );
                        } else if (state is SubscritionDetailsLoaded) {
                          final subscription = state.subscribtionDetails;

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(t.subscription_details),
                              Gap(15.h),
                              // Text('Plan ID: ${subscription.planId}'),
                              Text(
                                  '${t.start_date} : ${subscription.startDate.toString().split(' ')[0]}'), // تعديل هنا لعرض التاريخ بدون وقت
                              Text(
                                  '${t.end_date}: ${subscription.endDate.toString().split(' ')[0]}'), // تعديل هنا لعرض التاريخ بدون وقت
                              Gap(15.h),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text(t.close),
                              ),
                            ],
                          );
                        } else if (state is SubscritionDetailsError) {
                          return Center(
                            child: Text(
                              state.message,
                              style: const TextStyle(color: Colors.red),
                            ),
                          );
                        }
                        return Center(
                          child: CircularProgressIndicator(
                            color: Theme.of(context).primaryColor,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      );
    }

    return BlocProvider(
      create: (context) =>
          SubscritionDetailsBloc()..add(GetSubscribtionDetailsEvent(userId: 1)),
      child: BlocBuilder<SubscritionDetailsBloc, SubscritionDetailsState>(
        builder: (BuildContext context, SubscritionDetailsState state) {
          if (state is SubscritionDetailsLoaded) {
            final subscription = state.subscribtionDetails;
            return Container(
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                border: Border.all(
                    color: planId == subscription.planId
                        ? Colors.yellow[700]!
                        : Colors.grey,
                    width: 3),
                borderRadius: BorderRadius.circular(8),
              ),
              child: GestureDetector(
                onTap: onTap,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 130.h,
                        width: 120.w,
                        child: Stack(
                          children: [
                            Positioned(
                              top: 0,
                              right: 0,
                              child: planId == subscription.planId
                                  ? GestureDetector(
                                      onTap: () {
                                        showSubscriptionDetailsDialog(context);
                                      },
                                      child: const Details(),
                                    )
                                  : const SizedBox(),
                            ),
                            Positioned(
                              top: 30,
                              right: 20,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "${t.level} $level",
                                    style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    price,
                                    style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.bold,
                                        color: planId == subscription.planId
                                            ? Colors.yellow[700]
                                            : Colors.black),
                                  ),
                                  planId == subscription.planId
                                      ? AnimatedCheck()
                                      : const SizedBox(),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 130.h,
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
                                            color: Colors.yellow[700],
                                            size: 25.sp),
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
          return Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            ),
          );
        },
      ),
    );
  }
}
