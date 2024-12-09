import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../core/errors/api_error_model.dart';
import '../../data/model/deposits_res_model.dart';
import '../../data/model/employee_account_res_model.dart';
part 'deposits_state.freezed.dart';

@freezed
class DepositsState<T> with _$DepositsState<T> {
  const factory DepositsState.initial() = _Initial;
  const factory DepositsState.loading() = _Loading;
  const factory DepositsState.depositsLoaded({
    required DepositsResModel depositsResModel,
  }) = _depositsLoaded;
  const factory DepositsState.employeeAccountsLoaded({
    required EmployeeAccountResModel employeeAccountResModel,
  }) = _EmployeeAccountsLoaded;
  const factory DepositsState.success() = _Success;
  const factory DepositsState.failure({
    required ApiErrorModel apiErrorModel,
  }) = _Failure;
}


















// abstract class DepositsState {}

// final class DepositInitial extends DepositsState {}

// final class DepositLoading extends DepositsState {}

// class DepositsLoadedSuccessfully extends DepositsState {
//   List<Deposit> deposits;
//   DepositsLoadedSuccessfully({required this.deposits});
// }

// final class DepositError extends DepositsState {
//   final String message;

//   DepositError({required this.message});
// }

// class DepositCreatedSuccessfully extends DepositsState {}

// class DepositPaymentMethodsDone extends DepositsState {
//   GetEmployeeAccountApiResModel getEmployeeAccountApiResModel;
//   DepositPaymentMethodsDone({
//     required this.getEmployeeAccountApiResModel,
//   });
// }
