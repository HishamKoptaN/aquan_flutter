// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'send_to_account_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SendToAccountState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() initial,
    required TResult Function() amountSentSuccessfully,
    required TResult Function(
            UsernameByAccountResModel usernameByAccountResModel)
        userNameLoaded,
    required TResult Function(ApiErrorModel apiErrorModel) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? initial,
    TResult? Function()? amountSentSuccessfully,
    TResult? Function(UsernameByAccountResModel usernameByAccountResModel)?
        userNameLoaded,
    TResult? Function(ApiErrorModel apiErrorModel)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? initial,
    TResult Function()? amountSentSuccessfully,
    TResult Function(UsernameByAccountResModel usernameByAccountResModel)?
        userNameLoaded,
    TResult Function(ApiErrorModel apiErrorModel)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Loading value) loading,
    required TResult Function(Initial value) initial,
    required TResult Function(AmountSentSuccessfully value)
        amountSentSuccessfully,
    required TResult Function(UserNameLoaded value) userNameLoaded,
    required TResult Function(_Failure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Loading value)? loading,
    TResult? Function(Initial value)? initial,
    TResult? Function(AmountSentSuccessfully value)? amountSentSuccessfully,
    TResult? Function(UserNameLoaded value)? userNameLoaded,
    TResult? Function(_Failure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loading value)? loading,
    TResult Function(Initial value)? initial,
    TResult Function(AmountSentSuccessfully value)? amountSentSuccessfully,
    TResult Function(UserNameLoaded value)? userNameLoaded,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SendToAccountStateCopyWith<$Res> {
  factory $SendToAccountStateCopyWith(
          SendToAccountState value, $Res Function(SendToAccountState) then) =
      _$SendToAccountStateCopyWithImpl<$Res, SendToAccountState>;
}

