import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'deposits_event.freezed.dart';

@freezed
class DepositEvent<T> with _$DepositEvent<T> {
  const factory DepositEvent.get() = _Get;
  const factory DepositEvent.getEmployeeAccount() = _GetEmployeeAccount;
  const factory DepositEvent.add({
    required FormData formData,
  }) = _Add;
}






// class CreateDeposit extends DepositEvent {
//   final File file;
//   final TextEditingController amount;
//   final int method;
//   final int employeeId;
//   CreateDeposit({
//     required this.file,
//     required this.amount,
//     required this.method,
//     required this.employeeId,
//   });
// }

// class GetDepositPaymentMethods extends DepositEvent {}
