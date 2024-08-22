import 'package:aquan/app/buy_sell/controller/buy_sell_controller.dart';
import 'package:aquan/app/Auth/controller/user_controller.dart';
import 'package:aquan/app/buy_sell/model/buy_sell_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'buy_sell_state.dart';
part 'buy_sell_event.dart';

class CurrencyBloc extends Bloc<CurrencyEvent, BuySellState> {
  final BuySellController currencyController = BuySellController();
  final UserController userController = UserController();

  CurrencyBloc() : super(CurrencyInitial()) {
    on<GetCurrencies>(
      (event, emit) async {
        emit(CurrencyLoading());
        Map<String, dynamic> data = await currencyController.getCurrencies();
        if (data["status"]) {
          BuySellApiRes buySellAPiRes = BuySellApiRes.fromJson(data);
          emit(
            CurrenciesDone(
              currencies: buySellAPiRes.currencies!,
              userPlanId: buySellAPiRes.userPlanId!,
              buySellStatus: buySellAPiRes.buySellStatus!,
              senderWallet: buySellAPiRes.currencies!,
              receiverWallet: buySellAPiRes.currencies!,
              accountInfo: buySellAPiRes.accountInfo!,
              rate: buySellAPiRes.rates!,
            ),
          );
        } else if (!data["status"]) {
          emit(
            CurrencyError(message: ''),
          );
        }
      },
    );
    on<TransferMoney>(
      (event, emit) async {
        emit(CurrencyLoading());
        Map<String, dynamic> data = await currencyController.transferMoney(
          event.sourceWalletId,
          event.destinationWalletId,
          event.amount,
          event.rate,
          event.accountId,
          event.receiverAccount,
        );
        if (data['status']) {
          emit(TransferDone());
        } else if (!data['status']) {
          emit(
            CurrencyError(
              message: data['message'],
            ),
          );
        }
      },
    );

    on<GetNameOfUserByAccount>(
      (event, emit) async {
        emit(CurrencyLoading());
        Map<String, dynamic> data =
            await userController.getUserByAccount(event.accountId);

        if (data['status']) {
          emit(
            UserAccountLoaded(
              name: data['name'],
            ),
          );
        } else {
          emit(
            CurrencyError(
              message: data['error'],
            ),
          );
        }
      },
    );
  }
}
