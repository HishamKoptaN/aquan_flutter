import 'package:aquan/app/Layouts/app_layout.dart';
import 'package:aquan/app/transaction/bloc/transaction_bloc.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../Helpers/colors.dart';

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
                List<DataRow> childs = [];
                TextStyle style = const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                );

                state.transactions.every(
                  (transaction) {
                    String status = t.pending;
                    Color color = Colors.orange;

                    if (transaction.status! == "completed") {
                      status = t.completed;
                      color = Colors.green;
                    }
                    if (transaction.status! == "rejected") {
                      status = t.rejected;
                      color = Colors.red;
                    }

                    childs.add(
                      DataRow(
                        cells: [
                          DataCell(
                            Text(
                              transaction.id.toString(),
                              style: style,
                            ),
                          ),
                          DataCell(
                            Text(
                              status,
                              style: TextStyle(
                                fontSize: 12,
                                color: color,
                              ),
                            ),
                          ),
                          DataCell(
                            Text(
                              transaction.amount.toString(),
                              style: style,
                            ),
                          ),
                          DataCell(
                            Text(
                              transaction.senderCurrency!.name!,
                              style: style,
                            ),
                          ),
                          DataCell(
                            Text(
                              transaction.receiverCurrency!.name!,
                              style: style,
                            ),
                          ),
                          DataCell(
                            Text(
                              transaction.createdDate!,
                              style: style,
                            ),
                          ),
                        ],
                      ),
                    );
                    return true;
                  },
                );

                return DataTable2(
                  columnSpacing: 12,
                  horizontalMargin: 12,
                  minWidth: size.width,
                  columns: [
                    DataColumn(
                      label: Text(
                        t.id,
                        style: style,
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        t.status,
                        style: style,
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        t.thePrice,
                        style: style,
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        t.fromCurrency,
                        style: style,
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        t.toCurrency,
                        style: style,
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        t.date,
                        style: style,
                      ),
                    ),
                  ],
                  rows: childs,
                );
              }

              if (state is TransactionsDone) {
                List<Widget> childs = [];
                double wi = (size.width / 5) - 5;
                TextStyle style = const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 8,
                );

                childs.add(
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.deepOrange.shade700,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: wi,
                          child: Text(
                            t.id,
                            style: style,
                          ),
                        ),
                        SizedBox(
                          width: wi,
                          child: Text(
                            t.status,
                            style: style,
                          ),
                        ),
                        SizedBox(
                          width: wi,
                          child: Text(
                            t.thePrice,
                            style: style,
                          ),
                        ),
                        SizedBox(
                          width: wi,
                          child: Text(
                            t.fromCurrency,
                            style: style,
                          ),
                        ),
                        SizedBox(
                          width: wi,
                          child: Text(
                            t.toCurrency,
                            style: style,
                          ),
                        ),
                        SizedBox(
                          width: wi,
                          child: Text(
                            t.date,
                            style: style,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
                state.transactions.every(
                  (transaction) {
                    String status = t.pending;
                    Color color = Colors.orange;
                    if (transaction.status! == "completed") {
                      status = t.completed;
                      color = Colors.green;
                    }
                    if (transaction.status! == "rejected") {
                      status = t.rejected;
                      color = Colors.red;
                    }
                    childs.add(
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: wi,
                              child: Text(
                                status,
                                style: style,
                              ),
                            ),
                            SizedBox(
                              width: wi,
                              child: Text(
                                transaction.amountFormated.toString(),
                                style: style,
                              ),
                            ),
                            SizedBox(
                              width: wi,
                              child: Text(
                                transaction.senderCurrency!.name!,
                                style: style,
                              ),
                            ),
                            SizedBox(
                              width: wi,
                              child: Text(
                                transaction.receiverCurrency!.name!,
                                style: style,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                    return true;
                  },
                );
                return ListView(
                  children: childs,
                );
              }
              return Center(
                child: CircularProgressIndicator(
                  color: amber,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
