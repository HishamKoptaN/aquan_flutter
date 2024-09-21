part of 'send_to_account_bloc.dart';

abstract class SendToAccountState {}

class SendToAccountLoading extends SendToAccountState {}

class SendToAccountInitial extends SendToAccountState {}

class ScanQrCodeState extends SendToAccountState {}

class BarCodeScannedSuccessfully extends SendToAccountState {
  final String barcodeValue;
  BarCodeScannedSuccessfully({required this.barcodeValue});
}

class UserNameLoaded extends SendToAccountState {
  final GetUserByAccountApiResModel getUserByAccountApiResModel;
  UserNameLoaded({required this.getUserByAccountApiResModel});
}

class AmountSentSuccessfully extends SendToAccountState {}

class SendToAccountError extends SendToAccountState {
  final String message;
  SendToAccountError({required this.message});
}
