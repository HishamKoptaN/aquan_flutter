part of 'qr_code_bloc.dart';

@immutable
sealed class QrCodeEvent {}

class ShareQrCode extends QrCodeEvent {}
