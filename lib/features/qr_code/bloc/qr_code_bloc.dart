import 'package:bloc/bloc.dart';
import 'qr_code_event.dart';
import 'qr_code_state.dart';

class QrCodeBloc extends Bloc<QrCodeEvent, QrCodeState> {
  QrCodeBloc() : super(QrCodeInitial()) {
    on<GetQrCodeData>(
      (event, emit) async {},
    );
    on<ShareQrCode>(
      (event, emit) {},
    );
  }
}
