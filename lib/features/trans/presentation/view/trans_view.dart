import 'package:aquan/features/layouts/app_layout.dart';
import 'package:aquan/features/trans/presentation/bloc/trans_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/singletons/trans_singleton.dart';
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
            return Center(
              child: SizedBox.expand(
                child: BlocConsumer<TransBloc, TransState>(
                  listener: (context, state) {
                    state.whenOrNull();
                  },
                  builder: (context, state) {
                    return ListView.builder(
                      itemCount: TransDataStorage().trans!.length + 1,
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
                                _buildColumnHeader(t.id),
                                _buildColumnHeader(t.status),
                                _buildColumnHeader(t.thePrice),
                                _buildColumnHeader(t.fromCurrency),
                                _buildColumnHeader(t.toCurrency),
                                _buildColumnHeader(t.date),
                              ],
                            ),
                          );
                        }
                        final transaction =
                            TransDataStorage().trans![index - 1];
                        String status = t.pending;
                        Color color = Colors.orange;
                        if (transaction.status == "completed") {
                          status = t.completed;
                          color = Colors.green;
                        } else if (transaction.status == "rejected") {
                          status = t.rejected;
                          color = Colors.red;
                        }
                        return _buildTransactionRow(
                            transaction, status, color, t);
                      },
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildColumnHeader(String label) {
    return SizedBox(
      width: 40.w,
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildTransactionRow(transaction, String status, Color color, t) {
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
          _buildTransactionDetail(transaction.id.toString()),
          _buildTransactionDetail(
            status,
            textColor: color,
          ),
          _buildTransactionDetail(
            NumberFormat('#,##0').format(transaction.amount),
          ),
          _buildTransactionDetail(transaction.senderCurrency.name),
          _buildTransactionDetail(transaction.receiverCurrency.name),
          _buildTransactionDetail(transaction.createdAt),
        ],
      ),
    );
  }

  Widget _buildTransactionDetail(String text, {Color? textColor}) {
    return SizedBox(
      width: 40.w,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12,
          color: textColor ?? Colors.black,
        ),
      ),
    );
  }
}
