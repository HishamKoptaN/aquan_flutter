import 'package:freezed_annotation/freezed_annotation.dart';
part 'send_otp_req_body_model.freezed.dart';
part 'send_otp_req_body_model.g.dart';

@freezed
class SendOtpReqBodyModel with _$SendOtpReqBodyModel {
  const factory SendOtpReqBodyModel({
    @JsonKey(
      name: "email",
    )
    String? email,
  }) = _SendOtpReqBodyModel;

  factory SendOtpReqBodyModel.fromJson(Map<String, dynamic> json) =>
      _$SendOtpReqBodyModelFromJson(json);
}
