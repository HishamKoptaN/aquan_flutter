// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trans_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Trans _$TransFromJson(Map<String, dynamic> json) {
  return _Trans.fromJson(json);
}

/// @nodoc
mixin _$Trans {
  @JsonKey(name: "id")
  int get id => throw _privateConstructorUsedError; // القيمة الافتراضية = 0
  @JsonKey(name: "status")
  String get status =>
      throw _privateConstructorUsedError; // القيمة الافتراضية = ''
  @JsonKey(name: "amount")
  double get amount =>
      throw _privateConstructorUsedError; // القيمة الافتراضية = 0.0
  @JsonKey(name: "net_amount")
  double get netAmount =>
      throw _privateConstructorUsedError; // القيمة الافتراضية = 0.0
  @JsonKey(name: "rate")
  double get rate =>
      throw _privateConstructorUsedError; // القيمة الافتراضية = 0.0
  @JsonKey(name: "message")
  String get message =>
      throw _privateConstructorUsedError; // القيمة الافتراضية = ''
  @JsonKey(name: "image")
  String get image =>
      throw _privateConstructorUsedError; // القيمة الافتراضية = ''
  @JsonKey(name: "address")
  String get address =>
      throw _privateConstructorUsedError; // القيمة الافتراضية = ''
  @JsonKey(name: "employee_id")
  int get employeeId =>
      throw _privateConstructorUsedError; // القيمة الافتراضية = 0
  @JsonKey(name: "user_id")
  int get userId => throw _privateConstructorUsedError; // القيمة الافتراضية = 0
  @JsonKey(name: "sender_currency_id")
  int get senderCurrencyId =>
      throw _privateConstructorUsedError; // القيمة الافتراضية = 0
  @JsonKey(name: "receiver_currency_id")
  int get receiverCurrencyId =>
      throw _privateConstructorUsedError; // القيمة الافتراضية = 0
  @JsonKey(name: "receiver_account")
  String get receiverAccount =>
      throw _privateConstructorUsedError; // القيمة الافتراضية = ''
  @JsonKey(name: "created_at")
  String get createdAt =>
      throw _privateConstructorUsedError; // القيمة الافتراضية = ''
  @JsonKey(name: "updated_at")
  String get updatedAt =>
      throw _privateConstructorUsedError; // القيمة الافتراضية = ''
  @JsonKey(name: "sender_currency")
  Currency get senderCurrency =>
      throw _privateConstructorUsedError; // القيمة الافتراضية = 'ErCurrency(name: '')'
  @JsonKey(name: "receiver_currency")
  Currency get receiverCurrency => throw _privateConstructorUsedError;

  /// Serializes this Trans to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Trans
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransCopyWith<Trans> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransCopyWith<$Res> {
  factory $TransCopyWith(Trans value, $Res Function(Trans) then) =
      _$TransCopyWithImpl<$Res, Trans>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") int id,
      @JsonKey(name: "status") String status,
      @JsonKey(name: "amount") double amount,
      @JsonKey(name: "net_amount") double netAmount,
      @JsonKey(name: "rate") double rate,
      @JsonKey(name: "message") String message,
      @JsonKey(name: "image") String image,
      @JsonKey(name: "address") String address,
      @JsonKey(name: "employee_id") int employeeId,
      @JsonKey(name: "user_id") int userId,
      @JsonKey(name: "sender_currency_id") int senderCurrencyId,
      @JsonKey(name: "receiver_currency_id") int receiverCurrencyId,
      @JsonKey(name: "receiver_account") String receiverAccount,
      @JsonKey(name: "created_at") String createdAt,
      @JsonKey(name: "updated_at") String updatedAt,
      @JsonKey(name: "sender_currency") Currency senderCurrency,
      @JsonKey(name: "receiver_currency") Currency receiverCurrency});

  $CurrencyCopyWith<$Res> get senderCurrency;
  $CurrencyCopyWith<$Res> get receiverCurrency;
}