/// @nodoc
class _$SendToAccountStateCopyWithImpl<$Res, $Val extends SendToAccountState>
    implements $SendToAccountStateCopyWith<$Res> {
  _$SendToAccountStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SendToAccountState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$SendToAccountStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of SendToAccountState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'SendToAccountState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() initial,
    required TResult Function() amountSentSuccessfully,
    required TResult Function(
            UsernameByAccountResModel usernameByAccountResModel)
        userNameLoaded,
    required TResult Function(ApiErrorModel apiErrorModel) failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? initial,
    TResult? Function()? amountSentSuccessfully,
    TResult? Function(UsernameByAccountResModel usernameByAccountResModel)?
        userNameLoaded,
    TResult? Function(ApiErrorModel apiErrorModel)? failure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? initial,
    TResult Function()? amountSentSuccessfully,
    TResult Function(UsernameByAccountResModel usernameByAccountResModel)?
        userNameLoaded,
    TResult Function(ApiErrorModel apiErrorModel)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Loading value) loading,
    required TResult Function(Initial value) initial,
    required TResult Function(AmountSentSuccessfully value)
        amountSentSuccessfully,
    required TResult Function(UserNameLoaded value) userNameLoaded,
    required TResult Function(_Failure value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Loading value)? loading,
    TResult? Function(Initial value)? initial,
    TResult? Function(AmountSentSuccessfully value)? amountSentSuccessfully,
    TResult? Function(UserNameLoaded value)? userNameLoaded,
    TResult? Function(_Failure value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loading value)? loading,
    TResult Function(Initial value)? initial,
    TResult Function(AmountSentSuccessfully value)? amountSentSuccessfully,
    TResult Function(UserNameLoaded value)? userNameLoaded,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements SendToAccountState {
  const factory Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$SendToAccountStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of SendToAccountState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'SendToAccountState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() initial,
    required TResult Function() amountSentSuccessfully,
    required TResult Function(
            UsernameByAccountResModel usernameByAccountResModel)
        userNameLoaded,
    required TResult Function(ApiErrorModel apiErrorModel) failure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? initial,
    TResult? Function()? amountSentSuccessfully,
    TResult? Function(UsernameByAccountResModel usernameByAccountResModel)?
        userNameLoaded,
    TResult? Function(ApiErrorModel apiErrorModel)? failure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? initial,
    TResult Function()? amountSentSuccessfully,
    TResult Function(UsernameByAccountResModel usernameByAccountResModel)?
        userNameLoaded,
    TResult Function(ApiErrorModel apiErrorModel)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Loading value) loading,
    required TResult Function(Initial value) initial,
    required TResult Function(AmountSentSuccessfully value)
        amountSentSuccessfully,
    required TResult Function(UserNameLoaded value) userNameLoaded,
    required TResult Function(_Failure value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Loading value)? loading,
    TResult? Function(Initial value)? initial,
    TResult? Function(AmountSentSuccessfully value)? amountSentSuccessfully,
    TResult? Function(UserNameLoaded value)? userNameLoaded,
    TResult? Function(_Failure value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loading value)? loading,
    TResult Function(Initial value)? initial,
    TResult Function(AmountSentSuccessfully value)? amountSentSuccessfully,
    TResult Function(UserNameLoaded value)? userNameLoaded,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements SendToAccountState {
  const factory Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$AmountSentSuccessfullyImplCopyWith<$Res> {
  factory _$$AmountSentSuccessfullyImplCopyWith(
          _$AmountSentSuccessfullyImpl value,
          $Res Function(_$AmountSentSuccessfullyImpl) then) =
      __$$AmountSentSuccessfullyImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AmountSentSuccessfullyImplCopyWithImpl<$Res>
    extends _$SendToAccountStateCopyWithImpl<$Res, _$AmountSentSuccessfullyImpl>
    implements _$$AmountSentSuccessfullyImplCopyWith<$Res> {
  __$$AmountSentSuccessfullyImplCopyWithImpl(
      _$AmountSentSuccessfullyImpl _value,
      $Res Function(_$AmountSentSuccessfullyImpl) _then)
      : super(_value, _then);

  /// Create a copy of SendToAccountState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AmountSentSuccessfullyImpl implements AmountSentSuccessfully {
  const _$AmountSentSuccessfullyImpl();

  @override
  String toString() {
    return 'SendToAccountState.amountSentSuccessfully()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AmountSentSuccessfullyImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() initial,
    required TResult Function() amountSentSuccessfully,
    required TResult Function(
            UsernameByAccountResModel usernameByAccountResModel)
        userNameLoaded,
    required TResult Function(ApiErrorModel apiErrorModel) failure,
  }) {
    return amountSentSuccessfully();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? initial,
    TResult? Function()? amountSentSuccessfully,
    TResult? Function(UsernameByAccountResModel usernameByAccountResModel)?
        userNameLoaded,
    TResult? Function(ApiErrorModel apiErrorModel)? failure,
  }) {
    return amountSentSuccessfully?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? initial,
    TResult Function()? amountSentSuccessfully,
    TResult Function(UsernameByAccountResModel usernameByAccountResModel)?
        userNameLoaded,
    TResult Function(ApiErrorModel apiErrorModel)? failure,
    required TResult orElse(),
  }) {
    if (amountSentSuccessfully != null) {
      return amountSentSuccessfully();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Loading value) loading,
    required TResult Function(Initial value) initial,
    required TResult Function(AmountSentSuccessfully value)
        amountSentSuccessfully,
    required TResult Function(UserNameLoaded value) userNameLoaded,
    required TResult Function(_Failure value) failure,
  }) {
    return amountSentSuccessfully(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Loading value)? loading,
    TResult? Function(Initial value)? initial,
    TResult? Function(AmountSentSuccessfully value)? amountSentSuccessfully,
    TResult? Function(UserNameLoaded value)? userNameLoaded,
    TResult? Function(_Failure value)? failure,
  }) {
    return amountSentSuccessfully?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loading value)? loading,
    TResult Function(Initial value)? initial,
    TResult Function(AmountSentSuccessfully value)? amountSentSuccessfully,
    TResult Function(UserNameLoaded value)? userNameLoaded,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (amountSentSuccessfully != null) {
      return amountSentSuccessfully(this);
    }
    return orElse();
  }
}

