import 'package:freezed_annotation/freezed_annotation.dart';
part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    @JsonKey(name: "id") @Default(0) int id,
    @JsonKey(name: "account_number") @Default("") String accountNumber,
    @JsonKey(name: "online_offline") @Default("") String onlineOffline,
    @JsonKey(name: "name") @Default("") String name,
    @JsonKey(name: "username") @Default("") String username,
    @JsonKey(name: "email") @Default("") String email,
    @JsonKey(name: "image") @Default("") String image,
    @JsonKey(name: "address") @Default("") String address,
    @JsonKey(name: "phone") @Default("") String phone,
    @JsonKey(name: "balance") @Default(0.0) double balance,
    @JsonKey(name: "plan_id") @Default(1) int planId,
    @JsonKey(name: "upgraded_at") @Default("") String upgradedAt,
    @JsonKey(name: "status") bool? status,
    @JsonKey(name: "token") String? token,
    @JsonKey(name: "password") String? password,
    @JsonKey(name: "comment") String? comment,
    @JsonKey(name: "account_info") String? accountInfo,
    @JsonKey(name: "refered_by") dynamic referedBy,
    @JsonKey(name: "confirmation_code") dynamic confirmationCode,
    @JsonKey(name: "phone_verified_at") String? phoneVerifiedAt,
    @JsonKey(name: "refcode") String? refcode,
    @JsonKey(name: "phone_verification_code") String? phoneVerificationCode,
    @JsonKey(name: "email_verified_at") dynamic emailVerifiedAt,
    @JsonKey(name: "inactivate_end_at") dynamic inactivateEndAt,
    @JsonKey(name: "remember_token") dynamic rememberToken,
    @JsonKey(name: "created_at") String? createdAt,
    @JsonKey(name: "updated_at") String? updatedAt,
  }) = _User;
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
