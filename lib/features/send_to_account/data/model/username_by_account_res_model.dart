import 'package:freezed_annotation/freezed_annotation.dart';

part 'username_by_account_res_model.freezed.dart';
part 'username_by_account_res_model.g.dart';

@freezed
class UsernameByAccountResModel with _$UsernameByAccountResModel {
  const factory UsernameByAccountResModel({
    bool? status,
    String? name,
  }) = _UsernameByAccountResModel;

  factory UsernameByAccountResModel.fromJson(Map<String, dynamic> json) =>
      _$UsernameByAccountResModelFromJson(json);
}
