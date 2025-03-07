import 'package:freezed_annotation/freezed_annotation.dart';
part 'auth_id_token_req_body_model.freezed.dart';
part 'auth_id_token_req_body_model.g.dart';

@freezed
class AuthIdTokenReqBodyModel with _$AuthIdTokenReqBodyModel {
  const factory AuthIdTokenReqBodyModel({
    @JsonKey(name: "id_token") String? idToken,
  }) = _AuthIdTokenReqBodyModel;
  factory AuthIdTokenReqBodyModel.fromJson(Map<String, dynamic> json) =>
      _$AuthIdTokenReqBodyModelFromJson(json);
}
