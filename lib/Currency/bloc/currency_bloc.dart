import 'dart:io';

import 'package:aquan/Controllers/currency_controller.dart';
import 'package:aquan/Controllers/user_controller.dart';
import 'package:aquan/Models/currency.dart';
import 'package:aquan/Models/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'currency_event.dart';
part 'currency_state.dart';

class CurrencyBloc extends Bloc<CurrencyEvent, CurrencyState> {
  final CurrencyController _controller = CurrencyController();
  final UserController _userController = UserController();

  CurrencyBloc() : super(CurrencyInitial()) {
    on<GetCurrencies>((event, emit) async {
      emit(CurrencyLoading());

      Map<String, dynamic> data = await _controller.getCurrencies();
      Map<String, dynamic> userData = await _userController.getProfileUser();

      if (data['status'] && userData['status']) {
        List curr = data['currencies'];

        List<Currency> currencies =
            curr.map((c) => Currency.fromJson(c)).toList();

        emit(CurrenciesDone(currencies: currencies, user: userData['user']));
      } else {
        emit(CurrencyError(message: data['error']));
      }
    });

    on<TransferMoney>((event, emit) async {
      emit(CurrencyLoading());

      Map<String, dynamic> data = await _controller.transferMoney(
        event.sWallet.id!,
        event.dWallet.id!,
        event.amount,
        event.accountId,
        event.file,
      );

      if (data['status']) {
        emit(TransferDone());
      } else {
        emit(CurrencyError(message: data['error']));
      }
    });

    on<GetNameOfUserByAccount>((event, emit) async {
      emit(CurrencyLoading());
      Map<String, dynamic> data =
          await _userController.getUserByAccount(event.accountId);

      if (data['status']) {
        emit(UserAccountLoaded(name: data['name']));
      } else {
        emit(CurrencyError(message: data['error']));
      }
    });
  }
}
