import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../controller/scan_qr_controller.dart';
part 'qr_code_event.dart';
part 'qr_code_state.dart';

class QrCodeBloc extends Bloc<QrCodeEvent, QrCodeState> {
  final ScanQrController scanQrController = ScanQrController();

  QrCodeBloc() : super(QrCodeInitial()) {
    on<ScanQrCode>(
      (event, emit) async {
        String? barcode = await scanQrController.scan();
        if (barcode == null) {
          emit(
            QrCodeScannedSuccessfullyState(qrCodeResult: "1"),
          );
        } else {}
      },
    );

    on<ShareQrCode>(
      (event, emit) {},
    );
  }
}
