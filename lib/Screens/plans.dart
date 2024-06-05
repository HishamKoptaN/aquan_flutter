import 'package:aquan/Helpers/colors.dart';
import 'package:aquan/Layouts/app_layout.dart';
import 'package:aquan/Models/plan.dart';
import 'package:aquan/Plan/Widgets/plan_row.dart';
import 'package:aquan/Plan/bloc/plan_bloc.dart';
import 'package:aquan/Screens/change_plan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PlansScreen extends StatelessWidget {
  const PlansScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    return AppLayout(
      route: t.plans,
      body: Container(
        padding: const EdgeInsets.all(20),
        child: BlocProvider<PlanBloc>(
          create: (context) => PlanBloc()..add(GetPlans()),
          child: BlocBuilder<PlanBloc, PlanState>(
            builder: (context, state) {
              if (state is PlansDone) {
                return ListView.separated(
                    itemBuilder: (context, index) {
                      Plan plan = state.plans[index];
                      return Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: (state.user.planId == plan.id)
                              ? secondary
                              : Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            PlanRow(
                              title: t.planName,
                              value: plan.name!,
                            ),
                            // PlanRow(
                            //   title: t.priceOfSelling,
                            //   value: plan.sellingPrice.toString(),
                            // ),
                            // PlanRow(
                            //   title: t.priceOfBuying,
                            //   value: plan.buyingPrice.toString(),
                            // ),
                            PlanRow(
                              title: t.dailyTransfers,
                              value: plan.dailyTransferCount.toString(),
                            ),
                            PlanRow(
                              title: t.monthlyTransfers,
                              value: plan.monthlyTransferCount.toString(),
                            ),
                            PlanRow(
                              title: t.maxTransfer,
                              value: plan.maxTransferCount.toString(),
                            ),
                            const Gap(20),
                            SizedBox(
                              child: TextButton(
                                onPressed: () {
                                  if (plan.amount! > 0 &&
                                      plan.id != state.user.planId) {
                                    WidgetsBinding.instance
                                        .addPostFrameCallback(
                                      (_) => Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ChangePlanScreen(
                                            plan: plan,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                },
                                style: TextButton.styleFrom(
                                  textStyle: const TextStyle(fontSize: 20),
                                  backgroundColor: white,
                                  padding: const EdgeInsets.all(15),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    side: const BorderSide(
                                      color: white,
                                    ),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      (plan.id == state.user.planId)
                                          ? MainAxisAlignment.spaceBetween
                                          : MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      (plan.amount! > 0)
                                          ? "${t.buyNow} ${plan.amountFormated}"
                                          : t.free,
                                      style: const TextStyle(
                                        color: black,
                                        fontFamily: "Arial",
                                      ),
                                    ),
                                    if (plan.id == state.user.planId)
                                      Text(
                                        t.yourPlan,
                                        style: const TextStyle(
                                          color: black,
                                          fontFamily: "Arial",
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Gap(20);
                    },
                    itemCount: state.plans.length);
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
    );
  }
}
