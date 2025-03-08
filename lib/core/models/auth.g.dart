// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthImpl _$$AuthImplFromJson(Map<String, dynamic> json) => _$AuthImpl(
      token: json['token'] as String?,
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
      verified: json['verified'] as bool?,
    );

Map<String, dynamic> _$$AuthImplToJson(_$AuthImpl instance) =>
    <String, dynamic>{
      'token': instance.token,
      'user': instance.user,
      'verified': instance.verified,
    };
