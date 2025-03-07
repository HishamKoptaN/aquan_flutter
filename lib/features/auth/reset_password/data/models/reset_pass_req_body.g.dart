// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_pass_req_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResetPassReqBodyImpl _$$ResetPassReqBodyImplFromJson(
        Map<String, dynamic> json) =>
    _$ResetPassReqBodyImpl(
      otp: json['otp'] as String?,
      newPassword: json['new_password'] as String?,
      newPasswordConfirmation: json['new_password_confirmation'] as String?,
    );

Map<String, dynamic> _$$ResetPassReqBodyImplToJson(
        _$ResetPassReqBodyImpl instance) =>
    <String, dynamic>{
      'otp': instance.otp,
      'new_password': instance.newPassword,
      'new_password_confirmation': instance.newPasswordConfirmation,
    };
