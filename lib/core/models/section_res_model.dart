import 'package:freezed_annotation/freezed_annotation.dart';
part 'section_res_model.freezed.dart';
part 'section_res_model.g.dart';

@freezed
class SectionResModel with _$SectionResModel {
  const factory SectionResModel({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "status") bool? status,
    @JsonKey(name: "message") String? message,
    @JsonKey(name: "created_at") String? createdAt,
    @JsonKey(name: "updated_at") String? updatedAt,
  }) = _SectionResModel;

  factory SectionResModel.fromJson(Map<String, dynamic> json) =>
      _$SectionResModelFromJson(json);
}
