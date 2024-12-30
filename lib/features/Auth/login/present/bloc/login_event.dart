import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/models/login_req_body.dart';
part 'login_event.freezed.dart';

@freezed
class LoginEvent with _$LoginEvent {
  const factory LoginEvent.login({
    required LoginReqBody loginReqBody,
  }) = _Login;
}
