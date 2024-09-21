import 'dart:io';

import 'package:aquan/features/buy_sell/controller/buy_sell_controller.dart';
import 'package:aquan/features/buy_sell/model/buy_sell_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Auth/login/controller/login_controller.dart';
import '../model/received_account_number.dart';
import 'buy_sell_state.dart';
part 'buy_sell_event.dart';

class BuySellBloc extends Bloc<BuySellEvent, BuySellState> {
  final BuySellController buySellController = BuySellController();
  final LoginController userController = LoginController();

  BuySellBloc() : super(CurrencyInitial()) {
    on<GetCurrencies>(
      (event, emit) async {
        emit(CurrencyLoading());
        Map<String, dynamic> data = await buySellController.getCurrencies();
        if (data["status"]) {
          GetBuySellApiRes buySellAPiRes = GetBuySellApiRes.fromJson(data);
          emit(
            CurrenciesLoadedSuccessfully(getBuySellApiRes: buySellAPiRes),
          );
        } else if (!data["status"]) {
          emit(
            CurrencyError(message: ''),
          );
        }
      },
    );
    on<GetReceivedAccountNumber>(
      (event, emit) async {
        Map<String, dynamic> data =
            await buySellController.getReceivedAccountNumber(id: event.id);
        ReceivedAccountNumberApiRes receivedAccountNumberApiRes =
            ReceivedAccountNumberApiRes.fromJson(data);
        if (data['status']) {
          emit(
            ReceivedAccountNumberLoaded(
              receivedAccountNumberApiRes: receivedAccountNumberApiRes,
            ),
          );
        } else if (!data['status']) {
          emit(
            CurrencyError(
              message: data['message'],
            ),
          );
        }
      },
    );

    on<TransferMoney>(
      (event, emit) async {
        emit(CurrencyLoading());
        Map<String, dynamic> data = await buySellController.transferMoney(
          senderCurrencyId: event.senderCurrencyId,
          receiverCurrencyId: event.receiverCurrencyId,
          rate: event.rate,
          amount: event.amount,
          netAmount: event.netAmount,
          receiverAccount: event.receiverAccount,
          employeeId: event.employeeId,
          file: event.file,
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

    // on<GetNameOfUserByAccount>(
    //   (event, emit) async {
    //     emit(CurrencyLoading());
    //     Map<String, dynamic> data =
    //         await buySellController.getUserByAccount(event.accountId);
    //     if (data['status']) {
    //       emit(
    //         UserAccountLoaded(
    //           name: data['name'],
    //         ),
    //       );
    //     } else  if (!data['status']) {
    //       emit(
    //         CurrencyError(
    //           message: data['error'],
    //         ),
    //       );
    //     }
    //   },
    // );
  }
}
