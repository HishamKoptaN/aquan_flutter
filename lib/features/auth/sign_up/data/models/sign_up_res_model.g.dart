// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_res_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SignUpResModelImpl _$$SignUpResModelImplFromJson(Map<String, dynamic> json) =>
    _$SignUpResModelImpl(
      token: json['token'] as String?,
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SignUpResModelImplToJson(
        _$SignUpResModelImpl instance) =>
    <String, dynamic>{
      'token': instance.token,
      'user': instance.user,
    };
