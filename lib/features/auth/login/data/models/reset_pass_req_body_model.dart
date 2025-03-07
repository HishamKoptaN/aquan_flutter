import 'package:freezed_annotation/freezed_annotation.dart';
part 'reset_pass_req_body_model.freezed.dart';
part 'reset_pass_req_body_model.g.dart';

@freezed
class ResetPassReqBodyModel with _$ResetPassReqBodyModel {
  const factory ResetPassReqBodyModel({
    @JsonKey(name: "email") String? email,
  }) = _ResetPassReqBodyModel;
  factory ResetPassReqBodyModel.fromJson(Map<String, dynamic> json) =>
      _$ResetPassReqBodyModelFromJson(json);
}