/// @nodoc
class _$TransCopyWithImpl<$Res, $Val extends Trans>
    implements $TransCopyWith<$Res> {
  _$TransCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Trans
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? amount = null,
    Object? netAmount = null,
    Object? rate = null,
    Object? message = null,
    Object? image = null,
    Object? address = null,
    Object? employeeId = null,
    Object? userId = null,
    Object? senderCurrencyId = null,
    Object? receiverCurrencyId = null,
    Object? receiverAccount = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? senderCurrency = null,
    Object? receiverCurrency = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      netAmount: null == netAmount
          ? _value.netAmount
          : netAmount // ignore: cast_nullable_to_non_nullable
              as double,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      employeeId: null == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      senderCurrencyId: null == senderCurrencyId
          ? _value.senderCurrencyId
          : senderCurrencyId // ignore: cast_nullable_to_non_nullable
              as int,
      receiverCurrencyId: null == receiverCurrencyId
          ? _value.receiverCurrencyId
          : receiverCurrencyId // ignore: cast_nullable_to_non_nullable
              as int,
      receiverAccount: null == receiverAccount
          ? _value.receiverAccount
          : receiverAccount // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      senderCurrency: null == senderCurrency
          ? _value.senderCurrency
          : senderCurrency // ignore: cast_nullable_to_non_nullable
              as Currency,
      receiverCurrency: null == receiverCurrency
          ? _value.receiverCurrency
          : receiverCurrency // ignore: cast_nullable_to_non_nullable
              as Currency,
    ) as $Val);
  }

  /// Create a copy of Trans
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CurrencyCopyWith<$Res> get senderCurrency {
    return $CurrencyCopyWith<$Res>(_value.senderCurrency, (value) {
      return _then(_value.copyWith(senderCurrency: value) as $Val);
    });
  }

  /// Create a copy of Trans
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CurrencyCopyWith<$Res> get receiverCurrency {
    return $CurrencyCopyWith<$Res>(_value.receiverCurrency, (value) {
      return _then(_value.copyWith(receiverCurrency: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TransImplCopyWith<$Res> implements $TransCopyWith<$Res> {
  factory _$$TransImplCopyWith(
          _$TransImpl value, $Res Function(_$TransImpl) then) =
      __$$TransImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") int id,
      @JsonKey(name: "status") String status,
      @JsonKey(name: "amount") double amount,
      @JsonKey(name: "net_amount") double netAmount,
      @JsonKey(name: "rate") double rate,
      @JsonKey(name: "message") String message,
      @JsonKey(name: "image") String image,
      @JsonKey(name: "address") String address,
      @JsonKey(name: "employee_id") int employeeId,
      @JsonKey(name: "user_id") int userId,
      @JsonKey(name: "sender_currency_id") int senderCurrencyId,
      @JsonKey(name: "receiver_currency_id") int receiverCurrencyId,
      @JsonKey(name: "receiver_account") String receiverAccount,
      @JsonKey(name: "created_at") String createdAt,
      @JsonKey(name: "updated_at") String updatedAt,
      @JsonKey(name: "sender_currency") Currency senderCurrency,
      @JsonKey(name: "receiver_currency") Currency receiverCurrency});

  @override
  $CurrencyCopyWith<$Res> get senderCurrency;
  @override
  $CurrencyCopyWith<$Res> get receiverCurrency;
}

/// @nodoc
class __$$TransImplCopyWithImpl<$Res>
    extends _$TransCopyWithImpl<$Res, _$TransImpl>
    implements _$$TransImplCopyWith<$Res> {
  __$$TransImplCopyWithImpl(
      _$TransImpl _value, $Res Function(_$TransImpl) _then)
      : super(_value, _then);

  /// Create a copy of Trans
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? amount = null,
    Object? netAmount = null,
    Object? rate = null,
    Object? message = null,
    Object? image = null,
    Object? address = null,
    Object? employeeId = null,
    Object? userId = null,
    Object? senderCurrencyId = null,
    Object? receiverCurrencyId = null,
    Object? receiverAccount = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? senderCurrency = null,
    Object? receiverCurrency = null,
  }) {
    return _then(_$TransImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      netAmount: null == netAmount
          ? _value.netAmount
          : netAmount // ignore: cast_nullable_to_non_nullable
              as double,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      employeeId: null == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      senderCurrencyId: null == senderCurrencyId
          ? _value.senderCurrencyId
          : senderCurrencyId // ignore: cast_nullable_to_non_nullable
              as int,
      receiverCurrencyId: null == receiverCurrencyId
          ? _value.receiverCurrencyId
          : receiverCurrencyId // ignore: cast_nullable_to_non_nullable
              as int,
      receiverAccount: null == receiverAccount
          ? _value.receiverAccount
          : receiverAccount // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      senderCurrency: null == senderCurrency
          ? _value.senderCurrency
          : senderCurrency // ignore: cast_nullable_to_non_nullable
              as Currency,
      receiverCurrency: null == receiverCurrency
          ? _value.receiverCurrency
          : receiverCurrency // ignore: cast_nullable_to_non_nullable
              as Currency,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransImpl implements _Trans {
  const _$TransImpl(
      {@JsonKey(name: "id") this.id = 0,
      @JsonKey(name: "status") this.status = '',
      @JsonKey(name: "amount") this.amount = 0.0,
      @JsonKey(name: "net_amount") this.netAmount = 0.0,
      @JsonKey(name: "rate") this.rate = 0.0,
      @JsonKey(name: "message") this.message = '',
      @JsonKey(name: "image") this.image = '',
      @JsonKey(name: "address") this.address = '',
      @JsonKey(name: "employee_id") this.employeeId = 0,
      @JsonKey(name: "user_id") this.userId = 0,
      @JsonKey(name: "sender_currency_id") this.senderCurrencyId = 0,
      @JsonKey(name: "receiver_currency_id") this.receiverCurrencyId = 0,
      @JsonKey(name: "receiver_account") this.receiverAccount = '',
      @JsonKey(name: "created_at") this.createdAt = '',
      @JsonKey(name: "updated_at") this.updatedAt = '',
      @JsonKey(name: "sender_currency")
      this.senderCurrency = const Currency(name: ''),
      @JsonKey(name: "receiver_currency")
      this.receiverCurrency = const Currency(name: '')});

  factory _$TransImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final int id;
// القيمة الافتراضية = 0
  @override
  @JsonKey(name: "status")
  final String status;
// القيمة الافتراضية = ''
  @override
  @JsonKey(name: "amount")
  final double amount;
// القيمة الافتراضية = 0.0
  @override
  @JsonKey(name: "net_amount")
  final double netAmount;
// القيمة الافتراضية = 0.0
  @override
  @JsonKey(name: "rate")
  final double rate;
// القيمة الافتراضية = 0.0
  @override
  @JsonKey(name: "message")
  final String message;
// القيمة الافتراضية = ''
  @override
  @JsonKey(name: "image")
  final String image;
// القيمة الافتراضية = ''
  @override
  @JsonKey(name: "address")
  final String address;
// القيمة الافتراضية = ''
  @override
  @JsonKey(name: "employee_id")
  final int employeeId;
// القيمة الافتراضية = 0
  @override
  @JsonKey(name: "user_id")
  final int userId;
// القيمة الافتراضية = 0
  @override
  @JsonKey(name: "sender_currency_id")
  final int senderCurrencyId;
// القيمة الافتراضية = 0
  @override
  @JsonKey(name: "receiver_currency_id")
  final int receiverCurrencyId;
// القيمة الافتراضية = 0
  @override
  @JsonKey(name: "receiver_account")
  final String receiverAccount;
// القيمة الافتراضية = ''
  @override
  @JsonKey(name: "created_at")
  final String createdAt;
// القيمة الافتراضية = ''
  @override
  @JsonKey(name: "updated_at")
  final String updatedAt;
// القيمة الافتراضية = ''
  @override
  @JsonKey(name: "sender_currency")
  final Currency senderCurrency;
// القيمة الافتراضية = 'ErCurrency(name: '')'
  @override
  @JsonKey(name: "receiver_currency")
  final Currency receiverCurrency;

  @override
  String toString() {
    return 'Trans(id: $id, status: $status, amount: $amount, netAmount: $netAmount, rate: $rate, message: $message, image: $image, address: $address, employeeId: $employeeId, userId: $userId, senderCurrencyId: $senderCurrencyId, receiverCurrencyId: $receiverCurrencyId, receiverAccount: $receiverAccount, createdAt: $createdAt, updatedAt: $updatedAt, senderCurrency: $senderCurrency, receiverCurrency: $receiverCurrency)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.netAmount, netAmount) ||
                other.netAmount == netAmount) &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.employeeId, employeeId) ||
                other.employeeId == employeeId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.senderCurrencyId, senderCurrencyId) ||
                other.senderCurrencyId == senderCurrencyId) &&
            (identical(other.receiverCurrencyId, receiverCurrencyId) ||
                other.receiverCurrencyId == receiverCurrencyId) &&
            (identical(other.receiverAccount, receiverAccount) ||
                other.receiverAccount == receiverAccount) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.senderCurrency, senderCurrency) ||
                other.senderCurrency == senderCurrency) &&
            (identical(other.receiverCurrency, receiverCurrency) ||
                other.receiverCurrency == receiverCurrency));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      status,
      amount,
      netAmount,
      rate,
      message,
      image,
      address,
      employeeId,
      userId,
      senderCurrencyId,
      receiverCurrencyId,
      receiverAccount,
      createdAt,
      updatedAt,
      senderCurrency,
      receiverCurrency);

  /// Create a copy of Trans
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransImplCopyWith<_$TransImpl> get copyWith =>
      __$$TransImplCopyWithImpl<_$TransImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransImplToJson(
      this,
    );
  }
}

