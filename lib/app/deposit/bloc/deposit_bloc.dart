import 'dart:io';

import 'package:aquan/app/buy_sell/controller/buy_sell_controller.dart';
import 'package:aquan/app/deposit/controller/deposit_controller.dart';
import 'package:aquan/app/buy_sell/model/buy_sell_model.dart';
import 'package:aquan/app/deposit/model/mak_deposit_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'deposit_event.dart';
part 'deposit_state.dart';

class DepositBloc extends Bloc<DepositEvent, DepositState> {
  final DepositController _controller = DepositController();
  final BuySellController _currencyController = BuySellController();

  DepositBloc() : super(DepositInitial()) {
    on<GetDeposits>(
      (event, emit) async {
        emit(DepositLoading());
        Map<String, dynamic> data = await _controller.getDeposits();

        if (data['status']) {
          List deps = data['deposits'];

          // List<DepositWithdraw> deposits =
          //     deps.map((d) => DepositWithdraw.fromJson(d)).toList();

          // emit(DepositsDone(deposits: deposits));
        } else {
          emit(DepositError(message: data['error']));
        }
      },
    );

    on<GetPayments>(
      (event, emit) async {
        // emit(DepositLoading());
        // Map<String, dynamic> data = await _currencyController.getCurrencies();

        // if (data['status']) {
        //   List currs = data['currencies'];

        //   List<Currency> currencies = currs
        //       .map(
        //         (curr) => Currency.fromJson(curr),
        //       )
        //       .toList();

        //   emit(MethodsDone(currencies: currencies));
        // } else {
        //   emit(DepositError(message: data['error']));
        // }
      },
    );

    on<CreateDeposit>(
      (event, emit) async {
        emit(DepositLoading());
        Map<String, dynamic> data = await _controller.depositMoney(
          event.file,
          event.amount,
          event.method,
        );

        if (data['status']) {
          emit(
            DepositDone(),
          );
        } else if (!data['status']) {
          emit(DepositError(message: data['error']));
        }
      },
    );
  }
}
