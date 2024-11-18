import 'package:aquan/features/deposit/pesent/bloc/deposit_bloc.dart';
import 'package:aquan/features/Layouts/app_layout.dart';
import 'package:aquan/features/deposit/pesent/bloc/deposit_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import '../../../../../core/di/dependency_injection.dart';
import '../../bloc/deposit_state.dart';

class DepositsView extends StatelessWidget {
  const DepositsView({
    super.key,
  });
  @override
  Widget build(context) {
    Size size = MediaQuery.of(context).size;
    final t = AppLocalizations.of(context)!;
    return AppLayout(
      route: t.deposits,
      showAppBar: true,
      body: BlocProvider<DepositBloc>(
        create: (context) => DepositBloc(
          getDepositstUseCase: getIt(),
          getEmployeeAccountUseCase: getIt(),
          depositUseCase: getIt(),
        ),
        child: BlocBuilder<DepositBloc, DepositState>(
          builder: (context, state) {
            state.whenOrNull(
              initial: () {
                const DepositEvent.get();
              },
            );
            return state.maybeWhen(
              depositsLoaded: (
                depositsResModel,
              ) {
                List<Widget> childs = [];
                childs.add(
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      color: Colors.black,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: (size.width / 3) - 10,
                          child: Text(
                            t.status,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          width: (size.width / 3) - 10,
                          child: Text(
                            t.amount,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          width: (size.width / 3) - 10,
                          child: Text(
                            t.method,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
                depositsResModel.deposits!.every(
                  (transaction) {
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
                              width: (size.width / 3) - 10,
                              child: Text(
                                transaction.status!,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: (size.width / 3) - 10,
                              child: Text(
                                NumberFormat('#,##0').format(
                                  transaction.amount,
                                ),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: (size.width / 3) - 10,
                              child: Text(
                                transaction.currency!.name!,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
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
}
