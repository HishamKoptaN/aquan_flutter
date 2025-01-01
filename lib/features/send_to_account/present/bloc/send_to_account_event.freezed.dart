// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'send_to_account_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SendToAccountEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String accountNumber) getNameOfUserByAccount,
    required TResult Function(TransferReqBody transferReqBody)
        sendPaymentToOtherAccount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String accountNumber)? getNameOfUserByAccount,
    TResult? Function(TransferReqBody transferReqBody)?
        sendPaymentToOtherAccount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String accountNumber)? getNameOfUserByAccount,
    TResult Function(TransferReqBody transferReqBody)?
        sendPaymentToOtherAccount,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetNameOfUserByAccountEvent value)
        getNameOfUserByAccount,
    required TResult Function(_SendPaymentToOtherAccount value)
        sendPaymentToOtherAccount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetNameOfUserByAccountEvent value)?
        getNameOfUserByAccount,
    TResult? Function(_SendPaymentToOtherAccount value)?
        sendPaymentToOtherAccount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetNameOfUserByAccountEvent value)?
        getNameOfUserByAccount,
    TResult Function(_SendPaymentToOtherAccount value)?
        sendPaymentToOtherAccount,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SendToAccountEventCopyWith<$Res> {
  factory $SendToAccountEventCopyWith(
          SendToAccountEvent value, $Res Function(SendToAccountEvent) then) =
      _$SendToAccountEventCopyWithImpl<$Res, SendToAccountEvent>;
}

/// @nodoc
class _$SendToAccountEventCopyWithImpl<$Res, $Val extends SendToAccountEvent>
    implements $SendToAccountEventCopyWith<$Res> {
  _$SendToAccountEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SendToAccountEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GetNameOfUserByAccountEventImplCopyWith<$Res> {
  factory _$$GetNameOfUserByAccountEventImplCopyWith(
          _$GetNameOfUserByAccountEventImpl value,
          $Res Function(_$GetNameOfUserByAccountEventImpl) then) =
      __$$GetNameOfUserByAccountEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String accountNumber});
}

/// @nodoc
class __$$GetNameOfUserByAccountEventImplCopyWithImpl<$Res>
    extends _$SendToAccountEventCopyWithImpl<$Res,
        _$GetNameOfUserByAccountEventImpl>
    implements _$$GetNameOfUserByAccountEventImplCopyWith<$Res> {
  __$$GetNameOfUserByAccountEventImplCopyWithImpl(
      _$GetNameOfUserByAccountEventImpl _value,
      $Res Function(_$GetNameOfUserByAccountEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of SendToAccountEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountNumber = null,
  }) {
    return _then(_$GetNameOfUserByAccountEventImpl(
      accountNumber: null == accountNumber
          ? _value.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetNameOfUserByAccountEventImpl
    implements _GetNameOfUserByAccountEvent {
  const _$GetNameOfUserByAccountEventImpl({required this.accountNumber});

  @override
  final String accountNumber;

  @override
  String toString() {
    return 'SendToAccountEvent.getNameOfUserByAccount(accountNumber: $accountNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetNameOfUserByAccountEventImpl &&
            (identical(other.accountNumber, accountNumber) ||
                other.accountNumber == accountNumber));
  }

  @override
  int get hashCode => Object.hash(runtimeType, accountNumber);

  /// Create a copy of SendToAccountEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetNameOfUserByAccountEventImplCopyWith<_$GetNameOfUserByAccountEventImpl>
      get copyWith => __$$GetNameOfUserByAccountEventImplCopyWithImpl<
          _$GetNameOfUserByAccountEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String accountNumber) getNameOfUserByAccount,
    required TResult Function(TransferReqBody transferReqBody)
        sendPaymentToOtherAccount,
  }) {
    return getNameOfUserByAccount(accountNumber);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String accountNumber)? getNameOfUserByAccount,
    TResult? Function(TransferReqBody transferReqBody)?
        sendPaymentToOtherAccount,
  }) {
    return getNameOfUserByAccount?.call(accountNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String accountNumber)? getNameOfUserByAccount,
    TResult Function(TransferReqBody transferReqBody)?
        sendPaymentToOtherAccount,
    required TResult orElse(),
  }) {
    if (getNameOfUserByAccount != null) {
      return getNameOfUserByAccount(accountNumber);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetNameOfUserByAccountEvent value)
        getNameOfUserByAccount,
    required TResult Function(_SendPaymentToOtherAccount value)
        sendPaymentToOtherAccount,
  }) {
    return getNameOfUserByAccount(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetNameOfUserByAccountEvent value)?
        getNameOfUserByAccount,
    TResult? Function(_SendPaymentToOtherAccount value)?
        sendPaymentToOtherAccount,
  }) {
    return getNameOfUserByAccount?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetNameOfUserByAccountEvent value)?
        getNameOfUserByAccount,
    TResult Function(_SendPaymentToOtherAccount value)?
        sendPaymentToOtherAccount,
    required TResult orElse(),
  }) {
    if (getNameOfUserByAccount != null) {
      return getNameOfUserByAccount(this);
    }
    return orElse();
  }
}

