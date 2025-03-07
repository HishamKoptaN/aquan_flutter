import 'package:freezed_annotation/freezed_annotation.dart';
part 'verify_email_otp_req_body_model.freezed.dart';
part 'verify_email_otp_req_body_model.g.dart';

@freezed
class VerifyEmailOtpReqBodyModel with _$VerifyEmailOtpReqBodyModel {
  const factory VerifyEmailOtpReqBodyModel({
    @JsonKey(name: "otp") String? otp,
    @JsonKey(name: "email_id") int? emailId,
  }) = _VerifyEmailOtpReqBodyModel;
  factory VerifyEmailOtpReqBodyModel.fromJson(Map<String, dynamic> json) =>
      _$VerifyEmailOtpReqBodyModelFromJson(json);
}
