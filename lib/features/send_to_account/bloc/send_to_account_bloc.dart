import 'package:bloc/bloc.dart';
import 'package:local_auth/local_auth.dart';
import '../controller/send_to_account_controller.dart';
import '../model/send_to_account_model.dart';
part 'send_to_account_event.dart';
part 'send_to_account_state.dart';

class SendToAccountBloc extends Bloc<SendToAccountEvent, SendToAccountState> {
  final SendToAccountController sendToAccountController =
      SendToAccountController();
  final LocalAuthentication auth = LocalAuthentication();
  SendToAccountBloc() : super(SendToAccountInitial()) {
    on<ScanQrCodeEvent>(
      (event, emit) async {
        // String barcodeValue = await sendToAccountController.scan();
        // if (barcodeValue.isNotEmpty) {
        //   emit(
        //     BarCodeScannedSuccessfully(barcodeValue: barcodeValue),
        //   );
        // } else {
        //   emit(
        //     SendToAccountError(message: 'No barcode found'),
        //   );
        // }
      },
    );

    on<GetNameOfUserByAccountEvent>(
      (event, emit) async {
        emit(
          SendToAccountLoading(),
        );
        Map<String, dynamic> data =
            await sendToAccountController.getUserByAccountNumber(
          event.accountNumber,
        );
        GetUserByAccountApiResModel getUserByAccountApiResModel =
            GetUserByAccountApiResModel.fromJson(data);
        if (data['status']) {
          emit(
            UserNameLoaded(
              getUserByAccountApiResModel: getUserByAccountApiResModel,
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
    on<SendPaymentToOtherAccount>(
      (event, emit) async {
        emit(
          SendToAccountLoading(),
        );
        Map<String, dynamic> data =
            await sendToAccountController.sendMoneyToAccount(
          event.accountNumber,
          event.amount,
        );
        if (data['status']) {
          emit(AmountSentSuccessfully());
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
}
