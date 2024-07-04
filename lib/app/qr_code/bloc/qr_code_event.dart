part of 'qr_code_bloc.dart';

@immutable
sealed class QrCodeEvent {}

class ShareQrCode extends QrCodeEvent {}

class ScanQrCode extends QrCodeEvent {}

class GetNameOfUserByAccountEvent extends QrCodeEvent {
  final String accountId;

  GetNameOfUserByAccountEvent({required this.accountId});
}
