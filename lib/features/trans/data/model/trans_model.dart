import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/models/currency.dart';
part 'trans_model.freezed.dart';
part 'trans_model.g.dart';

@freezed
class Trans with _$Trans {
  const factory Trans({
    @JsonKey(name: "id") @Default(0) int id, // القيمة الافتراضية = 0
    @JsonKey(name: "status")
    @Default('')
    String status, // القيمة الافتراضية = ''
    @JsonKey(name: "amount")
    @Default(0.0)
    double amount, // القيمة الافتراضية = 0.0
    @JsonKey(name: "net_amount")
    @Default(0.0)
    double netAmount, // القيمة الافتراضية = 0.0
    @JsonKey(name: "rate") @Default(0.0) double rate, // القيمة الافتراضية = 0.0
    @JsonKey(name: "message")
    @Default('')
    String message, // القيمة الافتراضية = ''
    @JsonKey(name: "image") @Default('') String image, // القيمة الافتراضية = ''
    @JsonKey(name: "address")
    @Default('')
    String address, // القيمة الافتراضية = ''
    @JsonKey(name: "employee_id")
    @Default(0)
    int employeeId, // القيمة الافتراضية = 0
    @JsonKey(name: "user_id") @Default(0) int userId, // القيمة الافتراضية = 0
    @JsonKey(name: "sender_currency_id")
    @Default(0)
    int senderCurrencyId, // القيمة الافتراضية = 0
    @JsonKey(name: "receiver_currency_id")
    @Default(0)
    int receiverCurrencyId, // القيمة الافتراضية = 0
    @JsonKey(name: "receiver_account")
    @Default('')
    String receiverAccount, // القيمة الافتراضية = ''
    @JsonKey(name: "created_at")
    @Default('')
    String createdAt, // القيمة الافتراضية = ''
    @JsonKey(name: "updated_at")
    @Default('')
    String updatedAt, // القيمة الافتراضية = ''
    @JsonKey(name: "sender_currency")
    @Default(Currency(name: ''))
    Currency senderCurrency, // القيمة الافتراضية = 'ErCurrency(name: '')'
    @JsonKey(name: "receiver_currency")
    @Default(Currency(name: ''))
    Currency receiverCurrency, // القيمة الافتراضية = 'ErCurrency(name: '')'
  }) = _Trans;

  factory Trans.fromJson(Map<String, dynamic> json) => _$TransFromJson(json);
}
