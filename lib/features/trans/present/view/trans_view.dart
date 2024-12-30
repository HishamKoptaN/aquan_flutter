import 'package:aquan/features/trans/present/bloc/trans_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/singletons/trans_singleton.dart';
import '../../../../core/widgets/widget_column_header.dart';
import '../../../layouts/app_layout.dart';
import '../../../navigator_bottom_bar/bottom_navigation_bar_view.dart';
import '../bloc/trans_state.dart';

class TransactionsView extends StatelessWidget {
  const TransactionsView({super.key});

  @override
  Widget build(context) {
    final t = AppLocalizations.of(context)!;
    return AppLayout(
      route: t.transactions,
      showAppBar: true,
      onPressed: () {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const NavigateBarView(),
            ),
            (route) => false);
      },
      body: BlocProvider(
        create: (context) => TransBloc(
          getIt(),
        ),
        child: BlocConsumer<TransBloc, TransState>(
          listener: (context, state) {
            state.whenOrNull();
          },
          builder: (context, state) {
            return BlocConsumer<TransBloc, TransState>(
              listener: (context, state) {
                state.whenOrNull();
              },
              builder: (context, state) {
                return ListView.builder(
                  itemCount: TransSingleton.instance.trans!.length + 1,
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
                              t.fromCurrency,
                            ),
                            buildColumnHeader(
                              t.toCurrency,
                            ),
                            buildColumnHeader(t.date),
                          ],
                        ),
                      );
                    }
                    final transaction =
                        TransSingleton.instance.trans![index - 1];
                    String status = t.pending;
                    Color color = Colors.orange;
                    if (transaction.status == "accepted") {
                      status = t.completed;
                      color = Colors.green;
                    } else if (transaction.status == "rejected") {
                      status = t.rejected;
                      color = Colors.red;
                    }
                    return buildTransactionRow(
                      transaction,
                      status,
                      color,
                      t,
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget buildTransactionRow(
    transaction,
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
            text: transaction.id.toString(),
          ),
          buildTransactionDetail(
            text: status,
          ),
          buildTransactionDetail(
            text: transaction.amount.toString(),
            isPrice: true,
          ),
          buildTransactionDetail(
            text: transaction.senderCurrency.name,
          ),
          buildTransactionDetail(
            text: transaction.receiverCurrency.name,
          ),
          buildTransactionDetail(
            text: transaction.createdAt,
          ),
        ],
      ),
    );
  }
}
