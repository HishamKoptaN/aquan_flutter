import 'package:aquan/Helpers/colors.dart';
import 'package:aquan/app/Layouts/app_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../bloc/deposits_withdraw_bloc.dart';

class WithdrawsAndDepositsView extends StatefulWidget {
  const WithdrawsAndDepositsView({super.key});
  @override
  State<WithdrawsAndDepositsView> createState() =>
      _WithdrawsAndDepositsViewState();
}

class _WithdrawsAndDepositsViewState extends State<WithdrawsAndDepositsView> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final t = AppLocalizations.of(context)!;
    return AppLayout(
      route: t.withdrawsAndDeposits,
      showAppBar: true,
      body: Container(
        padding: const EdgeInsets.all(0),
        child: BlocProvider<DeposistWithdrawsBloc>(
          create: (context) => DeposistWithdrawsBloc()
            ..add(
              GetWithdrawDeposits(),
            ),
          child: BlocBuilder<DeposistWithdrawsBloc, DepositWithdrawState>(
            builder: (context, state) {
              if (state is DepositsWithdrawDone) {
                if (state.depositsWithdraw.isEmpty) {
                  return Center(
                    child: Text(t.noTransactions),
                  );
                }
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
                state.depositsWithdraw.every(
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
                                transaction.amountFormatted ?? '',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: wi,
                              child: Text(
                                transaction.type ?? '',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: wi,
                              child: Text(
                                transaction.createdAt ?? '',
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
