import 'package:aquan/features/deposit/pesent/bloc/deposits_bloc.dart';
import 'package:aquan/features/deposit/pesent/bloc/deposits_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/di/dependency_injection.dart';
import '../../../../../core/widgets/widget_column_header.dart';
import '../../../../layouts/app_layout.dart';
import '../../../data/model/deposits_res_model.dart';
import '../../bloc/deposits_state.dart';

class DepositsView extends StatelessWidget {
  const DepositsView({
    super.key,
  });
  @override
  Widget build(context) {
    final t = AppLocalizations.of(context)!;
    return AppLayout(
      route: t.deposits,
      showAppBar: true,
      body: BlocProvider<DepositsBloc>(
        create: (context) => getIt<DepositsBloc>(
        )..add(
            const DepositEvent.get(),
          ),
        child: BlocBuilder<DepositsBloc, DepositsState>(
          builder: (context, state) {
            state.whenOrNull(
              initial: () {
                const DepositEvent.get();
              },
            );
            return state.maybeWhen(
              depositsLoaded: (
                deposits,
              ) {
                return ListView.builder(
                  itemCount: deposits.deposits!.length + 1,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.deepOrange.shade700,
                          borderRadius: BorderRadius.circular(10),
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
                              t.deposit_method,
                            ),
                            buildColumnHeader(
                              t.date,
                            ),
                          ],
                        ),
                      );
                    }
                    final deposit = deposits.deposits![index - 1];
                    String status = t.pending;
                    Color color = Colors.orange;
                    if (deposit.status == "completed") {
                      status = t.completed;
                      color = Colors.green;
                    }
                    if (deposit.status == "rejected") {
                      status = t.rejected;
                      color = Colors.red;
                    }
                    return buildWithdrawRow(
                      deposit,
                      status,
                      color,
                      t,
                    );
                  },
                );
              },
              loading: () {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.amber,
                  ),
                );
              },
              orElse: () {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.amber,
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget buildWithdrawRow(
    Deposit deposit,
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
          buildTransactionDetail(
            text: deposit.id.toString(),
          ),
          buildTransactionDetail(
            text: status,
          ),
          buildTransactionDetail(
            text: deposit.amount.toString(),
            isPrice: true,
          ),
          buildTransactionDetail(
            text: deposit.currency!.name!,
          ),
          buildTransactionDetail(
            text: deposit.createdAt!,
          ),
          // buildTransactionDetail(withdraw.createdAt),
        ],
      ),
    );
  }
}
