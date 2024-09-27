import 'sub_entities/currency_entity.dart';

class AccountEntity {
  final int? id;
  final int? userId;
  final int? bankId;
  late final String? accountNumber;
  final String? comment;
  final String? createdAt;
  final String? updatedAt;
  final CurrencyEntity currency;

  AccountEntity({
    required this.id,
    required this.userId,
    required this.bankId,
    required this.accountNumber,
    required this.comment,
    required this.currency,
    required this.createdAt,
    required this.updatedAt,
  });
}
