import 'package:freezed_annotation/freezed_annotation.dart';
part 'edit_pass_req_body_model.freezed.dart';
part 'edit_pass_req_body_model.g.dart';

@freezed
class EditPassReqBodyModel with _$EditPassReqBodyModel {
  const factory EditPassReqBodyModel({
    String? currentPassword,
    String? newPassword,
    String? newPasswordConfirmation,
  }) = _EditPassReqBodyModel;

  factory EditPassReqBodyModel.fromJson(Map<String, dynamic> json) =>
      _$EditPassReqBodyModelFromJson(json);
}
