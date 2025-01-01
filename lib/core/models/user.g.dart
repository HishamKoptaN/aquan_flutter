// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: (json['id'] as num?)?.toInt(),
      status: json['status'] as bool?,
      accountNumber: json['account_number'] as String?,
      onlineOffline: json['online_offline'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      password: json['password'] as String?,
      email: json['email'] as String?,
      image: json['image'] as String?,
      address: json['address'] as String?,
      phone: json['phone'] as String?,
      comment: json['comment'] as String?,
      userPlan: json['user_plan'] == null
          ? null
          : UserPlan.fromJson(json['user_plan'] as Map<String, dynamic>),
      balance: json['balance'] == null
          ? null
          : Balance.fromJson(json['balance'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'account_number': instance.accountNumber,
      'online_offline': instance.onlineOffline,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'password': instance.password,
      'email': instance.email,
      'image': instance.image,
      'address': instance.address,
      'phone': instance.phone,
      'comment': instance.comment,
      'user_plan': instance.userPlan,
      'balance': instance.balance,
    };
