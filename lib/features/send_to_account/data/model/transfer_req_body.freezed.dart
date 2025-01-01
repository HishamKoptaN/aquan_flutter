// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transfer_req_body.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TransferReqBody _$TransferReqBodyFromJson(Map<String, dynamic> json) {
  return _TransferReqBody.fromJson(json);
}

/// @nodoc
mixin _$TransferReqBody {
  @JsonKey(name: "account_number")
  String? get accountNumber => throw _privateConstructorUsedError;
  @JsonKey(name: "amount")
  int? get amount => throw _privateConstructorUsedError;

  /// Serializes this TransferReqBody to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TransferReqBody
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransferReqBodyCopyWith<TransferReqBody> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransferReqBodyCopyWith<$Res> {
  factory $TransferReqBodyCopyWith(
          TransferReqBody value, $Res Function(TransferReqBody) then) =
      _$TransferReqBodyCopyWithImpl<$Res, TransferReqBody>;
  @useResult
  $Res call(
      {@JsonKey(name: "account_number") String? accountNumber,
      @JsonKey(name: "amount") int? amount});
}

/// @nodoc
class _$TransferReqBodyCopyWithImpl<$Res, $Val extends TransferReqBody>
    implements $TransferReqBodyCopyWith<$Res> {
  _$TransferReqBodyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransferReqBody
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountNumber = freezed,
    Object? amount = freezed,
  }) {
    return _then(_value.copyWith(
      accountNumber: freezed == accountNumber
          ? _value.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransferReqBodyImplCopyWith<$Res>
    implements $TransferReqBodyCopyWith<$Res> {
  factory _$$TransferReqBodyImplCopyWith(_$TransferReqBodyImpl value,
          $Res Function(_$TransferReqBodyImpl) then) =
      __$$TransferReqBodyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "account_number") String? accountNumber,
      @JsonKey(name: "amount") int? amount});
}

/// @nodoc
class __$$TransferReqBodyImplCopyWithImpl<$Res>
    extends _$TransferReqBodyCopyWithImpl<$Res, _$TransferReqBodyImpl>
    implements _$$TransferReqBodyImplCopyWith<$Res> {
  __$$TransferReqBodyImplCopyWithImpl(
      _$TransferReqBodyImpl _value, $Res Function(_$TransferReqBodyImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransferReqBody
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountNumber = freezed,
    Object? amount = freezed,
  }) {
    return _then(_$TransferReqBodyImpl(
      accountNumber: freezed == accountNumber
          ? _value.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransferReqBodyImpl implements _TransferReqBody {
  const _$TransferReqBodyImpl(
      {@JsonKey(name: "account_number") this.accountNumber,
      @JsonKey(name: "amount") this.amount});

  factory _$TransferReqBodyImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransferReqBodyImplFromJson(json);

  @override
  @JsonKey(name: "account_number")
  final String? accountNumber;
  @override
  @JsonKey(name: "amount")
  final int? amount;

  @override
  String toString() {
    return 'TransferReqBody(accountNumber: $accountNumber, amount: $amount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransferReqBodyImpl &&
            (identical(other.accountNumber, accountNumber) ||
                other.accountNumber == accountNumber) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, accountNumber, amount);

  /// Create a copy of TransferReqBody
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransferReqBodyImplCopyWith<_$TransferReqBodyImpl> get copyWith =>
      __$$TransferReqBodyImplCopyWithImpl<_$TransferReqBodyImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransferReqBodyImplToJson(
      this,
    );
  }
}

abstract class _TransferReqBody implements TransferReqBody {
  const factory _TransferReqBody(
      {@JsonKey(name: "account_number") final String? accountNumber,
      @JsonKey(name: "amount") final int? amount}) = _$TransferReqBodyImpl;

  factory _TransferReqBody.fromJson(Map<String, dynamic> json) =
      _$TransferReqBodyImpl.fromJson;

  @override
  @JsonKey(name: "account_number")
  String? get accountNumber;
  @override
  @JsonKey(name: "amount")
  int? get amount;

  /// Create a copy of TransferReqBody
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransferReqBodyImplCopyWith<_$TransferReqBodyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
