import 'package:aquan/features/plans/data/model/change_plan_request_body_model.dart';
import 'package:aquan/features/plans/data/model/plan_model.dart';
import 'package:aquan/features/plans/presentation/view/plans_view/widgets/subscription_option.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../../../core/singletons/user_singleton.dart';
import '../../../../../../core/widgets/custom_button_widget.dart';
import '../../../../../../core/widgets/custom_text_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../change_plan/change_plan_view.dart';

class PlansDataWidget extends StatefulWidget {
  PlansDataWidget({
    super.key,
    required this.plans,
  });
  List<Plan> plans;
  @override
  State<PlansDataWidget> createState() => _PlansDataWidgetState();
}

class _PlansDataWidgetState extends State<PlansDataWidget> {
  bool _isChecked = false;
  void _toggleCheckbox(bool? value) {
    setState(
      () {
        _isChecked = value ?? false;
      },
    );
  }

  @override
  Widget build(context) {
    final t = AppLocalizations.of(context)!;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CustomText(
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
            Gap(
              10.h,
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: widget.plans.length,
                itemBuilder: (context, index) {
                  final plan = widget.plans[index];
                  return GestureDetector(
                    onTap: () {
                      if (plan.id != UserSingleton.instance.user!.planId) {
                        setState(
                          () {
                            ChangePlanRequestBodyModel().planInvoiceId =
                                plan.id;
                          },
                        );
                      }
                    },
                    child: SubscriptionOption(
                      plan: plan,
                    ),
                  );
                },
              ),
            ),
            Gap(
              5.h,
            ),
            CustomText(
              text:
                  'نحن كمنصة مختصة بمتابعة الأسعار العالمية نقوم بالتحقق من أفضل الأسعار المتواجدة في السوق ومشاركتها مع عملائنا.التواجد لخدمتكم وشكرًا لثقتكم بنا.',
              fontSize: 12.5.sp,
              color: Colors.black,
              maxLines: 3,
              fontWeight: null,
            ),
            Gap(5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'الموافقة على الشروط و سياسة الخصوصية',
                  style: TextStyle(
                    fontSize: 12.sp,
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
            Gap(
              2.5.h,
            ),
            CustomButtonWidget(
              onPressed: () {
                if (_isChecked &&
                    ChangePlanRequestBodyModel().planInvoiceId != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChangePlanView(
                        plan: widget.plans
                            .where(
                              (plan) =>
                                  plan.id ==
                                  ChangePlanRequestBodyModel().planInvoiceId,
                            )
                            .first,
                      ),
                    ),
                  );
                }
              },
              widget: CustomText(
                text: 'تفعيل الاشتراك',
                fontSize: 20.sp,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