abstract class AmountSentSuccessfully implements SendToAccountState {
  const factory AmountSentSuccessfully() = _$AmountSentSuccessfullyImpl;
}

/// @nodoc
abstract class _$$UserNameLoadedImplCopyWith<$Res> {
  factory _$$UserNameLoadedImplCopyWith(_$UserNameLoadedImpl value,
          $Res Function(_$UserNameLoadedImpl) then) =
      __$$UserNameLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UsernameByAccountResModel usernameByAccountResModel});

  $UsernameByAccountResModelCopyWith<$Res> get usernameByAccountResModel;
}

/// @nodoc
class __$$UserNameLoadedImplCopyWithImpl<$Res>
    extends _$SendToAccountStateCopyWithImpl<$Res, _$UserNameLoadedImpl>
    implements _$$UserNameLoadedImplCopyWith<$Res> {
  __$$UserNameLoadedImplCopyWithImpl(
      _$UserNameLoadedImpl _value, $Res Function(_$UserNameLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of SendToAccountState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? usernameByAccountResModel = null,
  }) {
    return _then(_$UserNameLoadedImpl(
      usernameByAccountResModel: null == usernameByAccountResModel
          ? _value.usernameByAccountResModel
          : usernameByAccountResModel // ignore: cast_nullable_to_non_nullable
              as UsernameByAccountResModel,
    ));
  }

  /// Create a copy of SendToAccountState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UsernameByAccountResModelCopyWith<$Res> get usernameByAccountResModel {
    return $UsernameByAccountResModelCopyWith<$Res>(
        _value.usernameByAccountResModel, (value) {
      return _then(_value.copyWith(usernameByAccountResModel: value));
    });
  }
}

/// @nodoc

class _$UserNameLoadedImpl implements UserNameLoaded {
  const _$UserNameLoadedImpl({required this.usernameByAccountResModel});

  @override
  final UsernameByAccountResModel usernameByAccountResModel;

  @override
  String toString() {
    return 'SendToAccountState.userNameLoaded(usernameByAccountResModel: $usernameByAccountResModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserNameLoadedImpl &&
            (identical(other.usernameByAccountResModel,
                    usernameByAccountResModel) ||
                other.usernameByAccountResModel == usernameByAccountResModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, usernameByAccountResModel);

  /// Create a copy of SendToAccountState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserNameLoadedImplCopyWith<_$UserNameLoadedImpl> get copyWith =>
      __$$UserNameLoadedImplCopyWithImpl<_$UserNameLoadedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() initial,
    required TResult Function() amountSentSuccessfully,
    required TResult Function(
            UsernameByAccountResModel usernameByAccountResModel)
        userNameLoaded,
    required TResult Function(ApiErrorModel apiErrorModel) failure,
  }) {
    return userNameLoaded(usernameByAccountResModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? initial,
    TResult? Function()? amountSentSuccessfully,
    TResult? Function(UsernameByAccountResModel usernameByAccountResModel)?
        userNameLoaded,
    TResult? Function(ApiErrorModel apiErrorModel)? failure,
  }) {
    return userNameLoaded?.call(usernameByAccountResModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? initial,
    TResult Function()? amountSentSuccessfully,
    TResult Function(UsernameByAccountResModel usernameByAccountResModel)?
        userNameLoaded,
    TResult Function(ApiErrorModel apiErrorModel)? failure,
    required TResult orElse(),
  }) {
    if (userNameLoaded != null) {
      return userNameLoaded(usernameByAccountResModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Loading value) loading,
    required TResult Function(Initial value) initial,
    required TResult Function(AmountSentSuccessfully value)
        amountSentSuccessfully,
    required TResult Function(UserNameLoaded value) userNameLoaded,
    required TResult Function(_Failure value) failure,
  }) {
    return userNameLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Loading value)? loading,
    TResult? Function(Initial value)? initial,
    TResult? Function(AmountSentSuccessfully value)? amountSentSuccessfully,
    TResult? Function(UserNameLoaded value)? userNameLoaded,
    TResult? Function(_Failure value)? failure,
  }) {
    return userNameLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loading value)? loading,
    TResult Function(Initial value)? initial,
    TResult Function(AmountSentSuccessfully value)? amountSentSuccessfully,
    TResult Function(UserNameLoaded value)? userNameLoaded,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (userNameLoaded != null) {
      return userNameLoaded(this);
    }
    return orElse();
  }
}

