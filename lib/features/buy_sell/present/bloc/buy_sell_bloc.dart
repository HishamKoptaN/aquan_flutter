import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/use_cases/get_buy_sell_rates_use_case.dart';
import '../../domain/use_cases/get_receive_account_number_use_case.dart';
import '../../domain/use_cases/transfer_money_use_case.dart';
import 'buy_sell_event.dart';
import 'buy_sell_state.dart';

class BuySellBloc extends Bloc<BuySellEvent, BuySellState> {
  GetBuySellRatesUse getBuySellRatesUse;
  GetReceiveAccountNumberUseCase getReceiveAccountNumberUseCase;
  TransferMoneyUseCase transferMoneyUseCase;
  BuySellBloc({
    required this.getBuySellRatesUse,
    required this.getReceiveAccountNumberUseCase,
    required this.transferMoneyUseCase,
  }) : super(
          const BuySellState.initial(),
        ) {
    on<BuySellEvent>(
      (event, emit) async {
        await event.when(
          getBuySelRates: () async {
            emit(
              const BuySellState.loading(),
            );
            final result = await getBuySellRatesUse.getBuySellRates();
            await result.when(
              success: (buySellResModel) async {
                emit(
                  BuySellState.buySellRatesLoaded(
                    buySellResModel: buySellResModel!,
                  ),
                );
              },
              failure: (apiErrorModel) async {
                emit(
                  BuySellState.failure(
                    apiErrorModel: apiErrorModel,
                  ),
                );
              },
            );
          },
          getReceivedAccountNumber: (
            id,
          ) async {
            emit(
              const BuySellState.loading(),
            );
            final result =
                await getReceiveAccountNumberUseCase.getReceiveAccountNumber(
              id: id,
            );
            await result.when(
              success: (account) async {
                emit(
                  BuySellState.rceivedAccountNumberLoaded(
                    account: account!,
                  ),
                );
              },
              failure: (apiErrorModel) async {
                emit(
                  BuySellState.failure(
                    apiErrorModel: apiErrorModel,
                  ),
                );
              },
            );
          },
          transferMoney: (formData) async {
            emit(
              const BuySellState.loading(),
            );
            final result = await transferMoneyUseCase.transferMoney(
              formData: formData,
            );
            await result.when(
              success: (
                receivedAccountNumberResModel,
              ) async {
                emit(
                  const BuySellState.success(),
                );
              },
              failure: (
                apiErrorModel,
              ) async {
                emit(
                  BuySellState.failure(
                    apiErrorModel: apiErrorModel,
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
