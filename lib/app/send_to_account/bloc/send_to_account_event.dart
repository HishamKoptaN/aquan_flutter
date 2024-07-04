part of 'send_to_account_bloc.dart';

abstract class SendToAccountEvent {}

class ScanQrCodeEvent extends SendToAccountEvent {}

class GetNameOfUserByAccountEvent extends SendToAccountEvent {
  final String accountId;
  GetNameOfUserByAccountEvent({required this.accountId});
}

class GetUSerDataEvent extends SendToAccountEvent {}

class SendPaymentToOtherAccount extends SendToAccountEvent {
  final String accountId;
  final String amount;

  SendPaymentToOtherAccount({required this.accountId, required this.amount});
}