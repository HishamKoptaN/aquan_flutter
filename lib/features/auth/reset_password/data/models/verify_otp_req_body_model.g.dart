// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_otp_req_body_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VerifyOtpReqBodyModelImpl _$$VerifyOtpReqBodyModelImplFromJson(
        Map<String, dynamic> json) =>
    _$VerifyOtpReqBodyModelImpl(
      otp: json['otp'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$$VerifyOtpReqBodyModelImplToJson(
        _$VerifyOtpReqBodyModelImpl instance) =>
    <String, dynamic>{
      'otp': instance.otp,
      'email': instance.email,
    };
