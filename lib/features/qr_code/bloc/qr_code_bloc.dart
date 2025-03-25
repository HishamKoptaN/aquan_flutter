import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'qr_code_event.dart';
import 'qr_code_state.dart';
@LazySingleton()

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
