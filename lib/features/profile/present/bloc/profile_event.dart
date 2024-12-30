import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dio/dio.dart';
part 'profile_event.freezed.dart';

@freezed
class ProfileEvent with _$ProfileEvent {
  const factory ProfileEvent.editProfile({
    required FormData formData,
  }) = _editProfile;
}
