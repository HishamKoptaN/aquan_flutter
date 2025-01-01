import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/models/currency.dart';
part 'employee_account_res_model.freezed.dart';
part 'employee_account_res_model.g.dart';

@freezed
class EmployeeAccountResModel with _$EmployeeAccountResModel {
  const factory EmployeeAccountResModel({
    @JsonKey(name: "user_plan") int? userPlan,
    @JsonKey(name: "employee_id") int? employeeId,
    @JsonKey(name: "account_info") List<AccountInfo>? accountInfo,
    @JsonKey(name: "to_binance_rates") List<ToBinanceRate>? toBinanceRates,
  }) = _EmployeeAccountResModel;

  factory EmployeeAccountResModel.fromJson(Map<String, dynamic> json) =>
      _$EmployeeAccountResModelFromJson(json);
}

@freezed
class AccountInfo with _$AccountInfo {
  const factory AccountInfo({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "user_id") int? userId,
    @JsonKey(name: "bank_id") int? bankId,
    @JsonKey(name: "account_number") String? accountNumber,
    @JsonKey(name: "comment") String? comment,
    @JsonKey(name: "created_at") String? createdAt,
    @JsonKey(name: "updated_at") String? updatedAt,
    @JsonKey(name: "currency") Currency? currency,
  }) = _AccountInfo;

  factory AccountInfo.fromJson(Map<String, dynamic> json) =>
      _$AccountInfoFromJson(json);
}

@freezed
class ToBinanceRate with _$ToBinanceRate {
  const factory ToBinanceRate({
    @JsonKey(name: "price") int? price,
    @JsonKey(name: "updated_at") String? updatedAt,
    @JsonKey(name: "currency_name") String? currencyName,
    @JsonKey(name: "from") int? from,
  }) = _ToBinanceRate;

  factory ToBinanceRate.fromJson(Map<String, dynamic> json) =>
      _$ToBinanceRateFromJson(json);
}
