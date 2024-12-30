import 'package:freezed_annotation/freezed_annotation.dart';
part 'verify_otp_req_body_model.freezed.dart';
part 'verify_otp_req_body_model.g.dart';

@freezed
class VerifyOtpReqBodyModel with _$VerifyOtpReqBodyModel {
  const factory VerifyOtpReqBodyModel({
    @JsonKey(name: "otp") String? otp,
    @JsonKey(name: "email") String? email,
  }) = _VerifyOtpReqBodyModel;
  factory VerifyOtpReqBodyModel.fromJson(Map<String, dynamic> json) =>
      _$VerifyOtpReqBodyModelFromJson(json);
}
