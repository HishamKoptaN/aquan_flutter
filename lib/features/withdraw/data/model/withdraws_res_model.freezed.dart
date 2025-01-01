// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'withdraws_res_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Withdraw _$WithdrawFromJson(Map<String, dynamic> json) {
  return _Withdraw.fromJson(json);
}

/// @nodoc
mixin _$Withdraw {
  @JsonKey(name: "id")
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "status")
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: "user_id")
  int? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: "method")
  int? get method => throw _privateConstructorUsedError;
  @JsonKey(name: "receiving_account_number")
  String? get receivingAccountNumber => throw _privateConstructorUsedError;
  @JsonKey(name: "amount")
  double? get amount => throw _privateConstructorUsedError;
  @JsonKey(name: "image")
  String? get image => throw _privateConstructorUsedError;
  @JsonKey(name: "comment")
  String? get comment => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "updated_at")
  String? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: "currency")
  Currency? get currency => throw _privateConstructorUsedError;

  /// Serializes this Withdraw to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Withdraw
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WithdrawCopyWith<Withdraw> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WithdrawCopyWith<$Res> {
  factory $WithdrawCopyWith(Withdraw value, $Res Function(Withdraw) then) =
      _$WithdrawCopyWithImpl<$Res, Withdraw>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "status") String? status,
      @JsonKey(name: "user_id") int? userId,
      @JsonKey(name: "method") int? method,
      @JsonKey(name: "receiving_account_number") String? receivingAccountNumber,
      @JsonKey(name: "amount") double? amount,
      @JsonKey(name: "image") String? image,
      @JsonKey(name: "comment") String? comment,
      @JsonKey(name: "created_at") String? createdAt,
      @JsonKey(name: "updated_at") String? updatedAt,
      @JsonKey(name: "currency") Currency? currency});

  $CurrencyCopyWith<$Res>? get currency;
}

