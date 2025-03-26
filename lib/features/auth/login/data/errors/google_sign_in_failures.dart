import 'package:freezed_annotation/freezed_annotation.dart';

part 'google_sign_in_failures.freezed.dart';

@freezed
class GoogleSignInFailures with _$GoogleSignInFailures {
  const factory GoogleSignInFailures.userCancelled() = _UserCancelled;
  const factory GoogleSignInFailures.networkError() = _NetworkError;
  const factory GoogleSignInFailures.invalidCredential() = _InvalidCredential;
  const factory GoogleSignInFailures.userDisabled() = _UserDisabled;
  const factory GoogleSignInFailures.userNotFound() = _UserNotFound;
  const factory GoogleSignInFailures.accountExistsWithDifferentCredential() =
      _AccountExistsWithDifferentCredential;
  const factory GoogleSignInFailures.tooManyRequests() = _TooManyRequests;
  const factory GoogleSignInFailures.operationNotAllowed() =
      _OperationNotAllowed;
  const factory GoogleSignInFailures.serverError({required String message}) =
      _ServerError;
}
