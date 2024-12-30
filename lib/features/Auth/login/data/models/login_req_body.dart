import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_req_body.freezed.dart';
part 'login_req_body.g.dart';

@freezed
class LoginReqBody with _$LoginReqBody {
  const factory LoginReqBody({
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "password") String? password,
  }) = _LoginReqBody;

  factory LoginReqBody.fromJson(Map<String, dynamic> json) =>
      _$LoginReqBodyFromJson(json);
}
