import 'package:freezed_annotation/freezed_annotation.dart';
part 'send_otp_res_model.freezed.dart';
part 'send_otp_verify_email_res_model.g.dart';

@freezed
class SendOtpResModel with _$SendOtpResModel {
  const factory SendOtpResModel({
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "email_id") int? emailId,
  }) = _SendOtpResModel;

  factory SendOtpResModel.fromJson(Map<String, dynamic> json) =>
      _$SendOtpResModelFromJson(json);
}
