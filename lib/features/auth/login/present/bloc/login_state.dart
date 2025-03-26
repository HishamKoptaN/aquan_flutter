import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../core/errors/api_error_model.dart';
import '../../data/errors/google_sign_in_failures.dart';
part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.loading() = _Loading;
  const factory LoginState.success() = _Success;
  const factory LoginState.failure({
    required ApiErrorModel apiErrorModel,
  }) = _Failure;
  const factory LoginState.googleSignInFailure({
    required GoogleSignInFailures failure,
  }) = _GoogleSignInFailure;
  const factory LoginState.linkSent() = _LinkSent;
}
