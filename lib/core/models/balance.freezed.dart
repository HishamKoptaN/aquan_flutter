// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'balance.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Balance _$BalanceFromJson(Map<String, dynamic> json) {
  return _Balance.fromJson(json);
}

/// @nodoc
mixin _$Balance {
  @JsonKey(name: "id")
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "user_id")
  int? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: "total_balance")
  int? get totalBalance => throw _privateConstructorUsedError;
  @JsonKey(name: "available_balance")
  String? get availableBalance => throw _privateConstructorUsedError;
  @JsonKey(name: "suspended_balance")
  String? get suspendedBalance => throw _privateConstructorUsedError;

  /// Serializes this Balance to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Balance
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BalanceCopyWith<Balance> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BalanceCopyWith<$Res> {
  factory $BalanceCopyWith(Balance value, $Res Function(Balance) then) =
      _$BalanceCopyWithImpl<$Res, Balance>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "user_id") int? userId,
      @JsonKey(name: "total_balance") int? totalBalance,
      @JsonKey(name: "available_balance") String? availableBalance,
      @JsonKey(name: "suspended_balance") String? suspendedBalance});
}

/// @nodoc
class _$BalanceCopyWithImpl<$Res, $Val extends Balance>
    implements $BalanceCopyWith<$Res> {
  _$BalanceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Balance
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? totalBalance = freezed,
    Object? availableBalance = freezed,
    Object? suspendedBalance = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      totalBalance: freezed == totalBalance
          ? _value.totalBalance
          : totalBalance // ignore: cast_nullable_to_non_nullable
              as int?,
      availableBalance: freezed == availableBalance
          ? _value.availableBalance
          : availableBalance // ignore: cast_nullable_to_non_nullable
              as String?,
      suspendedBalance: freezed == suspendedBalance
          ? _value.suspendedBalance
          : suspendedBalance // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BalanceImplCopyWith<$Res> implements $BalanceCopyWith<$Res> {
  factory _$$BalanceImplCopyWith(
          _$BalanceImpl value, $Res Function(_$BalanceImpl) then) =
      __$$BalanceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "user_id") int? userId,
      @JsonKey(name: "total_balance") int? totalBalance,
      @JsonKey(name: "available_balance") String? availableBalance,
      @JsonKey(name: "suspended_balance") String? suspendedBalance});
}

/// @nodoc
class __$$BalanceImplCopyWithImpl<$Res>
    extends _$BalanceCopyWithImpl<$Res, _$BalanceImpl>
    implements _$$BalanceImplCopyWith<$Res> {
  __$$BalanceImplCopyWithImpl(
      _$BalanceImpl _value, $Res Function(_$BalanceImpl) _then)
      : super(_value, _then);

  /// Create a copy of Balance
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? totalBalance = freezed,
    Object? availableBalance = freezed,
    Object? suspendedBalance = freezed,
  }) {
    return _then(_$BalanceImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      totalBalance: freezed == totalBalance
          ? _value.totalBalance
          : totalBalance // ignore: cast_nullable_to_non_nullable
              as int?,
      availableBalance: freezed == availableBalance
          ? _value.availableBalance
          : availableBalance // ignore: cast_nullable_to_non_nullable
              as String?,
      suspendedBalance: freezed == suspendedBalance
          ? _value.suspendedBalance
          : suspendedBalance // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BalanceImpl implements _Balance {
  const _$BalanceImpl(
      {@JsonKey(name: "id") this.id,
      @JsonKey(name: "user_id") this.userId,
      @JsonKey(name: "total_balance") this.totalBalance,
      @JsonKey(name: "available_balance") this.availableBalance,
      @JsonKey(name: "suspended_balance") this.suspendedBalance});

  factory _$BalanceImpl.fromJson(Map<String, dynamic> json) =>
      _$$BalanceImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final int? id;
  @override
  @JsonKey(name: "user_id")
  final int? userId;
  @override
  @JsonKey(name: "total_balance")
  final int? totalBalance;
  @override
  @JsonKey(name: "available_balance")
  final String? availableBalance;
  @override
  @JsonKey(name: "suspended_balance")
  final String? suspendedBalance;

  @override
  String toString() {
    return 'Balance(id: $id, userId: $userId, totalBalance: $totalBalance, availableBalance: $availableBalance, suspendedBalance: $suspendedBalance)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BalanceImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.totalBalance, totalBalance) ||
                other.totalBalance == totalBalance) &&
            (identical(other.availableBalance, availableBalance) ||
                other.availableBalance == availableBalance) &&
            (identical(other.suspendedBalance, suspendedBalance) ||
                other.suspendedBalance == suspendedBalance));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, totalBalance,
      availableBalance, suspendedBalance);

  /// Create a copy of Balance
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BalanceImplCopyWith<_$BalanceImpl> get copyWith =>
      __$$BalanceImplCopyWithImpl<_$BalanceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BalanceImplToJson(
      this,
    );
  }
}

abstract class _Balance implements Balance {
  const factory _Balance(
          {@JsonKey(name: "id") final int? id,
          @JsonKey(name: "user_id") final int? userId,
          @JsonKey(name: "total_balance") final int? totalBalance,
          @JsonKey(name: "available_balance") final String? availableBalance,
          @JsonKey(name: "suspended_balance") final String? suspendedBalance}) =
      _$BalanceImpl;

  factory _Balance.fromJson(Map<String, dynamic> json) = _$BalanceImpl.fromJson;

  @override
  @JsonKey(name: "id")
  int? get id;
  @override
  @JsonKey(name: "user_id")
  int? get userId;
  @override
  @JsonKey(name: "total_balance")
  int? get totalBalance;
  @override
  @JsonKey(name: "available_balance")
  String? get availableBalance;
  @override
  @JsonKey(name: "suspended_balance")
  String? get suspendedBalance;

  /// Create a copy of Balance
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BalanceImplCopyWith<_$BalanceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
