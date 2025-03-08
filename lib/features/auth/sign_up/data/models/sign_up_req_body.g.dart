// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_req_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SignUpReqBodyImpl _$$SignUpReqBodyImplFromJson(Map<String, dynamic> json) =>
    _$SignUpReqBodyImpl(
      idToken: json['id_token'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      passwordConfirmation: json['password_confirmation'] as String?,
      address: json['address'] as String?,
      phone: json['phone'] as String?,
      countryCode: json['country_code'] as String?,
    );

Map<String, dynamic> _$$SignUpReqBodyImplToJson(_$SignUpReqBodyImpl instance) =>
    <String, dynamic>{
      'id_token': instance.idToken,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'email': instance.email,
      'password': instance.password,
      'password_confirmation': instance.passwordConfirmation,
      'address': instance.address,
      'phone': instance.phone,
      'country_code': instance.countryCode,
    };
