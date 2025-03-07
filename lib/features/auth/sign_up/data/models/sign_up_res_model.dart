import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../core/models/user.dart';

part 'sign_up_res_model.freezed.dart';
part 'sign_up_res_model.g.dart';

@freezed
class SignUpResModel with _$SignUpResModel {
  const factory SignUpResModel({
    @JsonKey(name: "token") String? token,
    @JsonKey(name: "user") User? user,
  }) = _SignUpResModel;

  factory SignUpResModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpResModelFromJson(json);
}
