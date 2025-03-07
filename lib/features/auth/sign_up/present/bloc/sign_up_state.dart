import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/errors/api_error_model.dart';
import '../../data/models/sign_up_res_model.dart';
part 'sign_up_state.freezed.dart';

@freezed
class SignUpState with _$SignUpState {
  const factory SignUpState.initial() = _Initial;
  const factory SignUpState.signUp() = _SignUp;
  const factory SignUpState.loading() = _Loading;
  const factory SignUpState.success({
    required SignUpResModel signUpResModel,
  }) = _Success;
  const factory SignUpState.error({
    required ApiErrorModel apiErrorModel,
  }) = _Error;
}
