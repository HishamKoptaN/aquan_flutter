import 'package:aquan/core/utils/app_colors.dart';
import 'package:aquan/features/Layouts/app_layout.dart';
import 'package:aquan/features/withdraw/bloc/withdraw_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WithdrawsView extends StatefulWidget {
  const WithdrawsView({super.key});
  @override
  State<WithdrawsView> createState() => _WithdrawsViewState();
}

class _WithdrawsViewState extends State<WithdrawsView> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final t = AppLocalizations.of(context)!;
    return AppLayout(
      route: t.withdraws,
      showAppBar: true,
      body: Container(
        padding: const EdgeInsets.all(0),
        child: BlocProvider<WithdrawBloc>(
          create: (context) => WithdrawBloc()
            ..add(
              GetWithdraws(),
            ),
          child: BlocBuilder<WithdrawBloc, WithdrawState>(
            builder: (context, state) {
              if (state is WithdrawsLoadedSuccessfully) {
                List<Widget> childs = [];
                double width = (size.width / 6) - 10;
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
                          width: width,
                          child: Text(
                            t.id,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: width,
                          child: Text(
                            t.status,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: width,
                          child: Text(
                            t.thePrice,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: width,
                          child: Text(
                            t.method,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: width,
                          child: Text(
                            t.date,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
                state.invoices.every(
                  (withdraw) {
                    String status = t.pending;
                    Color color = Colors.orange;
                    if (withdraw.status == "completed") {
                      status = t.completed;
                      color = Colors.green;
                    }
                    if (withdraw.status == "rejected") {
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
                              width: width,
                              child: Text(
                                withdraw.id.toString(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: width,
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
                              width: width,
                              child: Text(
                                withdraw.amount.toString(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: width,
                              child: Text(
                                withdraw.currency.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: width,
                              child: Text(
                                withdraw.createdAt,
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
