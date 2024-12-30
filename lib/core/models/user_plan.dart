import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_plan.freezed.dart';
part 'user_plan.g.dart';

@freezed
class UserPlan with _$UserPlan {
  const factory UserPlan({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "user_id") int? userId,
    @JsonKey(name: "plan_id") int? planId,
    @JsonKey(name: "upgraded_at") DateTime? upgradedAt,
    @JsonKey(name: "created_at") DateTime? createdAt,
    @JsonKey(name: "updated_at") DateTime? updatedAt,
  }) = _UserPlan;

  factory UserPlan.fromJson(Map<String, dynamic> json) =>
      _$UserPlanFromJson(json);
}
