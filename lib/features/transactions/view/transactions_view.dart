import 'package:aquan/features/Layouts/app_layout.dart';
import 'package:aquan/features/transactions/bloc/transaction_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import '../../../core/utils/app_colors.dart';

class TransactionsView extends StatelessWidget {
  const TransactionsView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final t = AppLocalizations.of(context)!;
    return AppLayout(
      route: t.transactions,
      showAppBar: true,
      body: Container(
        width: size.width,
        padding: const EdgeInsets.all(0),
        child: BlocProvider<TransactionBloc>(
          create: (context) => TransactionBloc()
            ..add(
              GetTransactions(),
            ),
          child: BlocBuilder<TransactionBloc, TransactionState>(
            builder: (context, state) {
              if (state is TransactionsDone) {
                double width = (size.width / 6) - 10;
                TextStyle style = const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                );
                return ListView.builder(
                  itemCount:
                      state.getTransactionsApiResModel.transfers!.length + 1,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.deepOrange.shade700,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: width,
                              child: Text(
                                t.id,
                                style: style,
                              ),
                            ),
                            SizedBox(
                              width: width,
                              child: Text(
                                t.status,
                                style: style,
                              ),
                            ),
                            SizedBox(
                              width: width,
                              child: Text(
                                t.thePrice,
                                style: style,
                              ),
                            ),
                            SizedBox(
                              width: width,
                              child: Text(t.fromCurrency, style: style),
                            ),
                            SizedBox(
                              width: width,
                              child: Text(
                                t.toCurrency,
                                style: style,
                              ),
                            ),
                            SizedBox(
                              width: width,
                              child: Text(
                                t.date,
                                style: style,
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                    final transaction =
                        state.getTransactionsApiResModel.transfers![index - 1];
                    String status = t.pending;
                    Color color = Colors.orange;
                    if (transaction.status == "completed") {
                      status = t.completed;
                      color = Colors.green;
                    } else if (transaction.status == "rejected") {
                      status = t.rejected;
                      color = Colors.red;
                    }
                    return Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: width,
                            child: Text(
                              transaction.id.toString(),
                              style: style,
                            ),
                          ),
                          SizedBox(
                            width: width,
                            child: Text(
                              status,
                              style: TextStyle(
                                fontSize: 12,
                                color: color,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: width,
                            child: Text(
                              NumberFormat('#,##0').format(
                                transaction.amount,
                              ),
                              style: style,
                            ),
                          ),
                          SizedBox(
                            width: width,
                            child: Text(
                              transaction.senderCurrency!.name!,
                              style: style,
                            ),
                          ),
                          SizedBox(
                            width: width,
                            child: Text(
                              transaction.receiverCurrency!.name!,
                              style: style,
                            ),
                          ),
                          SizedBox(
                            width: width,
                            child: Text(
                              transaction.createdAt!,
                              style: style,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }

              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.amber,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
