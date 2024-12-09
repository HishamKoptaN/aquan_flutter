import 'package:freezed_annotation/freezed_annotation.dart';
import '../models/currency.dart';
part 'account.freezed.dart';
part 'account.g.dart';

@freezed
class Account with _$Account {
  const factory Account({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "user_id") int? userId,
    @JsonKey(name: "bank_id") int? bankId,
    @JsonKey(name: "account_number") String? accountNumber,
    @JsonKey(name: "comment") String? comment,
    @JsonKey(name: "created_at") String? createdAt,
    @JsonKey(name: "updated_at") String? updatedAt,
    @JsonKey(name: "currency") Currency? currency,
  }) = _Account;

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);
}
