import 'package:bloc/bloc.dart';
import '../../dashboard/controller/dashboard_controller.dart';
import '../controller/qr_code_controller.dart';
import 'qr_code_event.dart';
import 'qr_code_state.dart';

class QrCodeBloc extends Bloc<QrCodeEvent, QrCodeState> {
  final ScanQrController scanQrController = ScanQrController();
  final DashboardController _dashboardController = DashboardController();

  QrCodeBloc() : super(QrCodeInitial()) {
    on<GetQrCodeData>(
      (event, emit) async {
        Map<String, dynamic> user = await _dashboardController.loadUserData();
        if (user.isNotEmpty) {
          emit(
            QrCodeDataLoaded(user: user),
          );
        }
      },
    );
    on<ShareQrCode>(
      (event, emit) {},
    );
  }
}
