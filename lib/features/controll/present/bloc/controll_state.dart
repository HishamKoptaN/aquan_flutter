import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/models/section_res_model.dart';
import '../../data/model/section_model.dart';
part 'controll_state.freezed.dart';

@freezed
class ControllState with _$ControllState {
  const factory ControllState.initial() = _Initial;
  const factory ControllState.loaded({
    required List<SectionModel>? sections,
  }) = _Loaded;
  const factory ControllState.loading() = _Loading;
  const factory ControllState.success() = _Success;
  const factory ControllState.failure({
    required String error,
  }) = _Failure;
}
