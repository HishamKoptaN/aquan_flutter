import 'package:freezed_annotation/freezed_annotation.dart';
part 'sign_up_req_body.freezed.dart';
part 'sign_up_req_body.g.dart';

@freezed
class SignUpReqBody with _$SignUpReqBody {
  const factory SignUpReqBody({
    @JsonKey(name: "id_token") String? idToken,
    @JsonKey(name: "first_name") String? firstName,
    @JsonKey(name: "last_name") String? lastName,
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "password") String? password,
    @JsonKey(name: "password_confirmation") String? passwordConfirmation,
    @JsonKey(name: "address") String? address,
    @JsonKey(name: "phone") String? phone,
    @JsonKey(name: "country_code") String? countryCode,
  }) = _SignUpReqBody;

  factory SignUpReqBody.fromJson(Map<String, dynamic> json) =>
      _$SignUpReqBodyFromJson(json);
}
