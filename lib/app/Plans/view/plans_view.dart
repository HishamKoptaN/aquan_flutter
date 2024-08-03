import 'package:aquan/app/Plans/model/plan_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:aquan/app/Plans/bloc/plan_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../controller/plan_controller.dart';
import 'change_plan_view.dart';

class PlansView extends StatefulWidget {
  const PlansView({super.key});
  @override
  State<PlansView> createState() => _PlansViewState();
}

class _PlansViewState extends State<PlansView> {
  bool _isChecked = false;
  PlanController planController = PlanController();
  int? _selectedPlanId;
  Plan? selectedPlan;
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
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MyText(
              text: t.choose_subscription,
              fontSize: 17.sp,
              color: Colors.black,
            ),
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
            BlocProvider<PlanBloc>(
              create: (context) => PlanBloc()..add(GetPlans()),
              child: BlocBuilder<PlanBloc, PlanState>(
                builder: (context, state) {
                  if (state is PlansDone) {
                    if (_selectedPlanId == null && state.userPlanId != null) {
                      _selectedPlanId = state.userPlanId!;
                    }
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.plans!.length,
                      itemBuilder: (context, index) {
                        final plan = state.plans![index];
                        List<String> features = [
                          '${t.transfer_commission} ${plan.discount.toString()}%',
                          '${t.dailyTransfers} ${plan.dailyTransferCount.toString()}\$',
                          '${t.monthlyTransfers} ${plan.monthlyTransferCount.toString()}\$',
                          '${t.maxTransfer} ${plan.maxTransferCount.toString()}\$',
                        ];
                        bool isSelected = (plan.id == _selectedPlanId);

                        return GestureDetector(
                          onTap: () {
                            _selectPlan(plan.id!);
                            selectedPlan = plan;
                          },
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: isSelected
                                    ? Colors.yellow[700]!
                                    : Colors.grey,
                                width: 3,
                              ),
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
                                          (plan.id == state.userPlanId)
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
                                                                    '${t.start_date}:${state.startDate}'),
                                                                Text(
                                                                    '${t.end_date}: ${state.endDate}'),
                                                              ],
                                                            ),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () {
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
                                                    child:
                                                        const Icon(Icons.error),
                                                  ),
                                                )
                                              : const SizedBox(),
                                          MyText(
                                            text: "${t.level} ${plan.name}",
                                            fontSize: 15.sp,
                                            color: Colors.black,
                                          ),
                                          MyText(
                                            text: plan.amount! > 0
                                                ? '\$${plan.amount}'
                                                : t.free,
                                            fontSize: 15.sp,
                                            color: Colors.amber,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          (plan.id == state.userPlanId)
                                              ? Container(
                                                  decoration:
                                                      const BoxDecoration(
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
                                    SizedBox(
                                      height: 105.h,
                                      width: 170.w,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          ...features.map(
                                            (feature) => Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 4.0),
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
                                                        fontSize: 10.sp,
                                                      ),
                                                      maxLines: 1,
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
                            ),
                          ),
                        );
                      },
                    );
                  } else if (state is PlanError) {
                    return Center(
                      child: MyText(
                        text: state.message ?? 'An error occurred',
                        fontSize: 10.sp,
                        color: Colors.red,
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
            Gap(5.h),
            MyText(
              text:
                  'نحن كمنصة مختصة بمتابعة الأسعار العالمية نقوم بالتحقق من أفضل الأسعار المتواجدة في السوق ومشاركتها مع عملائنا. يسعدنا التواجد لخدمتكم وشكرًا لثقتكم بنا.',
              fontSize: 9.sp,
              color: Colors.black,
              fontWeight: null,
            ),
            Gap(5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'الموافقة على الشروط و سياسة الخصوصية',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
                Checkbox(
                  value: _isChecked,
                  onChanged: _toggleCheckbox,
                ),
              ],
            ),
            Gap(2.5.h),
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
                  if (_isChecked && selectedPlan != null) {
                    WidgetsBinding.instance.addPostFrameCallback(
                      (_) => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ChangePlanView(
                            plan: selectedPlan!,
                          ),
                        ),
                      ),
                    );
                  }
                },
                child: Text(
                  'تفعيل الاشتراك',
                  style: TextStyle(fontSize: 20.sp, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyText extends StatelessWidget {
  String text;
  double fontSize;
  Color color;
  FontWeight? fontWeight;
  MyText({
    super.key,
    required this.text,
    required this.fontSize,
    required this.color,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
      ),
    );
  }
}
