abstract class QrCodeState {}

final class QrCodeInitial extends QrCodeState {}

final class QrCodeScannedSuccessfullyState extends QrCodeState {
  String qrCodeResult;

  QrCodeScannedSuccessfullyState({required this.qrCodeResult});
}

class QrCodeDataLoaded extends QrCodeState {
  Map<String, dynamic> user;
  QrCodeDataLoaded({required this.user});
}
