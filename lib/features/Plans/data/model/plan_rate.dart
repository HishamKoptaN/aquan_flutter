import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/models/currency.dart';
part 'plan_rate.freezed.dart';
part 'plan_rate.g.dart';

@freezed
class PlanRate with _$PlanRate {
  const factory PlanRate({
    @JsonKey(name: "employee_id") @Default(0) int employeeId,
    @JsonKey(name: "account_info") @Default([]) List<AccountInfo> accountInfo,
    @JsonKey(name: "to_binance_rates")
    @Default([])
    List<ToBinanceRate> toBinanceRates,
  }) = _PlanRate;

  factory PlanRate.fromJson(Map<String, dynamic> json) =>
      _$PlanRateFromJson(json);
}

@freezed
class AccountInfo with _$AccountInfo {
  const factory AccountInfo({
    @JsonKey(name: "id") @Default(0) int id,
    @JsonKey(name: "user_id") @Default(0) int userId,
    @JsonKey(name: "bank_id") @Default(0) int bankId,
    @JsonKey(name: "account_number") @Default('') String accountNumber,
    @JsonKey(name: "comment") @Default('') String comment,
    @JsonKey(name: "created_at") @Default('') String createdAt,
    @JsonKey(name: "updated_at") @Default('') String updatedAt,
    @Default(Currency()) @JsonKey(name: "currency") Currency currency,
  }) = _AccountInfo;

  factory AccountInfo.fromJson(Map<String, dynamic> json) =>
      _$AccountInfoFromJson(json);
}

@freezed
class ToBinanceRate with _$ToBinanceRate {
  const factory ToBinanceRate({
    @JsonKey(name: "price") @Default(0) int price,
    @JsonKey(name: "updated_at") @Default('') String updatedAt,
    @JsonKey(name: "currency_name") @Default('') String currencyName,
    @JsonKey(name: "from") @Default(0) int from,
  }) = _ToBinanceRate;

  factory ToBinanceRate.fromJson(Map<String, dynamic> json) =>
      _$ToBinanceRateFromJson(json);
}
