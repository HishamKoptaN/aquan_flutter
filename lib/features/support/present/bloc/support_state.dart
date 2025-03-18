import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/models/section_res_model.dart';
part 'support_state.freezed.dart';

@freezed
class SupportState with _$SupportState {
  const factory SupportState.initial() = _Initial;
  const factory SupportState.loaded({
    required SectionResModel sectionResModel,
  }) = _Loaded;
  const factory SupportState.loading() = _Loading;
  const factory SupportState.success() = _Success;
  const factory SupportState.failure({
    required String error,
  }) = _Failure;
}
