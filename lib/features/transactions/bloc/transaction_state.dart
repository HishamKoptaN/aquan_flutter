part of 'transaction_bloc.dart';

abstract class TransactionState {}

final class TransactionInitial extends TransactionState {}

final class TransactionLoading extends TransactionState {}

final class TransactionError extends TransactionState {
  final String message;

  TransactionError({required this.message});
}

class TransactionsDone extends TransactionState {
  GetTransactionsApiResModel getTransactionsApiResModel;

  TransactionsDone({required this.getTransactionsApiResModel});
}
