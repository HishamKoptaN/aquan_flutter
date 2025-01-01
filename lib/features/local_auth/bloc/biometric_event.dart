import 'package:freezed_annotation/freezed_annotation.dart';

part 'biometric_event.freezed.dart';

@freezed
class BiometricEvent with _$BiometricEvent {
  const factory BiometricEvent.authenticate() = _Authenticate;
}
