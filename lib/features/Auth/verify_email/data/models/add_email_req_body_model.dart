import 'package:freezed_annotation/freezed_annotation.dart';
part 'add_email_req_body_model.freezed.dart';
part 'add_email_req_body_model.g.dart';

@freezed
class AddEmailReqBodyModel with _$AddEmailReqBodyModel {
  const factory AddEmailReqBodyModel({
    @JsonKey(
      name: "email",
    )
    String? email,
  }) = _AddEmailReqBody;

  factory AddEmailReqBodyModel.fromJson(Map<String, dynamic> json) =>
      _$AddEmailReqBodyModelFromJson(json);
}
