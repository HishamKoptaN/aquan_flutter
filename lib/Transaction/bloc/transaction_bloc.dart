import 'package:aquan/Controllers/transaction_controller.dart';
import 'package:aquan/Models/transaction.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'transaction_event.dart';
part 'transaction_state.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  final TransactionController _controller = TransactionController();

  TransactionBloc() : super(TransactionInitial()) {
    on<TransactionEvent>((event, emit) async {
      emit(TransactionLoading());

      Map<String, dynamic> data = await _controller.getTransactions();

      if (data['status']) {
        List trs = data['transactions'];

        List<Transaction> transactions = trs
            .map((transaction) => Transaction.fromJson(transaction))
            .toList();

        emit(TransactionsDone(transactions: transactions));
      } else {
        emit(TransactionError(message: data['error']));
      }
    });
  }
}
