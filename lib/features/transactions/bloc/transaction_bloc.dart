import 'package:aquan/features/transactions/controller/transaction_controller.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/transaction_model.dart';
part 'transaction_event.dart';
part 'transaction_state.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  final TransactionController _controller = TransactionController();
  TransactionBloc() : super(TransactionInitial()) {
    on<TransactionEvent>(
      (event, emit) async {
        emit(TransactionLoading());
        Map<String, dynamic> data = await _controller.getTransactions();
        GetTransactionsApiResModel getTransactionsApiResModel =
            GetTransactionsApiResModel.fromJson(data);
        if (data['status']) {
          emit(
            TransactionsDone(
              getTransactionsApiResModel: getTransactionsApiResModel,
            ),
          );
        } else if (!data['status']) {
          emit(
            TransactionError(
              message: data['error'],
            ),
          );
        }
      },
    );
  }
}
