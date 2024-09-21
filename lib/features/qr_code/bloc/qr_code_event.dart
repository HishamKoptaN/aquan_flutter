abstract class QrCodeEvent {}

class ShareQrCode extends QrCodeEvent {}

class ScanQrCode extends QrCodeEvent {}

class GetQrCodeData extends QrCodeEvent {}
