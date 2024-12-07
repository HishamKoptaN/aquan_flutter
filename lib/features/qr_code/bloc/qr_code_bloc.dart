import 'package:bloc/bloc.dart';
import '../controller/qr_code_controller.dart';
import 'qr_code_event.dart';
import 'qr_code_state.dart';

class QrCodeBloc extends Bloc<QrCodeEvent, QrCodeState> {
  final ScanQrController scanQrController = ScanQrController();

  QrCodeBloc() : super(QrCodeInitial()) {
    on<GetQrCodeData>(
      (event, emit) async {},
    );
    on<ShareQrCode>(
      (event, emit) {},
    );
  }
}