abstract class _GetNameOfUserByAccountEvent implements SendToAccountEvent {
  const factory _GetNameOfUserByAccountEvent(
          {required final String accountNumber}) =
      _$GetNameOfUserByAccountEventImpl;

  String get accountNumber;

  /// Create a copy of SendToAccountEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetNameOfUserByAccountEventImplCopyWith<_$GetNameOfUserByAccountEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SendPaymentToOtherAccountImplCopyWith<$Res> {
  factory _$$SendPaymentToOtherAccountImplCopyWith(
          _$SendPaymentToOtherAccountImpl value,
          $Res Function(_$SendPaymentToOtherAccountImpl) then) =
      __$$SendPaymentToOtherAccountImplCopyWithImpl<$Res>;
  @useResult
  $Res call({TransferReqBody transferReqBody});

  $TransferReqBodyCopyWith<$Res> get transferReqBody;
}

/// @nodoc
class __$$SendPaymentToOtherAccountImplCopyWithImpl<$Res>
    extends _$SendToAccountEventCopyWithImpl<$Res,
        _$SendPaymentToOtherAccountImpl>
    implements _$$SendPaymentToOtherAccountImplCopyWith<$Res> {
  __$$SendPaymentToOtherAccountImplCopyWithImpl(
      _$SendPaymentToOtherAccountImpl _value,
      $Res Function(_$SendPaymentToOtherAccountImpl) _then)
      : super(_value, _then);

  /// Create a copy of SendToAccountEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transferReqBody = null,
  }) {
    return _then(_$SendPaymentToOtherAccountImpl(
      transferReqBody: null == transferReqBody
          ? _value.transferReqBody
          : transferReqBody // ignore: cast_nullable_to_non_nullable
              as TransferReqBody,
    ));
  }

  /// Create a copy of SendToAccountEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TransferReqBodyCopyWith<$Res> get transferReqBody {
    return $TransferReqBodyCopyWith<$Res>(_value.transferReqBody, (value) {
      return _then(_value.copyWith(transferReqBody: value));
    });
  }
}

/// @nodoc

class _$SendPaymentToOtherAccountImpl implements _SendPaymentToOtherAccount {
  const _$SendPaymentToOtherAccountImpl({required this.transferReqBody});

  @override
  final TransferReqBody transferReqBody;

  @override
  String toString() {
    return 'SendToAccountEvent.sendPaymentToOtherAccount(transferReqBody: $transferReqBody)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendPaymentToOtherAccountImpl &&
            (identical(other.transferReqBody, transferReqBody) ||
                other.transferReqBody == transferReqBody));
  }

  @override
  int get hashCode => Object.hash(runtimeType, transferReqBody);

  /// Create a copy of SendToAccountEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SendPaymentToOtherAccountImplCopyWith<_$SendPaymentToOtherAccountImpl>
      get copyWith => __$$SendPaymentToOtherAccountImplCopyWithImpl<
          _$SendPaymentToOtherAccountImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String accountNumber) getNameOfUserByAccount,
    required TResult Function(TransferReqBody transferReqBody)
        sendPaymentToOtherAccount,
  }) {
    return sendPaymentToOtherAccount(transferReqBody);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String accountNumber)? getNameOfUserByAccount,
    TResult? Function(TransferReqBody transferReqBody)?
        sendPaymentToOtherAccount,
  }) {
    return sendPaymentToOtherAccount?.call(transferReqBody);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String accountNumber)? getNameOfUserByAccount,
    TResult Function(TransferReqBody transferReqBody)?
        sendPaymentToOtherAccount,
    required TResult orElse(),
  }) {
    if (sendPaymentToOtherAccount != null) {
      return sendPaymentToOtherAccount(transferReqBody);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetNameOfUserByAccountEvent value)
        getNameOfUserByAccount,
    required TResult Function(_SendPaymentToOtherAccount value)
        sendPaymentToOtherAccount,
  }) {
    return sendPaymentToOtherAccount(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetNameOfUserByAccountEvent value)?
        getNameOfUserByAccount,
    TResult? Function(_SendPaymentToOtherAccount value)?
        sendPaymentToOtherAccount,
  }) {
    return sendPaymentToOtherAccount?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetNameOfUserByAccountEvent value)?
        getNameOfUserByAccount,
    TResult Function(_SendPaymentToOtherAccount value)?
        sendPaymentToOtherAccount,
    required TResult orElse(),
  }) {
    if (sendPaymentToOtherAccount != null) {
      return sendPaymentToOtherAccount(this);
    }
    return orElse();
  }
}

abstract class _SendPaymentToOtherAccount implements SendToAccountEvent {
  const factory _SendPaymentToOtherAccount(
          {required final TransferReqBody transferReqBody}) =
      _$SendPaymentToOtherAccountImpl;

  TransferReqBody get transferReqBody;

  /// Create a copy of SendToAccountEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SendPaymentToOtherAccountImplCopyWith<_$SendPaymentToOtherAccountImpl>
      get copyWith => throw _privateConstructorUsedError;
}