abstract class _Trans implements Trans {
  const factory _Trans(
      {@JsonKey(name: "id") final int id,
      @JsonKey(name: "status") final String status,
      @JsonKey(name: "amount") final double amount,
      @JsonKey(name: "net_amount") final double netAmount,
      @JsonKey(name: "rate") final double rate,
      @JsonKey(name: "message") final String message,
      @JsonKey(name: "image") final String image,
      @JsonKey(name: "address") final String address,
      @JsonKey(name: "employee_id") final int employeeId,
      @JsonKey(name: "user_id") final int userId,
      @JsonKey(name: "sender_currency_id") final int senderCurrencyId,
      @JsonKey(name: "receiver_currency_id") final int receiverCurrencyId,
      @JsonKey(name: "receiver_account") final String receiverAccount,
      @JsonKey(name: "created_at") final String createdAt,
      @JsonKey(name: "updated_at") final String updatedAt,
      @JsonKey(name: "sender_currency") final Currency senderCurrency,
      @JsonKey(name: "receiver_currency")
      final Currency receiverCurrency}) = _$TransImpl;

  factory _Trans.fromJson(Map<String, dynamic> json) = _$TransImpl.fromJson;

  @override
  @JsonKey(name: "id")
  int get id; // القيمة الافتراضية = 0
  @override
  @JsonKey(name: "status")
  String get status; // القيمة الافتراضية = ''
  @override
  @JsonKey(name: "amount")
  double get amount; // القيمة الافتراضية = 0.0
  @override
  @JsonKey(name: "net_amount")
  double get netAmount; // القيمة الافتراضية = 0.0
  @override
  @JsonKey(name: "rate")
  double get rate; // القيمة الافتراضية = 0.0
  @override
  @JsonKey(name: "message")
  String get message; // القيمة الافتراضية = ''
  @override
  @JsonKey(name: "image")
  String get image; // القيمة الافتراضية = ''
  @override
  @JsonKey(name: "address")
  String get address; // القيمة الافتراضية = ''
  @override
  @JsonKey(name: "employee_id")
  int get employeeId; // القيمة الافتراضية = 0
  @override
  @JsonKey(name: "user_id")
  int get userId; // القيمة الافتراضية = 0
  @override
  @JsonKey(name: "sender_currency_id")
  int get senderCurrencyId; // القيمة الافتراضية = 0
  @override
  @JsonKey(name: "receiver_currency_id")
  int get receiverCurrencyId; // القيمة الافتراضية = 0
  @override
  @JsonKey(name: "receiver_account")
  String get receiverAccount; // القيمة الافتراضية = ''
  @override
  @JsonKey(name: "created_at")
  String get createdAt; // القيمة الافتراضية = ''
  @override
  @JsonKey(name: "updated_at")
  String get updatedAt; // القيمة الافتراضية = ''
  @override
  @JsonKey(name: "sender_currency")
  Currency get senderCurrency; // القيمة الافتراضية = 'ErCurrency(name: '')'
  @override
  @JsonKey(name: "receiver_currency")
  Currency get receiverCurrency;

  /// Create a copy of Trans
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransImplCopyWith<_$TransImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