/// @nodoc
class _$WithdrawCopyWithImpl<$Res, $Val extends Withdraw>
    implements $WithdrawCopyWith<$Res> {
  _$WithdrawCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Withdraw
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? status = freezed,
    Object? userId = freezed,
    Object? method = freezed,
    Object? receivingAccountNumber = freezed,
    Object? amount = freezed,
    Object? image = freezed,
    Object? comment = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? currency = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      method: freezed == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as int?,
      receivingAccountNumber: freezed == receivingAccountNumber
          ? _value.receivingAccountNumber
          : receivingAccountNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency?,
    ) as $Val);
  }

  /// Create a copy of Withdraw
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CurrencyCopyWith<$Res>? get currency {
    if (_value.currency == null) {
      return null;
    }

    return $CurrencyCopyWith<$Res>(_value.currency!, (value) {
      return _then(_value.copyWith(currency: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WithdrawImplCopyWith<$Res>
    implements $WithdrawCopyWith<$Res> {
  factory _$$WithdrawImplCopyWith(
          _$WithdrawImpl value, $Res Function(_$WithdrawImpl) then) =
      __$$WithdrawImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "status") String? status,
      @JsonKey(name: "user_id") int? userId,
      @JsonKey(name: "method") int? method,
      @JsonKey(name: "receiving_account_number") String? receivingAccountNumber,
      @JsonKey(name: "amount") double? amount,
      @JsonKey(name: "image") String? image,
      @JsonKey(name: "comment") String? comment,
      @JsonKey(name: "created_at") String? createdAt,
      @JsonKey(name: "updated_at") String? updatedAt,
      @JsonKey(name: "currency") Currency? currency});

  @override
  $CurrencyCopyWith<$Res>? get currency;
}

/// @nodoc
class __$$WithdrawImplCopyWithImpl<$Res>
    extends _$WithdrawCopyWithImpl<$Res, _$WithdrawImpl>
    implements _$$WithdrawImplCopyWith<$Res> {
  __$$WithdrawImplCopyWithImpl(
      _$WithdrawImpl _value, $Res Function(_$WithdrawImpl) _then)
      : super(_value, _then);

  /// Create a copy of Withdraw
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? status = freezed,
    Object? userId = freezed,
    Object? method = freezed,
    Object? receivingAccountNumber = freezed,
    Object? amount = freezed,
    Object? image = freezed,
    Object? comment = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? currency = freezed,
  }) {
    return _then(_$WithdrawImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      method: freezed == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as int?,
      receivingAccountNumber: freezed == receivingAccountNumber
          ? _value.receivingAccountNumber
          : receivingAccountNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WithdrawImpl implements _Withdraw {
  const _$WithdrawImpl(
      {@JsonKey(name: "id") this.id,
      @JsonKey(name: "status") this.status,
      @JsonKey(name: "user_id") this.userId,
      @JsonKey(name: "method") this.method,
      @JsonKey(name: "receiving_account_number") this.receivingAccountNumber,
      @JsonKey(name: "amount") this.amount,
      @JsonKey(name: "image") this.image,
      @JsonKey(name: "comment") this.comment,
      @JsonKey(name: "created_at") this.createdAt,
      @JsonKey(name: "updated_at") this.updatedAt,
      @JsonKey(name: "currency") this.currency});

  factory _$WithdrawImpl.fromJson(Map<String, dynamic> json) =>
      _$$WithdrawImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final int? id;
  @override
  @JsonKey(name: "status")
  final String? status;
  @override
  @JsonKey(name: "user_id")
  final int? userId;
  @override
  @JsonKey(name: "method")
  final int? method;
  @override
  @JsonKey(name: "receiving_account_number")
  final String? receivingAccountNumber;
  @override
  @JsonKey(name: "amount")
  final double? amount;
  @override
  @JsonKey(name: "image")
  final String? image;
  @override
  @JsonKey(name: "comment")
  final String? comment;
  @override
  @JsonKey(name: "created_at")
  final String? createdAt;
  @override
  @JsonKey(name: "updated_at")
  final String? updatedAt;
  @override
  @JsonKey(name: "currency")
  final Currency? currency;

  @override
  String toString() {
    return 'Withdraw(id: $id, status: $status, userId: $userId, method: $method, receivingAccountNumber: $receivingAccountNumber, amount: $amount, image: $image, comment: $comment, createdAt: $createdAt, updatedAt: $updatedAt, currency: $currency)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WithdrawImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.method, method) || other.method == method) &&
            (identical(other.receivingAccountNumber, receivingAccountNumber) ||
                other.receivingAccountNumber == receivingAccountNumber) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.currency, currency) ||
                other.currency == currency));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      status,
      userId,
      method,
      receivingAccountNumber,
      amount,
      image,
      comment,
      createdAt,
      updatedAt,
      currency);

  /// Create a copy of Withdraw
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WithdrawImplCopyWith<_$WithdrawImpl> get copyWith =>
      __$$WithdrawImplCopyWithImpl<_$WithdrawImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WithdrawImplToJson(
      this,
    );
  }
}

abstract class _Withdraw implements Withdraw {
  const factory _Withdraw(
      {@JsonKey(name: "id") final int? id,
      @JsonKey(name: "status") final String? status,
      @JsonKey(name: "user_id") final int? userId,
      @JsonKey(name: "method") final int? method,
      @JsonKey(name: "receiving_account_number")
      final String? receivingAccountNumber,
      @JsonKey(name: "amount") final double? amount,
      @JsonKey(name: "image") final String? image,
      @JsonKey(name: "comment") final String? comment,
      @JsonKey(name: "created_at") final String? createdAt,
      @JsonKey(name: "updated_at") final String? updatedAt,
      @JsonKey(name: "currency") final Currency? currency}) = _$WithdrawImpl;

  factory _Withdraw.fromJson(Map<String, dynamic> json) =
      _$WithdrawImpl.fromJson;

  @override
  @JsonKey(name: "id")
  int? get id;
  @override
  @JsonKey(name: "status")
  String? get status;
  @override
  @JsonKey(name: "user_id")
  int? get userId;
  @override
  @JsonKey(name: "method")
  int? get method;
  @override
  @JsonKey(name: "receiving_account_number")
  String? get receivingAccountNumber;
  @override
  @JsonKey(name: "amount")
  double? get amount;
  @override
  @JsonKey(name: "image")
  String? get image;
  @override
  @JsonKey(name: "comment")
  String? get comment;
  @override
  @JsonKey(name: "created_at")
  String? get createdAt;
  @override
  @JsonKey(name: "updated_at")
  String? get updatedAt;
  @override
  @JsonKey(name: "currency")
  Currency? get currency;

  /// Create a copy of Withdraw
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WithdrawImplCopyWith<_$WithdrawImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
