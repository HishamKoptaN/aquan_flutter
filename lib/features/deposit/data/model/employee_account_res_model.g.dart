// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_account_res_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EmployeeAccountResModelImpl _$$EmployeeAccountResModelImplFromJson(
        Map<String, dynamic> json) =>
    _$EmployeeAccountResModelImpl(
      userPlan: (json['user_plan'] as num?)?.toInt(),
      employeeId: (json['employee_id'] as num?)?.toInt(),
      accountInfo: (json['account_info'] as List<dynamic>?)
          ?.map((e) => AccountInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      toBinanceRates: (json['to_binance_rates'] as List<dynamic>?)
          ?.map((e) => ToBinanceRate.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$EmployeeAccountResModelImplToJson(
        _$EmployeeAccountResModelImpl instance) =>
    <String, dynamic>{
      'user_plan': instance.userPlan,
      'employee_id': instance.employeeId,
      'account_info': instance.accountInfo,
      'to_binance_rates': instance.toBinanceRates,
    };

_$AccountInfoImpl _$$AccountInfoImplFromJson(Map<String, dynamic> json) =>
    _$AccountInfoImpl(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      bankId: (json['currency_id'] as num?)?.toInt(),
      accountNumber: json['account_number'] as String?,
      comment: json['comment'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      currency: json['currency'] == null
          ? null
          : Currency.fromJson(json['currency'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AccountInfoImplToJson(_$AccountInfoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'currency_id': instance.bankId,
      'account_number': instance.accountNumber,
      'comment': instance.comment,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'currency': instance.currency,
    };

_$ToBinanceRateImpl _$$ToBinanceRateImplFromJson(Map<String, dynamic> json) =>
    _$ToBinanceRateImpl(
      price: (json['price'] as num?)?.toInt(),
      updatedAt: json['updated_at'] as String?,
      currencyName: json['currency_name'] as String?,
      from: (json['from'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ToBinanceRateImplToJson(_$ToBinanceRateImpl instance) =>
    <String, dynamic>{
      'price': instance.price,
      'updated_at': instance.updatedAt,
      'currency_name': instance.currencyName,
      'from': instance.from,
    };
