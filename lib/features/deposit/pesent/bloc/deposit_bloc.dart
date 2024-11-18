import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/use_cases/deposit_use_case.dart';
import '../../domain/use_cases/get_deposits_use_case.dart';
import '../../domain/use_cases/get_employee_account_use_case.dart';
import 'deposit_event.dart';
import 'deposit_state.dart';

class DepositBloc extends Bloc<DepositEvent, DepositState> {
  GetDepositstUseCase getDepositstUseCase;
  GetEmployeeAccountUseCase getEmployeeAccountUseCase;
  DepositUseCase depositUseCase;
  DepositBloc({
    required this.getDepositstUseCase,
    required this.getEmployeeAccountUseCase,
    required this.depositUseCase,
  }) : super(
          const DepositState.initial(),
        ) {
    on<DepositEvent>(
      (event, emit) async {
        await event.when(
          get: () async {
            emit(const DepositState.loading());
            final result = await getDepositstUseCase.get();
            await result.when(
              success: (dashResModel) async {
                emit(
                  DepositState.depositsLoaded(
                    depositsResModel: dashResModel!,
                  ),
                );
              },
              failure: (apiErrorModel) async {
                emit(
                  DepositState.failure(
                    apiErrorModel: apiErrorModel,
                  ),
                );
              },
            );
          },
          getEmployeeAccount: () async {
            emit(const DepositState.loading());
            final result = await getEmployeeAccountUseCase.getEmployeeAccount();
            await result.when(
              success: (employeeAccountResModel) async {
                emit(
                  DepositState.employeeAccountsLoaded(
                    employeeAccountResModel: employeeAccountResModel!,
                  ),
                );
              },
              failure: (apiErrorModel) async {
                emit(
                  DepositState.failure(
                    apiErrorModel: apiErrorModel,
                  ),
                );
              },
            );
          },
          add: (formData) async {
            emit(const DepositState.loading());
            final result = await depositUseCase.deposit(
              formData: formData,
            );
            await result.when(
              success: (_) async {
                emit(
                  const DepositState.success(),
                );
              },
              failure: (apiErrorModel) async {
                emit(
                  DepositState.failure(
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
