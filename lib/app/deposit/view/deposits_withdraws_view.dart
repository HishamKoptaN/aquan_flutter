import 'package:aquan/Helpers/colors.dart';
import 'package:aquan/app/Layouts/app_layout.dart';
import 'package:aquan/app/withdraw/bloc/withdraw_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WithdrawsAndDepositsScreen extends StatefulWidget {
  const WithdrawsAndDepositsScreen({super.key});

  @override
  State<WithdrawsAndDepositsScreen> createState() =>
      _WithdrawsAndDepositsScreenState();
}

class _WithdrawsAndDepositsScreenState
    extends State<WithdrawsAndDepositsScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final t = AppLocalizations.of(context)!;

    return AppLayout(
      route: t.withdrawsAndDeposits,
      showAppBar: false,
      body: Container(
        padding: const EdgeInsets.all(0),
        child: BlocProvider<WithdrawBloc>(
          create: (context) => WithdrawBloc()
            ..add(
              GetWithdraws(),
            ),
          child: BlocBuilder<WithdrawBloc, WithdrawState>(
            builder: (context, state) {
              if (state is WithdrawsDone) {
                List<Widget> childs = [];

                double wi = (size.width / 6) - 10;

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
                            style: const TextStyle(
                              color: white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: wi,
                          child: Text(
                            t.operation,
                            style: const TextStyle(
                              color: white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: wi,
                          child: Text(
                            t.status,
                            style: const TextStyle(
                              color: white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: wi,
                          child: Text(
                            t.thePrice,
                            style: const TextStyle(
                              color: white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: wi,
                          child: Text(
                            t.method,
                            style: const TextStyle(
                              color: white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: wi,
                          child: Text(
                            t.date,
                            style: const TextStyle(
                              color: white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );

                state.invoices.every(
                  (transaction) {
                    String status = t.pending;
                    String operation = t.withdraw;
                    Color color = Colors.orange;

                    if (transaction.status == "completed") {
                      status = t.completed;
                      color = Colors.green;
                    }
                    if (transaction.status == "rejected") {
                      status = t.rejected;
                      color = Colors.red;
                    }

                    if (transaction.type == "deposit") {
                      operation = t.deposit;
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
                                transaction.id.toString(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: wi,
                              child: Text(
                                operation,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: wi,
                              child: Text(
                                status,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: color,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: wi,
                              child: Text(
                                transaction.amountFormated!,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: wi,
                              child: Text(
                                "${(transaction.type == 'deposit') ? transaction.data?.method : transaction.data?.wallet}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: wi,
                              child: Text(
                                transaction.createdDate!,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
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
