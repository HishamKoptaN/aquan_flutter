// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_otp_verify_email_res_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SendOtpResModelImpl _$$SendOtpResModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SendOtpResModelImpl(
      email: json['email'] as String?,
      emailId: (json['email_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$SendOtpResModelImplToJson(
        _$SendOtpResModelImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'email_id': instance.emailId,
    };
