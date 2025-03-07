// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_email_otp_req_body_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VerifyEmailOtpReqBodyModelImpl _$$VerifyEmailOtpReqBodyModelImplFromJson(
        Map<String, dynamic> json) =>
    _$VerifyEmailOtpReqBodyModelImpl(
      otp: json['otp'] as String?,
      emailId: (json['email_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$VerifyEmailOtpReqBodyModelImplToJson(
        _$VerifyEmailOtpReqBodyModelImpl instance) =>
    <String, dynamic>{
      'otp': instance.otp,
      'email_id': instance.emailId,
    };
