part of 'send_to_account_bloc.dart';

abstract class SendToAccountState {}

class SendToAccountLoading extends SendToAccountState {}

class SendToAccountInitial extends SendToAccountState {}

class GetUSerDataLoadedState extends SendToAccountState {
  final List<Transaction> transactions;
  final List<Currency> currencies;
  final User user;

  GetUSerDataLoadedState({
    required this.transactions,
    required this.user,
    required this.currencies,
  });
}

class GetUserName extends SendToAccountState {}

class ScanQrCodeState extends SendToAccountState {}

class BarCodeScannedSuccessfully extends SendToAccountState {
  final String barcodeValue;

  BarCodeScannedSuccessfully({required this.barcodeValue});
}

class UserNameLoaded extends SendToAccountState {
  final String name;

  UserNameLoaded({required this.name});
}

class AmountSent extends SendToAccountState {}

class SendToAccountError extends SendToAccountState {
  final String message;

  SendToAccountError({required this.message});
}
