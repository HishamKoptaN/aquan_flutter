import 'package:aquan/features/layouts/app_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../../../core/utils/side_menu_items.dart';
import '../../navigator_bottom_bar/bottom_navigation_bar_view.dart';
import '../bloc/withdraws_deposits_bloc.dart';

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
      onPressed: () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const NavigateBarView(),
          ),
          (route) => false,
        );
      },
      body: Container(
        padding: const EdgeInsets.all(0),
        child: BlocProvider<DeposistWithdrawsBloc>(
          create: (context) => DeposistWithdrawsBloc()
            ..add(
              GetWithdrawDeposits(),
            ),
          child: BlocBuilder<DeposistWithdrawsBloc, DepositWithdrawState>(
            builder: (context, state) {
              if (state is WithdrawsDepositsLoadedSuccessfully) {
                return SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        columnSpacing: 7.5.w,
                        columns: [
                          dataColumn(
                            label: t.id,
                          ),
                          dataColumn(
                            label: t.type,
                          ),
                          dataColumn(
                            label: t.status,
                          ),
                          dataColumn(
                            label: t.thePrice,
                          ),
                          dataColumn(
                            label: t.withdraw_method,
                          ),
                          dataColumn(
                            label: t.date,
                          ),
                        ],
                        rows: state
                            .getWithdrawDepositsApiResModel.withdrawsDeposits
                            .map(
                          (withdraw) {
                            String status = t.pending;
                            String type = "";
                            Color color = Colors.orange;
                            if (withdraw.type == "withdraw") {
                              type = t.withdraw;
                              color = Colors.green;
                            }
                            if (withdraw.type == "deposit") {
                              type = t.deposit;
                              color = Colors.green;
                            }
                            if (withdraw.status == "completed") {
                              status = t.completed;
                              color = Colors.green;
                            }
                            if (withdraw.status == "rejected") {
                              status = t.rejected;
                              color = Colors.red;
                            }
                            return DataRow(
                              cells: [
                                dataCell(
                                  title: withdraw.id.toString(),
                                ),
                                dataCell(
                                  title: type,
                                ),
                                dataCell(title: status, color: color),
                                dataCell(
                                  title: NumberFormat('#,##0').format(
                                    withdraw.amount,
                                  ),
                                ),
                                dataCell(
                                  title: withdraw.currency.name ?? '',
                                ),
                                dataCell(
                                  title: withdraw.createdAt.toString(),
                                ),
                              ],
                            );
                          },
                        ).toList(),
                      )),
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
