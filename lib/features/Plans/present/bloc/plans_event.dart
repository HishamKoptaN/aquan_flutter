import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'plans_event.freezed.dart';

@freezed
class PlansEvent with _$PlansEvent {
  const factory PlansEvent.get() = _Get;
  const factory PlansEvent.getPlansRates() = _GetPlansRates;
  const factory PlansEvent.change({
    required FormData formData,
  }) = _Change;
}
