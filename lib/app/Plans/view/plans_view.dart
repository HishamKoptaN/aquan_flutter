import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:aquan/app/Plans/bloc/plan_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../controller/plan_controller.dart';

class PlansView extends StatefulWidget {
  const PlansView({super.key});

  @override
  State<PlansView> createState() => _PlansViewState();
}

class _PlansViewState extends State<PlansView> {
  bool _isChecked = false;
  PlanController planController = PlanController();
  int? _selectedPlanId;

  void _toggleCheckbox(bool? value) {
    setState(() {
      _isChecked = value ?? false;
    });
  }

  void _selectPlan(int planId) {
    setState(() {
      _selectedPlanId = planId;
    });
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          t.subscriptions,
          style: const TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                t.choose_subscription,
                style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.center,
                child: Text(
                  t.subscription_now,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.blueGrey,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              BlocProvider<PlanBloc>(
                create: (context) => PlanBloc()..add(GetPlans()),
                child: BlocBuilder<PlanBloc, PlanState>(
                  builder: (context, state) {
                    if (state is PlansDone) {
                      if (_selectedPlanId == null && state.user != null) {
                        _selectedPlanId = state.user!.planId;
                      }
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: state.plans!.length,
                        itemBuilder: (context, index) {
                          final plan = state.plans![index];
                          List<String> features = [
                            '${t.transfer_commission} ${plan.discount.toString()}\%',
                            '${t.dailyTransfers} ${plan.dailyTransferCount.toString()}\$',
                            '${t.monthlyTransfers} ${plan.monthlyTransferCount.toString()}\$',
                            '${t.maxTransfer} ${plan.maxTransferCount.toString()}\$',
                          ];
                          bool isSelected = (plan.id == _selectedPlanId);

                          return GestureDetector(
                            onTap: () {
                              _selectPlan(plan.id!);
                            },
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 16),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: isSelected
                                        ? Colors.yellow[700]!
                                        : Colors.grey,
                                    width: 3),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: GestureDetector(
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 120.w,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            (plan.id == state.user!.planId)
                                                ? Align(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    child: GestureDetector(
                                                      onTap: () async {
                                                        showDialog(
                                                          context: context,
                                                          builder: (BuildContext
                                                              context) {
                                                            return AlertDialog(
                                                              title: Text(t
                                                                  .subscription_details),
                                                              content: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                children: [
                                                                  Text(
                                                                      '${t.start_date}:${state.planDetails!['startDate']}'),
                                                                  Text(
                                                                      '${t.end_date}: ${state.planDetails!['endDate']}'),
                                                                ],
                                                              ),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop();
                                                                  },
                                                                  child: Text(
                                                                      t.close),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        );
                                                      },
                                                      child: const Icon(
                                                          Icons.error),
                                                    ),
                                                  )
                                                : const SizedBox(),
                                            Text(
                                              "${t.level} ${plan.name}",
                                              style: TextStyle(
                                                  fontSize: 18.sp,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              plan.amount! > 0
                                                  ? '\$${plan.amount}'
                                                  : t.free,
                                              style: TextStyle(
                                                  fontSize: 18.sp,
                                                  fontWeight: FontWeight.bold,
                                                  color: isSelected
                                                      ? Colors.yellow[700]
                                                      : Colors.black),
                                            ),
                                            (plan.id == state.user!.planId)
                                                ? Container(
                                                    //  height: 40.s,
                                                    // width: circleSize,
                                                    decoration:
                                                        const BoxDecoration(
                                                      color: Colors.green,
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Center(
                                                      child: Icon(Icons.check,
                                                          color: Colors.white,
                                                          size: 22.sp),
                                                    ),
                                                  )
                                                : const SizedBox(),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 170.w,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Gap(20.h),
                                            ...features
                                                .map(
                                                  (feature) => Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            bottom: 4.0),
                                                    child: Row(
                                                      children: [
                                                        Icon(Icons.check,
                                                            color: Colors
                                                                .yellow[700],
                                                            size: 25.sp),
                                                        Expanded(
                                                          child: Text(
                                                            feature,
                                                            style: TextStyle(
                                                                fontSize:
                                                                    12.sp),
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
                            ),
                          );
                        },
                      );
                    } else if (state is PlanError) {
                      return Center(
                        child: Text(
                          state.message ?? 'An error occurred',
                          style: const TextStyle(
                            color: Colors.red,
                            fontSize: 18,
                          ),
                        ),
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.red,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'نحن كمنصة مختصة بمتابعة الأسعار العالمية نقوم بالتحقق من أفضل الأسعار المتواجدة في السوق ومشاركتها مع عملائنا. يسعدنا التواجد لخدمتكم وشكرًا لثقتكم بنا.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'الموافقة على الشروط و سياسة الخصوصية',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  Checkbox(
                    value: _isChecked,
                    onChanged: _toggleCheckbox,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow[700],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    _isChecked ? print("true") : print("false");
                  },
                  child: Text(
                    'تفعيل الاشتراك',
                    style: TextStyle(fontSize: 20.sp, color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
