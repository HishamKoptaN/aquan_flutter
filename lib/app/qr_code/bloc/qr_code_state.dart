part of 'qr_code_bloc.dart';

@immutable
sealed class QrCodeState {}

final class QrCodeInitial extends QrCodeState {}

@immutable
final class QrCodeScannedSuccessfullyState extends QrCodeState {
  String qrCodeResult = "1";

  QrCodeScannedSuccessfullyState({required this.qrCodeResult});
}
