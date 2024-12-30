import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/use_cases/deposit_use_case.dart';
import '../../domain/use_cases/get_deposits_use_case.dart';
import '../../domain/use_cases/get_employee_account_use_case.dart';
import 'deposits_event.dart';
import 'deposits_state.dart';

class DepositsBloc extends Bloc<DepositEvent, DepositsState> {
  GetDepositstUseCase getDepositstUseCase;
  GetEmployeeAccountUseCase getEmployeeAccountUseCase;
  DepositUseCase depositUseCase;
  DepositsBloc({
    required this.getDepositstUseCase,
    required this.getEmployeeAccountUseCase,
    required this.depositUseCase,
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
            final result = await getEmployeeAccountUseCase.getEmployeeAccount();
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
            final result = await depositUseCase.deposit(
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
