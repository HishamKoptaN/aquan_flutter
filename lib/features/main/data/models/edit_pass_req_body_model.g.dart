// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_pass_req_body_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EditPassReqBodyModelImpl _$$EditPassReqBodyModelImplFromJson(
        Map<String, dynamic> json) =>
    _$EditPassReqBodyModelImpl(
      currentPassword: json['currentPassword'] as String?,
      newPassword: json['newPassword'] as String?,
      newPasswordConfirmation: json['newPasswordConfirmation'] as String?,
    );

Map<String, dynamic> _$$EditPassReqBodyModelImplToJson(
        _$EditPassReqBodyModelImpl instance) =>
    <String, dynamic>{
      'currentPassword': instance.currentPassword,
      'newPassword': instance.newPassword,
      'newPasswordConfirmation': instance.newPasswordConfirmation,
    };
