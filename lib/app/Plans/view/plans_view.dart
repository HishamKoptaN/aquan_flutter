import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:aquan/app/Plans/bloc/plan_bloc.dart';
import 'package:aquan/app/Plans/view/change_plan_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../controller/plan_controller.dart';
import 'widgets/plan_row.dart';

class PlansScreen extends StatefulWidget {
  const PlansScreen({super.key});

  @override
  State<PlansScreen> createState() => _PlansScreenState();
}

class _PlansScreenState extends State<PlansScreen> {
  bool _isChecked = false;
  PlanController planController = PlanController();

  void _toggleCheckbox(bool? value) {
    setState(() {
      _isChecked = value ?? false;
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
          t.plans,
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
                'اختر خطة الاشتراك',
                style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 8),
              Text(
                'اشترك الآن للحصول على أفضل الأسعار وأسرع خدمة لتحويل الأموال بكل سهولة وأمان!',
                style: TextStyle(fontSize: 16.sp, color: Colors.blueGrey),
              ),
              const SizedBox(height: 16),
              BlocProvider<PlanBloc>(
                create: (context) => PlanBloc()..add(GetPlans()),
                child: BlocConsumer<PlanBloc, PlanState>(
                  listener: (context, state) {
                    if (state is UserPlanDetailsLoaded) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(t.subscription_details),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                    '${t.start_date}:${state.planDetails['startDate']}'),
                                Text(
                                    '${t.end_date}: ${state.planDetails['endDate']}'),
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
                    }
                  },
                  builder: (context, state) {
                    if (state is PlansDone) {
                      return Column(
                        children: state.plans.map((plan) {
                          return SubscriptionOption(
                            level: '${plan.name}',
                            price: (plan.amount! > 0)
                                ? '\$${plan.amount}'
                                : t.free,
                            features: [
                              '${t.dailyTransfers} ${plan.dailyTransferCount.toString()}\$',
                              '${t.monthlyTransfers} ${plan.monthlyTransferCount.toString()}\$',
                              '${t.maxTransfer} ${plan.maxTransferCount.toString()}\$',
                            ],
                            isSelected: (plan.id == state.user.planId),
                            onTap: () {
                              try {
                                if (plan.amount! > 0 &&
                                    plan.id != state.user.planId) {
                                  WidgetsBinding.instance
                                      .addPostFrameCallback((_) {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ChangePlanScreen(plan: plan),
                                      ),
                                    );
                                  });
                                }
                              } catch (e) {
                                print(e);
                              }
                            },
                          );
                        }).toList(),
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
                  Text(
                    'الموافقة على الشروط و سياسة الخصوصية',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.grey,
                      decoration: TextDecoration.underline,
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
