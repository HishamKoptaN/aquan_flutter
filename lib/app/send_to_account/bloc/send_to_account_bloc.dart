import 'package:bloc/bloc.dart';
import 'package:local_auth/local_auth.dart';
import '../../Auth/model/user.dart';
import '../../buy_sell/model/buy_sell_model.dart';
import '../../profile/model/profile_model.dart';
import '../../transaction/model/transaction_model.dart';
import '../controller/send_to_account_controller.dart';
part 'send_to_account_event.dart';
part 'send_to_account_state.dart';

class SendToAccountBloc extends Bloc<SendToAccountEvent, SendToAccountState> {
  final SendToAccountController sendToAccountController =
      SendToAccountController();
  final LocalAuthentication auth = LocalAuthentication();
  SendToAccountBloc() : super(SendToAccountInitial()) {
    on<ScanQrCodeEvent>(
      (event, emit) async {
        String barcodeValue = await sendToAccountController.scan();
        if (barcodeValue.isNotEmpty) {
          emit(
            BarCodeScannedSuccessfully(barcodeValue: barcodeValue),
          );
        } else {
          emit(
            SendToAccountError(message: 'No barcode found'),
          );
        }
      },
    );

    on<SendPaymentToOtherAccount>(
      (event, emit) async {
        Map<String, dynamic> data = await sendToAccountController
            .sendMoneyToAccount(event.accountId, event.amount);

        if (data['status']) {
          emit(AmountSent());
        } else {
          emit(
            SendToAccountError(
              message: data['error'],
            ),
          );
        }
      },
    );
    on<GetNameOfUserByAccountEvent>(
      (event, emit) async {
        emit(
          SendToAccountLoading(),
        );
        Map<String, dynamic> data =
            await sendToAccountController.getUserByAccount(
          event.accountId,
        );

        if (data['status']) {
          emit(
            UserNameLoaded(
              name: data['name'],
            ),
          );
        } else if (!data['status']) {
          emit(
            SendToAccountError(
              message: data['error'],
            ),
          );
        }
      },
    );
  }

  @override
  void onTransition(
      Transition<SendToAccountEvent, SendToAccountState> transition) {
    super.onTransition(transition);
  }
}
