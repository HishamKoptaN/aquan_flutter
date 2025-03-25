import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/use_cases/deposit_use_cases.dart';
import 'deposits_event.dart';
import 'deposits_state.dart';

@LazySingleton()
class DepositsBloc extends Bloc<DepositEvent, DepositsState> {
  DepositUseCases getDepositstUseCase;
  DepositsBloc({
    required this.getDepositstUseCase,
  }) : super(
          const DepositsState.initial(),
        ) {
    on<DepositEvent>(
      (event, emit) async {
        await event.when(
          get: () async {
            emit(const DepositsState.loading());
            final result = await getDepositstUseCase.get();
            await result.when(
              success: (dashResModel) async {
                emit(
                  DepositsState.depositsLoaded(
                    depositsResModel: dashResModel!,
                  ),
                );
              },
              failure: (apiErrorModel) async {
                emit(
                  DepositsState.failure(
                    apiErrorModel: apiErrorModel,
                  ),
                );
              },
            );
          },
          getEmployeeAccount: () async {
            emit(const DepositsState.loading());
            final result = await getDepositstUseCase.getEmployeeAccount();
            await result.when(
              success: (employeeAccountResModel) async {
                emit(
                  DepositsState.employeeAccountsLoaded(
                    employeeAccountResModel: employeeAccountResModel!,
                  ),
                );
              },
              failure: (apiErrorModel) async {
                emit(
                  DepositsState.failure(
                    apiErrorModel: apiErrorModel,
                  ),
                );
              },
            );
          },
          add: (formData) async {
            emit(
              const DepositsState.loading(),
            );
            final result = await getDepositstUseCase.deposit(
              formData: formData,
            );
            await result.when(
              success: (_) async {
                emit(
                  const DepositsState.success(),
                );
              },
              failure: (apiErrorModel) async {
                emit(
                  DepositsState.failure(
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
