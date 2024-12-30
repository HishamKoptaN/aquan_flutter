import 'package:freezed_annotation/freezed_annotation.dart';
part 'reset_pass_req_body.freezed.dart';
part 'reset_pass_req_body.g.dart';

@freezed
class ResetPassReqBody with _$ResetPassReqBody {
  const factory ResetPassReqBody({
    @JsonKey(name: "otp") String? otp,
    @JsonKey(name: "new_password") String? newPassword,
    @JsonKey(name: "new_password_confirmation") String? newPasswordConfirmation,
  }) = _ResetPassReqBody;

  factory ResetPassReqBody.fromJson(Map<String, dynamic> json) =>
      _$ResetPassReqBodyFromJson(json);
}
