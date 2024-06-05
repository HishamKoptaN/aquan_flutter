import 'dart:io';

import 'package:aquan/Controllers/currency_controller.dart';
import 'package:aquan/Controllers/deposit_controller.dart';
import 'package:aquan/Models/currency.dart';
import 'package:aquan/Models/deposit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'deposit_event.dart';
part 'deposit_state.dart';

class DepositBloc extends Bloc<DepositEvent, DepositState> {
  final DepositController _controller = DepositController();
  final CurrencyController _currencyController = CurrencyController();

  DepositBloc() : super(DepositInitial()) {
    on<GetDeposits>((event, emit) async {
      emit(DepositLoading());
      Map<String, dynamic> data = await _controller.getDeposits();

      if (data['status']) {
        List deps = data['deposits'];

        List<Deposit> deposits = deps.map((d) => Deposit.fromJson(d)).toList();

        emit(DepositsDone(deposits: deposits));
      } else {
        emit(DepositError(message: data['error']));
      }
    });

    on<GetPayments>((event, emit) async {
      emit(DepositLoading());
      Map<String, dynamic> data = await _currencyController.getCurrencies();

      if (data['status']) {
        List currs = data['currencies'];

        List<Currency> currencies = currs
            .map(
              (curr) => Currency.fromJson(curr),
            )
            .toList();

        emit(MethodsDone(currencies: currencies));
      } else {
        emit(DepositError(message: data['error']));
      }
    });

    on<CreateDeposit>((event, emit) async {
      emit(DepositLoading());

      Map<String, dynamic> data = await _controller.depositMoney(
        event.file,
        event.amount,
        event.method,
      );

      if (data['status']) {
        emit(DepositDone());
      } else {
        emit(DepositError(message: data['error']));
      }
    });
  }
}
