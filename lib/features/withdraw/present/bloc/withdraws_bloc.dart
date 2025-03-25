import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/singletons/withdraw_rates_singleton.dart';
import '../../data/model/withdraw_rates_res_model.dart';
import '../../domain/use_cases/add_withdraw_use_case.dart';
import '../../domain/use_cases/get_withdraw_rates_use_case.dart';
import '../../domain/use_cases/get_withdraws_use_case.dart';
import 'withdraws_event.dart';
import 'withdraws_state.dart';
@LazySingleton()

class WithdrawsBloc extends Bloc<WithdrawsEvent, WithdrawsState> {
  GetWithdrawsUseCase getWithdrawsUseCase;
  GetWithdrawRatessUseCase getWithdrawRatesUseCase;
  AddWithdrawUseCase addWithdrawUseCase;
  WithdrawsBloc({
    required this.getWithdrawsUseCase,
    required this.getWithdrawRatesUseCase,
    required this.addWithdrawUseCase,
  }) : super(
          const WithdrawsState.initial(),
        ) {
    WithdrawRatesResModel? withdrawRatesResModel;
    on<WithdrawsEvent>(
      (event, emit) async {
        await event.when(
          getWithdraws: () async {
            emit(
              const WithdrawsState.loading(),
            );
            final result = await getWithdrawsUseCase.getWithdraws();
            await result.when(
              success: (dashResModel) async {
                emit(
                  WithdrawsState.withdrawsLoaded(
                    withdraws: dashResModel,
                  ),
                );
              },
              failure: (apiErrorModel) async {
                emit(
                  WithdrawsState.failure(
                    apiErrorModel: apiErrorModel,
                  ),
                );
              },
            );
          },
          getWithdrawRates: () async {
            emit(
              const WithdrawsState.loading(),
            );
            final result = await getWithdrawRatesUseCase.getWithdrawRates();
            await result.when(
              success: (
                withdrawRatesResModel,
              ) async {
                WithdrawRatesResSingleton.instance.withdrawRatesResModel =
                    withdrawRatesResModel;
                emit(
                  const WithdrawsState.withdrawRatesLoaded(),
                );
              },
              failure: (
                apiErrorModel,
              ) async {
                emit(
                  WithdrawsState.failure(
                    apiErrorModel: apiErrorModel,
                  ),
                );
              },
            );
          },
          addWithdraw: (
            withdrawReqBodyModel,
          ) async {
            emit(
              const WithdrawsState.loading(),
            );
            final result = await addWithdrawUseCase.addWithdraw(
              withdrawReqBodyModel: withdrawReqBodyModel,
            );
            await result.when(
              success: (dashResModel) async {
                emit(
                  const WithdrawsState.success(),
                );
              },
              failure: (apiErrorModel) async {
                emit(
                  WithdrawsState.failure(
                    apiErrorModel: apiErrorModel,
                  ),
                );
                emit(
                  const WithdrawsState.withdrawRatesLoaded(),
                );
              },
            );
          },
        );
      },
    );
  }
}
