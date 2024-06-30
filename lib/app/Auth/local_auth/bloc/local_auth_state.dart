abstract class BiometricState {}

class BiometricInitial extends BiometricState {}

class BiometricAuthenticated extends BiometricState {}

class BiometricError extends BiometricState {
  final String message;
  BiometricError(this.message);
}
