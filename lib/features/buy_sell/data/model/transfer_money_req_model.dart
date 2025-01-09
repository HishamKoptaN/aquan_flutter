import 'package:freezed_annotation/freezed_annotation.dart';
part 'transfer_money_req_model.freezed.dart';
part 'transfer_money_req_model.g.dart';

@freezed
class TransferMoneyReqmodel with _$TransferMoneyReqmodel {
  const factory TransferMoneyReqmodel({
    @JsonKey(name: "sender_currency_id") int? senderCurrencyId,
    @JsonKey(name: "receiver_currency_id") int? receiverCurrencyId,
    @JsonKey(name: "amount") int? amount,
    @JsonKey(name: "net_amount") int? netAmount,
    @JsonKey(name: "rate") int? rate,
    @JsonKey(name: "receiver_account") int? receiverAccount,
    @JsonKey(name: "employee_id") int? employeeId,
  }) = _TransferMoneyReqmodel;

  factory TransferMoneyReqmodel.fromJson(Map<String, dynamic> json) =>
      _$TransferMoneyReqmodelFromJson(json);
}
