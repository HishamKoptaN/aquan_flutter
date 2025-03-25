import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/models/edit_pass_req_body_model.dart';
part 'main_event.freezed.dart';

@freezed
class MainEvent with _$MainEvent {
  const factory MainEvent.checkLogedIn() = _CheckLogedIn;
  const factory MainEvent.checkEmailVerification() = _CheckEmailVerification;
  const factory MainEvent.editPass({
    required EditPassReqBodyModel editPassReqBodyModel,
  }) = _EditPass;
  const factory MainEvent.sendVerificationLink() = _SendVerificationLink;
  const factory MainEvent.submit() = _Submit;
}
