import 'package:freezed_annotation/freezed_annotation.dart';
part 'transfer_req_body.freezed.dart';
part 'transfer_req_body.g.dart';

@freezed
class TransferReqBody with _$TransferReqBody {
  const factory TransferReqBody({
    @JsonKey(name: "account_number") String? accountNumber,
    @JsonKey(name: "amount") int? amount,
  }) = _TransferReqBody;

  factory TransferReqBody.fromJson(Map<String, dynamic> json) =>
      _$TransferReqBodyFromJson(json);
}
