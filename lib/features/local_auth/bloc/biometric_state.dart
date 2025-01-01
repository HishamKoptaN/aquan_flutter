import 'package:freezed_annotation/freezed_annotation.dart';
part 'biometric_state.freezed.dart';

@freezed
class BiometricState with _$BiometricState {
  const factory BiometricState.initial() = _Initial;
  const factory BiometricState.authenticated() = _Authenticated;
  const factory BiometricState.failure({
    required String error,
  }) = _Failure;
}
