import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/use_cases/buy_sell_rate_use_cases.dart';
import 'buy_sell_event.dart';
import 'buy_sell_state.dart';

@LazySingleton()
class BuySellBloc extends Bloc<BuySellEvent, BuySellState> {
  BuySellRatesUses buySellRatesUses;
  BuySellBloc({
    required this.buySellRatesUses,
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
            final result = await buySellRatesUses.getBuySellRates();
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
            final result = await buySellRatesUses.getReceiveAccountNumber(
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
            final result = await buySellRatesUses.transferMoney(
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
