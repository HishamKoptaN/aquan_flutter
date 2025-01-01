import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';
part 'plan.freezed.dart';
part 'plan.g.dart';

@freezed
class Plan with _$Plan {
  const factory Plan({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "amount") int? amount,
    @JsonKey(name: "user_amount_per_referal") int? userAmountPerReferal,
    @JsonKey(name: "refered_amount") int? referedAmount,
    @JsonKey(name: "amount_after_count") int? amountAfterCount,
    @JsonKey(name: "count") int? count,
    @JsonKey(name: "transfer_commission") double? transferCommission,
    @JsonKey(name: "discount") int? discount,
    @JsonKey(name: "discount_type") String? discountType,
    @JsonKey(name: "daily_transfer_count") int? dailyTransferCount,
    @JsonKey(name: "monthly_transfer_count") int? monthlyTransferCount,
    @JsonKey(name: "max_transfer_count") int? maxTransferCount,
    @JsonKey(name: "created_at") DateTime? createdAt,
    @JsonKey(name: "updated_at") DateTime? updatedAt,
  }) = _Plan;

  factory Plan.fromJson(Map<String, dynamic> json) => _$PlanFromJson(json);
}
