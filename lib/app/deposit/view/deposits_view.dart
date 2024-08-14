import 'package:aquan/app/deposit/bloc/deposit_bloc.dart';
import 'package:aquan/Helpers/colors.dart';
import 'package:aquan/app/Layouts/app_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DepositsView extends StatelessWidget {
  const DepositsView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final t = AppLocalizations.of(context)!;
    return AppLayout(
      route: t.deposits,
      showAppBar: false,
      body: BlocProvider<DepositBloc>(
        create: (context) => DepositBloc()
          ..add(
            GetDeposits(),
          ),
        child: BlocBuilder<DepositBloc, DepositState>(
          builder: (context, state) {
            if (state is DepositsDone) {
              List<Widget> childs = [];
              childs.add(
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: black,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: (size.width / 3) - 10,
                        child: Text(
                          t.status,
                          style: const TextStyle(color: white),
                        ),
                      ),
                      SizedBox(
                        width: (size.width / 3) - 10,
                        child: Text(
                          t.amount,
                          style: const TextStyle(color: white),
                        ),
                      ),
                      SizedBox(
                        width: (size.width / 3) - 10,
                        child: Text(
                          t.method,
                          style: const TextStyle(color: white),
                        ),
                      ),
                    ],
                  ),
                ),
              );
              // state.deposits.every(
              //   (transaction) {
              //     childs.add(
              //       Container(
              //         padding: const EdgeInsets.all(10),
              //         decoration: BoxDecoration(
              //           color: Colors.grey.shade300,
              //         ),
              //         child: Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceAround,
              //           children: [
              //             SizedBox(
              //               width: (size.width / 3) - 10,
              //               child: Text(
              //                 transaction.status!,
              //                 style: const TextStyle(
              //                   fontWeight: FontWeight.bold,
              //                 ),
              //               ),
              //             ),
              //             SizedBox(
              //               width: (size.width / 3) - 10,
              //               child: Text(
              //                 transaction.amount.toString(),
              //                 style: const TextStyle(
              //                   fontWeight: FontWeight.bold,
              //                 ),
              //               ),
              //             ),
              //             SizedBox(
              //               width: (size.width / 3) - 10,
              //               child: Text(
              //                 transaction.method!,
              //                 style: const TextStyle(
              //                   fontWeight: FontWeight.bold,
              //                 ),
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //     );
              //     return true;
              //   },
              // );
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
    );
  }
}
