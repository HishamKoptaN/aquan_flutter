import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/models/login_request_body.dart';
part 'login_event.freezed.dart';

@freezed
class LoginEvent<T> with _$LoginEvent<T> {
  const factory LoginEvent.login({
    required LoginRequestBody loginRequestBody,
  }) = _Login;
}
