import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/models/firabase_login_req_body_model.dart';
import '../../data/models/reset_pass_req_body_model.dart';
part 'login_event.freezed.dart';

@freezed
class LoginEvent with _$LoginEvent {
  const factory LoginEvent.fireLogin({
    required FirabaseLoginReqBodyModel firabaseLoginReqBodyModel,
  }) = _FireLogin;
  const factory LoginEvent.google() = _LoginWithGoogle;
  const factory LoginEvent.resetPass({
    required ResetPassReqBodyModel resetPassReqBodyModel,
  }) = _ResetPass;
}
