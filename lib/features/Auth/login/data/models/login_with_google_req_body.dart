import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_with_google_req_body.freezed.dart';
part 'login_with_google_req_body.g.dart';

@freezed
class LoginWithGoogleReqBody with _$LoginWithGoogleReqBody {
  const factory LoginWithGoogleReqBody({
    @JsonKey(name: "id_token") String? idToken,
  }) = _LoginWithGoogleReqBody;

  factory LoginWithGoogleReqBody.fromJson(Map<String, dynamic> json) =>
      _$LoginWithGoogleReqBodyFromJson(json);
}
