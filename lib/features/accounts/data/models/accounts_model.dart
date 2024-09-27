import '../../domain/entities/account.dart';
import '../../domain/entities/sub_entities/currency_entity.dart';

class AccountModel extends AccountEntity {
  AccountModel({
    required super.id,
    required super.userId,
    required super.bankId,
    required super.accountNumber,
    required super.comment,
    required super.currency,
    required super.createdAt,
    required super.updatedAt,
  });

  factory AccountModel.fromJson(Map<String, dynamic> json) {
    return AccountModel(
      id: json["id"],
      userId: json["user_id"],
      bankId: json["bank_id"],
      accountNumber: json["account_number"],
      comment: json["comment"],
      createdAt: json["created_at"],
      updatedAt: json["updated_at"],
      currency: CurrencyEntity.fromJson(json["currency"]),
    );
  }
  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "bank_id": bankId,
        "account_number": accountNumber,
        "comment": comment,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "currency": currency.toJson(),
      };
}
