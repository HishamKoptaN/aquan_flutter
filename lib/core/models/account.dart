import 'package:freezed_annotation/freezed_annotation.dart';
import 'currency.dart';
import 'user.dart';
part 'account.freezed.dart';
part 'account.g.dart';

@freezed
class Account with _$Account {
  const factory Account({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "user_id") int? userId,
    @JsonKey(name: "currency_id") int? currencyId,
    @JsonKey(name: "account_number") String? accountNumber,
    @JsonKey(name: "comment") String? comment,
    @JsonKey(name: "created_at") String? createdAt,
    @JsonKey(name: "updated_at") String? updatedAt,
    @JsonKey(name: "currency") Currency? currency,
    @JsonKey(name: "user") UserModel? user,
  }) = _Account;

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);
}
