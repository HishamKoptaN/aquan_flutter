import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/models/sign_up_req_body.dart';
part 'sign_up_event.freezed.dart';

@freezed
class SignUpEvent with _$SignUpEvent {
  const factory SignUpEvent.signUp({
    required SignUpReqBody signUpReqBody,
  }) = _SignUpEvent;
}
