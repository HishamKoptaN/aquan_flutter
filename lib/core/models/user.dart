import 'package:freezed_annotation/freezed_annotation.dart';
import 'balance.dart';
import 'user_plan.dart';
part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "status") bool? status,
    @JsonKey(name: "account_number") String? accountNumber,
    @JsonKey(name: "online_offline") String? onlineOffline,
    @JsonKey(name: "first_name") String? firstName,
    @JsonKey(name: "last_name") String? lastName,
    @JsonKey(name: "password") String? password,
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "image") String? image,
    @JsonKey(name: "address") String? address,
    @JsonKey(name: "phone") String? phone,
    @JsonKey(name: "comment") String? comment,
    @JsonKey(name: "user_plan") UserPlan? userPlan,
    @JsonKey(name: "balance") Balance? balance,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
