import 'package:aquan/app/withdraw/controller/withdraw_controller.dart';
import 'package:aquan/app/buy_sell/model/buy_sell_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Models/invoice.dart';
import '../../deposits_withdraws/model/deposits_witdraw_model.dart';
import '../model/withdraw_model.dart';

part 'withdraw_event.dart';
part 'withdraw_state.dart';

class WithdrawBloc extends Bloc<WithdrawEvent, WithdrawState> {
  final WithdrawController _controller = WithdrawController();

  WithdrawBloc() : super(WithdrawInitial()) {
    on<GetWithdraws>(
      (event, emit) async {
        emit(WithdrawLoading());
        Map<String, dynamic> response = await _controller.getWithdraws();
        // if (response['status']) {
        //   GetWithdrawDepositsApiResModel getWithdrawDepositsApiResModel =
        //       GetWithdrawDepositsApiResModel.fromJson(response);

        //   emit(WithdrawsDone(
        //       invoices: getWithdrawDepositsApiResModel.invoices!));
        // } else {
        //   emit(WithdrawError(message: response['error']));
        // }
      },
    );

    on<GetCurrencies>((event, emit) async {
      emit(WithdrawLoading());
      Map<String, dynamic> data = await _controller.getCurrencies();
      if (data['status']) {
        // List methods = data['currencies'];

        // List<Currency> currencies = methods
        //     .map(
        //       (e) => Currency.fromJson(e),
        //     )
        //     .toList();

        // emit(CurrenciesDone(currencies: currencies));
      } else {
        emit(WithdrawError(message: data['error']));
      }
    });

    on<CreateWithdraw>(
      (event, emit) async {
        emit(WithdrawLoading());
        Map<String, dynamic> data = await _controller.withdrawMoney(
          event.amount,
          event.information,
          event.wallet,
        );
        if (data['status']) {
          emit(WithdrawDone());
        } else {
          emit(
            WithdrawError(
              message: data['error'],
            ),
          );
        }
      },
    );
  }
}
