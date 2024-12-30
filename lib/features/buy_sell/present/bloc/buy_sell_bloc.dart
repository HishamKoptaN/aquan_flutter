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
          getReceivedAccountNumber: (id) async {
            emit(
              const BuySellState.loading(),
            );
            final result =
                await getReceiveAccountNumberUseCase.getReceiveAccountNumber(
              id: id,
            );
            await result.when(
              success: (receivedAccountNumberResModel) async {
                emit(
                  BuySellState.rceivedAccountNumberLoaded(
                    receivedAccountNumberResModel:
                        receivedAccountNumberResModel!,
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
              success: (receivedAccountNumberResModel) async {
                emit(
                  const BuySellState.success(),
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
        );
      },
    );

    //    emit(CurrencyLoading());
    //     Map<String, dynamic> data = await buySellController.getCurrencies();
    //     if (data["status"]) {
    //       GetBuySellApiRes buySellAPiRes = GetBuySellApiRes.fromJson(data);
    //       emit(
    //         CurrenciesLoadedSuccessfully(getBuySellApiRes: buySellAPiRes),
    //       );
    //     } else if (!data["status"]) {
    //       emit(
    //         CurrencyError(error: ''),
    //       );
    //     }
    //   },
    // on<GetReceivedAccountNumber>(
    //   (event, emit) async {
    //     Map<String, dynamic> data =
    //         await buySellController.getReceivedAccountNumber(id: event.id);
    //     ReceivedAccountNumberApiRes receivedAccountNumberApiRes =
    //         ReceivedAccountNumberApiRes.fromJson(data);
    //     if (data['status']) {
    //       emit(
    //         ReceivedAccountNumberLoaded(
    //           receivedAccountNumberApiRes: receivedAccountNumberApiRes,
    //         ),
    //       );
    //     } else if (!data['status']) {
    //       emit(
    //         CurrencyError(
    //           error: data['error'],
    //         ),
    //       );
    //     }
    //   },
    // );

    // on<TransferMoney>(
    //   (event, emit) async {
    //     emit(CurrencyLoading());
    //     Map<String, dynamic> data = await buySellController.transferMoney(
    //       senderCurrencyId: event.senderCurrencyId,
    //       receiverCurrencyId: event.receiverCurrencyId,
    //       rate: event.rate,
    //       amount: event.amount,
    //       netAmount: event.netAmount,
    //       receiverAccount: event.receiverAccount,
    //       employeeId: event.employeeId,
    //       file: event.file,
    //     );
    //     if (data['status']) {
    //       emit(TransferDone());
    //     } else if (!data['status']) {
    //       emit(
    //         CurrencyError(
    //           error: data['error'],
    //         ),
    //       );
    //     }
    //   },
    // );

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
