import 'package:freezed_annotation/freezed_annotation.dart';
part 'section_res_model.freezed.dart';
part 'section_res_model.g.dart';

@freezed
class SectionResModel with _$SectionResModel {
  const factory SectionResModel({
    @JsonKey(name: "status") bool? status,
    @JsonKey(name: "message") String? message,
  }) = _SectionResModel;

  factory SectionResModel.fromJson(Map<String, dynamic> json) =>
      _$SectionResModelFromJson(json);
}
