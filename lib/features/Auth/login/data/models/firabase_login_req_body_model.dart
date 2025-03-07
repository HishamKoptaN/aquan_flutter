import 'package:freezed_annotation/freezed_annotation.dart';
part 'firabase_login_req_body_model.freezed.dart';
part 'firabase_login_req_body_model.g.dart';

@freezed
class FirabaseLoginReqBodyModel with _$FirabaseLoginReqBodyModel {
  const factory FirabaseLoginReqBodyModel({
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "password") String? password,
  }) = _FirabaseLoginReqBodyModel;

  factory FirabaseLoginReqBodyModel.fromJson(Map<String, dynamic> json) =>
      _$FirabaseLoginReqBodyModelFromJson(json);
}