abstract class UserNameLoaded implements SendToAccountState {
  const factory UserNameLoaded(
      {required final UsernameByAccountResModel
          usernameByAccountResModel}) = _$UserNameLoadedImpl;

  UsernameByAccountResModel get usernameByAccountResModel;

  /// Create a copy of SendToAccountState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserNameLoadedImplCopyWith<_$UserNameLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FailureImplCopyWith<$Res> {
  factory _$$FailureImplCopyWith(
          _$FailureImpl value, $Res Function(_$FailureImpl) then) =
      __$$FailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ApiErrorModel apiErrorModel});
}

/// @nodoc
class __$$FailureImplCopyWithImpl<$Res>
    extends _$SendToAccountStateCopyWithImpl<$Res, _$FailureImpl>
    implements _$$FailureImplCopyWith<$Res> {
  __$$FailureImplCopyWithImpl(
      _$FailureImpl _value, $Res Function(_$FailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of SendToAccountState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? apiErrorModel = null,
  }) {
    return _then(_$FailureImpl(
      apiErrorModel: null == apiErrorModel
          ? _value.apiErrorModel
          : apiErrorModel // ignore: cast_nullable_to_non_nullable
              as ApiErrorModel,
    ));
  }
}

/// @nodoc

class _$FailureImpl implements _Failure {
  const _$FailureImpl({required this.apiErrorModel});

  @override
  final ApiErrorModel apiErrorModel;

  @override
  String toString() {
    return 'SendToAccountState.failure(apiErrorModel: $apiErrorModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailureImpl &&
            (identical(other.apiErrorModel, apiErrorModel) ||
                other.apiErrorModel == apiErrorModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, apiErrorModel);

  /// Create a copy of SendToAccountState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FailureImplCopyWith<_$FailureImpl> get copyWith =>
      __$$FailureImplCopyWithImpl<_$FailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() initial,
    required TResult Function() amountSentSuccessfully,
    required TResult Function(
            UsernameByAccountResModel usernameByAccountResModel)
        userNameLoaded,
    required TResult Function(ApiErrorModel apiErrorModel) failure,
  }) {
    return failure(apiErrorModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? initial,
    TResult? Function()? amountSentSuccessfully,
    TResult? Function(UsernameByAccountResModel usernameByAccountResModel)?
        userNameLoaded,
    TResult? Function(ApiErrorModel apiErrorModel)? failure,
  }) {
    return failure?.call(apiErrorModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? initial,
    TResult Function()? amountSentSuccessfully,
    TResult Function(UsernameByAccountResModel usernameByAccountResModel)?
        userNameLoaded,
    TResult Function(ApiErrorModel apiErrorModel)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(apiErrorModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Loading value) loading,
    required TResult Function(Initial value) initial,
    required TResult Function(AmountSentSuccessfully value)
        amountSentSuccessfully,
    required TResult Function(UserNameLoaded value) userNameLoaded,
    required TResult Function(_Failure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Loading value)? loading,
    TResult? Function(Initial value)? initial,
    TResult? Function(AmountSentSuccessfully value)? amountSentSuccessfully,
    TResult? Function(UserNameLoaded value)? userNameLoaded,
    TResult? Function(_Failure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loading value)? loading,
    TResult Function(Initial value)? initial,
    TResult Function(AmountSentSuccessfully value)? amountSentSuccessfully,
    TResult Function(UserNameLoaded value)? userNameLoaded,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _Failure implements SendToAccountState {
  const factory _Failure({required final ApiErrorModel apiErrorModel}) =
      _$FailureImpl;

  ApiErrorModel get apiErrorModel;

  /// Create a copy of SendToAccountState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FailureImplCopyWith<_$FailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
