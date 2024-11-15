import 'package:freezed_annotation/freezed_annotation.dart';
part 'plan_model.freezed.dart';
part 'plan_model.g.dart';

@freezed
class Plan with _$Plan {
  const factory Plan({
    @JsonKey(name: "id") @Default(0) int id,
    @JsonKey(name: "name") @Default('') String name,
    @JsonKey(name: "amount") @Default(0) int amount,
    @JsonKey(name: "user_amount_per_referal")
    @Default(0)
    int userAmountPerReferal,
    @JsonKey(name: "refered_amount") @Default(0) int referedAmount,
    @JsonKey(name: "amount_after_count") @Default(0) int amountAfterCount,
    @JsonKey(name: "count") @Default(0) int count,
    @JsonKey(name: "transfer_commission")
    @Default(0.0)
    double transferCommission,
    @JsonKey(name: "discount") @Default(0) int discount,
    @JsonKey(name: "discount_type") @Default('') String discountType,
    @JsonKey(name: "daily_transfer_count") @Default(0) int dailyTransferCount,
    @JsonKey(name: "monthly_transfer_count")
    @Default(0)
    int monthlyTransferCount,
    @JsonKey(name: "max_transfer_count") @Default(0) int maxTransferCount,
    @JsonKey(name: "created_at") @Default('') String createdAt,
    @JsonKey(name: "updated_at") @Default('') String updatedAt,
  }) = _Plan;

  factory Plan.fromJson(Map<String, dynamic> json) => _$PlanFromJson(json);
}
