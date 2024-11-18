import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../core/errors/api_error_model.dart';
import '../../data/model/deposits_res_model.dart';
import '../../data/model/employee_account_res_model.dart';
part 'deposit_state.freezed.dart';

@freezed
class DepositState<T> with _$DepositState<T> {
  const factory DepositState.initial() = _Initial;
  const factory DepositState.loading() = _Loading;
  const factory DepositState.depositsLoaded({
    required DepositsResModel depositsResModel,
  }) = _depositsLoaded;
  const factory DepositState.employeeAccountsLoaded({
    required EmployeeAccountResModel employeeAccountResModel,
  }) = _EmployeeAccountsLoaded;
  const factory DepositState.success() = _Success;
  const factory DepositState.failure({
    required ApiErrorModel apiErrorModel,
  }) = _Failure;
}


















// abstract class DepositState {}

// final class DepositInitial extends DepositState {}

// final class DepositLoading extends DepositState {}

// class DepositsLoadedSuccessfully extends DepositState {
//   List<Deposit> deposits;
//   DepositsLoadedSuccessfully({required this.deposits});
// }

// final class DepositError extends DepositState {
//   final String message;

//   DepositError({required this.message});
// }

// class DepositCreatedSuccessfully extends DepositState {}

// class DepositPaymentMethodsDone extends DepositState {
//   GetEmployeeAccountApiResModel getEmployeeAccountApiResModel;
//   DepositPaymentMethodsDone({
//     required this.getEmployeeAccountApiResModel,
//   });
// }
