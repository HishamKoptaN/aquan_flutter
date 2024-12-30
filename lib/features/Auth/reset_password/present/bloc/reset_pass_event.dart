import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/reset_pass_req_body.dart';
import '../../data/models/send_otp_req_body_model.dart';
import '../../data/models/verify_otp_req_body_model.dart';
part 'reset_pass_event.freezed.dart';

@freezed
class ResetPassEvent with _$ResetPassEvent {
  const factory ResetPassEvent.sendOtp({
    required SendOtpReqBodyModel sendOtpReqBodyModel,
  }) = _SendOtp;
  const factory ResetPassEvent.verifyOtp({
    required VerifyOtpReqBodyModel verifyOtpReqBodyModel,
  }) = _VerifyOtp;
  const factory ResetPassEvent.resetPassword({
    required ResetPassReqBody resetPassReqBody,
  }) = _ResetPassword;
}
