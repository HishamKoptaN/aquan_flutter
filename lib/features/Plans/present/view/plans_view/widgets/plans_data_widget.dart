import 'package:aquan/all_imports.dart';

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
  Plan? selectedPlan;
  bool _isChecked = false;

  @override
  Widget build(context) {
    final t = AppLocalizations.of(context)!;
    return Center(
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
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: widget.plans.length,
            itemBuilder: (context, index) {
              final plan = widget.plans[index];
              return GestureDetector(
                onTap: () {
                  if (plan.id !=
                      UserSingleton.instance.user!.userPlan!.planId) {
                    setState(
                      () {
                        selectedPlan = plan;
                      },
                    );
                  }
                },
                child: SubscriptionOption(
                  plan: plan,
                  selectedPlanId: selectedPlan?.id,
                ),
              );
            },
          ),
          Gap(
            2.5.h,
          ),
          CustomText(
            text:
                'نحن كمنصة مختصة بمتابعة الأسعار العالمية نقوم بالتحقق من أفضل الأسعار المتواجدة في السوق ومشاركتها مع عملائنا.التواجد لخدمتكم وشكرًا لثقتكم بنا.',
            fontSize: 12.5.sp,
            color: Colors.black,
            maxLines: 3,
            fontWeight: null,
          ),
          Gap(
            2.5.h,
          ),
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
                onChanged: (value) {
                  setState(
                    () {
                      _isChecked = value ?? false;
                    },
                  );
                },
              ),
            ],
          ),
          Gap(
            2.5.h,
          ),
          CustomTextButtonWidget(
            onPressed: () {
              if (_isChecked && selectedPlan != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChangePlanView(
                      selectedPlan: selectedPlan!,
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
    );
  }
}
