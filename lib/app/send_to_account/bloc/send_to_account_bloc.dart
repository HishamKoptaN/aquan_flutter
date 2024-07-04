import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../Auth/controller/user_controller.dart';
import '../../Auth/model/user.dart';
import '../../currency/model/currency.dart';
import '../../transaction/model/transaction.dart';
import '../controller/send_to_account_controller.dart';

part 'send_to_account_event.dart';
part 'send_to_account_state.dart';

class SendToAccountBloc extends Bloc<SendToAccountEvent, SendToAccountState> {
  SendToAccountController sendToAccountController = SendToAccountController();
  final UserController _controller = UserController();

  SendToAccountBloc() : super(SendToAccountInitial()) {
    on<SendToAccountEvent>(
      (event, emit) {},
    );
    on<ScanQrCodeEvent>(
      (event, emit) async {
        String barcodeValue = await sendToAccountController.scan();
        if (barcodeValue.isNotEmpty) {
          emit(BarCodeScannedSuccessfully(barcodeValue: barcodeValue));
        } else {
          emit(SendToAccountError(message: 'No barcode found'));
        }
      },
    );
    on<GetUSerDataEvent>(
      (event, emit) async {
        Map<String, dynamic> data = await _controller.getDashboard();

        if (data['status']) {
          List trs = data['transactions'];
          List currs = data['currencies'];

          User user = User.fromJson(data['user']);
          List<Transaction> transactions =
              trs.map((tr) => Transaction.fromJson(tr)).toList();
          List<Currency> currencies =
              currs.map((curr) => Currency.fromJson(curr)).toList();

          emit(GetUSerDataLoadedState(
              transactions: transactions, user: user, currencies: currencies));
        } else {
          emit(SendToAccountError(message: data['error']));
        }
      },
    );
    on<SendPaymentToOtherAccount>(
      (event, emit) async {
        Map<String, dynamic> data =
            await _controller.sendMoneyToAccount(event.accountId, event.amount);

        if (data['status']) {
          emit(AmountSent());
        } else {
          emit(SendToAccountError(message: data['error']));
        }
      },
    );
    on<GetNameOfUserByAccountEvent>(
      (event, emit) async {
        emit(SendToAccountLoading());
        Map<String, dynamic> data =
            await _controller.getUserByAccount(event.accountId);

        if (data['status']) {
          emit(UserNameLoaded(name: data['name']));
        } else {
          emit(SendToAccountError(message: data['error']));
        }
      },
    );
  }

  @override
  void onTransition(
      Transition<SendToAccountEvent, SendToAccountState> transition) {
    super.onTransition(transition);
    print(transition);
  }
}
