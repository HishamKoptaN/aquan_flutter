import 'package:freezed_annotation/freezed_annotation.dart';
part 'send_otp_verify_email_req_body_model.freezed.dart';
part 'send_otp_verify_email_req_body_model.g.dart';

@freezed
class SendEmailOtpReqBodyModel with _$SendEmailOtpReqBodyModel {
  const factory SendEmailOtpReqBodyModel({
    @JsonKey(
      name: "email",
    )
    String? email,
  }) = _SendEmailOtpReqBodyModel;

  factory SendEmailOtpReqBodyModel.fromJson(Map<String, dynamic> json) =>
      _$SendEmailOtpReqBodyModelFromJson(json);
}
