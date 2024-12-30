import 'package:aquan/features/withdraw/data/model/withdraws_res_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/widgets/custom_circular_progress.dart';
import '../../../../core/widgets/widget_column_header.dart';
import '../../../layouts/app_layout.dart';
import '../bloc/withdraws_bloc.dart';
import '../bloc/withdraws_event.dart';
import '../bloc/withdraws_state.dart';

class WithdrawsView extends StatefulWidget {
  const WithdrawsView({super.key});
  @override
  State<WithdrawsView> createState() => _WithdrawsViewState();
}

class _WithdrawsViewState extends State<WithdrawsView> {
  @override
  Widget build(
    BuildContext context,
  ) {
    Size size = MediaQuery.of(context).size;
    final t = AppLocalizations.of(context)!;
    return AppLayout(
      route: t.withdraws,
      showAppBar: true,
      body: Container(
        padding: const EdgeInsets.all(0),
        child: BlocProvider<WithdrawsBloc>(
          create: (context) => WithdrawsBloc(
            getWithdrawsUseCase: getIt(),
            getWithdrawRatesUseCase: getIt(),
            addWithdrawUseCase: getIt(),
          )..add(
              const WithdrawsEvent.getWithdraws(),
            ),
          child: BlocBuilder<WithdrawsBloc, WithdrawsState>(
            builder: (context, state) {
              return state.maybeWhen(
                withdrawsLoaded: (withdraws) {
                  return ListView.builder(
                    itemCount: withdraws!.length + 1,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return Container(
                          padding: const EdgeInsets.all(
                            10,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.deepOrange.shade700,
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              buildColumnHeader(
                                t.id,
                              ),
                              buildColumnHeader(
                                t.status,
                              ),
                              buildColumnHeader(
                                t.thePrice,
                              ),
                              buildColumnHeader(
                                t.withdraw_method,
                              ),
                              buildColumnHeader(
                                t.date,
                              ),
                            ],
                          ),
                        );
                      }
                      final withdraw = withdraws[index - 1];
                      String status = t.pending;
                      Color color = Colors.orange;
                      if (withdraw.status == "accepted") {
                        status = t.completed;
                        color = Colors.green;
                      }
                      if (withdraw.status == "rejected") {
                        status = t.rejected;
                        color = Colors.red;
                      }
                      return buildWithdrawRow(
                        withdraw,
                        status,
                        color,
                        t,
                      );
                    },
                  );
                },
                orElse: () {
                  return const Center(
                    child: CustomCircularProgress(),
                  );
                },
                loading: () {
                  return const Center(
                    child: CustomCircularProgress(),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }

  Widget buildWithdrawRow(
    Withdraw withdraw,
    String status,
    Color color,
    t,
  ) {
    return Container(
      width: 40.w,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buildTransactionDetail(text: withdraw.id.toString()),
          buildTransactionDetail(
            text: status,
          ),
          buildTransactionDetail(
              text: withdraw.amount.toString(), isPrice: true),
          buildTransactionDetail(
            text: withdraw.currency!.name!,
          ),
          buildTransactionDetail(
            text: withdraw.createdAt!,
          ),
        ],
      ),
    );
  }
}
