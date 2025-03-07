// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plans_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PlansState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Plan> plans) plansLoaded,
    required TResult Function(PlanRate planRate) plansRatesLoaded,
    required TResult Function() success,
    required TResult Function(ApiErrorModel apiErrorModel) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Plan> plans)? plansLoaded,
    TResult? Function(PlanRate planRate)? plansRatesLoaded,
    TResult? Function()? success,
    TResult? Function(ApiErrorModel apiErrorModel)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Plan> plans)? plansLoaded,
    TResult Function(PlanRate planRate)? plansRatesLoaded,
    TResult Function()? success,
    TResult Function(ApiErrorModel apiErrorModel)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_PlansLoaded value) plansLoaded,
    required TResult Function(_PlansRatesLoaded value) plansRatesLoaded,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_PlansLoaded value)? plansLoaded,
    TResult? Function(_PlansRatesLoaded value)? plansRatesLoaded,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_PlansLoaded value)? plansLoaded,
    TResult Function(_PlansRatesLoaded value)? plansRatesLoaded,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlansStateCopyWith<$Res> {
  factory $PlansStateCopyWith(
          PlansState value, $Res Function(PlansState) then) =
      _$PlansStateCopyWithImpl<$Res, PlansState>;
}

/// @nodoc
class _$PlansStateCopyWithImpl<$Res, $Val extends PlansState>
    implements $PlansStateCopyWith<$Res> {
  _$PlansStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlansState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$PlansStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlansState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'PlansState.initial()';
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
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Plan> plans) plansLoaded,
    required TResult Function(PlanRate planRate) plansRatesLoaded,
    required TResult Function() success,
    required TResult Function(ApiErrorModel apiErrorModel) failure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Plan> plans)? plansLoaded,
    TResult? Function(PlanRate planRate)? plansRatesLoaded,
    TResult? Function()? success,
    TResult? Function(ApiErrorModel apiErrorModel)? failure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Plan> plans)? plansLoaded,
    TResult Function(PlanRate planRate)? plansRatesLoaded,
    TResult Function()? success,
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
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_PlansLoaded value) plansLoaded,
    required TResult Function(_PlansRatesLoaded value) plansRatesLoaded,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_PlansLoaded value)? plansLoaded,
    TResult? Function(_PlansRatesLoaded value)? plansRatesLoaded,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_PlansLoaded value)? plansLoaded,
    TResult Function(_PlansRatesLoaded value)? plansRatesLoaded,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements PlansState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$PlansStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlansState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'PlansState.loading()';
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
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Plan> plans) plansLoaded,
    required TResult Function(PlanRate planRate) plansRatesLoaded,
    required TResult Function() success,
    required TResult Function(ApiErrorModel apiErrorModel) failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Plan> plans)? plansLoaded,
    TResult? Function(PlanRate planRate)? plansRatesLoaded,
    TResult? Function()? success,
    TResult? Function(ApiErrorModel apiErrorModel)? failure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Plan> plans)? plansLoaded,
    TResult Function(PlanRate planRate)? plansRatesLoaded,
    TResult Function()? success,
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
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_PlansLoaded value) plansLoaded,
    required TResult Function(_PlansRatesLoaded value) plansRatesLoaded,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_PlansLoaded value)? plansLoaded,
    TResult? Function(_PlansRatesLoaded value)? plansRatesLoaded,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_PlansLoaded value)? plansLoaded,
    TResult Function(_PlansRatesLoaded value)? plansRatesLoaded,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements PlansState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$PlansLoadedImplCopyWith<$Res> {
  factory _$$PlansLoadedImplCopyWith(
          _$PlansLoadedImpl value, $Res Function(_$PlansLoadedImpl) then) =
      __$$PlansLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Plan> plans});
}

/// @nodoc
class __$$PlansLoadedImplCopyWithImpl<$Res>
    extends _$PlansStateCopyWithImpl<$Res, _$PlansLoadedImpl>
    implements _$$PlansLoadedImplCopyWith<$Res> {
  __$$PlansLoadedImplCopyWithImpl(
      _$PlansLoadedImpl _value, $Res Function(_$PlansLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlansState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? plans = null,
  }) {
    return _then(_$PlansLoadedImpl(
      plans: null == plans
          ? _value._plans
          : plans // ignore: cast_nullable_to_non_nullable
              as List<Plan>,
    ));
  }
}

/// @nodoc

class _$PlansLoadedImpl implements _PlansLoaded {
  const _$PlansLoadedImpl({required final List<Plan> plans}) : _plans = plans;

  final List<Plan> _plans;
  @override
  List<Plan> get plans {
    if (_plans is EqualUnmodifiableListView) return _plans;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_plans);
  }

  @override
  String toString() {
    return 'PlansState.plansLoaded(plans: $plans)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlansLoadedImpl &&
            const DeepCollectionEquality().equals(other._plans, _plans));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_plans));

  /// Create a copy of PlansState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlansLoadedImplCopyWith<_$PlansLoadedImpl> get copyWith =>
      __$$PlansLoadedImplCopyWithImpl<_$PlansLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Plan> plans) plansLoaded,
    required TResult Function(PlanRate planRate) plansRatesLoaded,
    required TResult Function() success,
    required TResult Function(ApiErrorModel apiErrorModel) failure,
  }) {
    return plansLoaded(plans);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Plan> plans)? plansLoaded,
    TResult? Function(PlanRate planRate)? plansRatesLoaded,
    TResult? Function()? success,
    TResult? Function(ApiErrorModel apiErrorModel)? failure,
  }) {
    return plansLoaded?.call(plans);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Plan> plans)? plansLoaded,
    TResult Function(PlanRate planRate)? plansRatesLoaded,
    TResult Function()? success,
    TResult Function(ApiErrorModel apiErrorModel)? failure,
    required TResult orElse(),
  }) {
    if (plansLoaded != null) {
      return plansLoaded(plans);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_PlansLoaded value) plansLoaded,
    required TResult Function(_PlansRatesLoaded value) plansRatesLoaded,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
  }) {
    return plansLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_PlansLoaded value)? plansLoaded,
    TResult? Function(_PlansRatesLoaded value)? plansRatesLoaded,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
  }) {
    return plansLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_PlansLoaded value)? plansLoaded,
    TResult Function(_PlansRatesLoaded value)? plansRatesLoaded,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (plansLoaded != null) {
      return plansLoaded(this);
    }
    return orElse();
  }
}

abstract class _PlansLoaded implements PlansState {
  const factory _PlansLoaded({required final List<Plan> plans}) =
      _$PlansLoadedImpl;

  List<Plan> get plans;

  /// Create a copy of PlansState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlansLoadedImplCopyWith<_$PlansLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PlansRatesLoadedImplCopyWith<$Res> {
  factory _$$PlansRatesLoadedImplCopyWith(_$PlansRatesLoadedImpl value,
          $Res Function(_$PlansRatesLoadedImpl) then) =
      __$$PlansRatesLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PlanRate planRate});

  $PlanRateCopyWith<$Res> get planRate;
}

/// @nodoc
class __$$PlansRatesLoadedImplCopyWithImpl<$Res>
    extends _$PlansStateCopyWithImpl<$Res, _$PlansRatesLoadedImpl>
    implements _$$PlansRatesLoadedImplCopyWith<$Res> {
  __$$PlansRatesLoadedImplCopyWithImpl(_$PlansRatesLoadedImpl _value,
      $Res Function(_$PlansRatesLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlansState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? planRate = null,
  }) {
    return _then(_$PlansRatesLoadedImpl(
      planRate: null == planRate
          ? _value.planRate
          : planRate // ignore: cast_nullable_to_non_nullable
              as PlanRate,
    ));
  }

  /// Create a copy of PlansState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PlanRateCopyWith<$Res> get planRate {
    return $PlanRateCopyWith<$Res>(_value.planRate, (value) {
      return _then(_value.copyWith(planRate: value));
    });
  }
}

/// @nodoc

class _$PlansRatesLoadedImpl implements _PlansRatesLoaded {
  const _$PlansRatesLoadedImpl({required this.planRate});

  @override
  final PlanRate planRate;

  @override
  String toString() {
    return 'PlansState.plansRatesLoaded(planRate: $planRate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlansRatesLoadedImpl &&
            (identical(other.planRate, planRate) ||
                other.planRate == planRate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, planRate);

  /// Create a copy of PlansState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlansRatesLoadedImplCopyWith<_$PlansRatesLoadedImpl> get copyWith =>
      __$$PlansRatesLoadedImplCopyWithImpl<_$PlansRatesLoadedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Plan> plans) plansLoaded,
    required TResult Function(PlanRate planRate) plansRatesLoaded,
    required TResult Function() success,
    required TResult Function(ApiErrorModel apiErrorModel) failure,
  }) {
    return plansRatesLoaded(planRate);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Plan> plans)? plansLoaded,
    TResult? Function(PlanRate planRate)? plansRatesLoaded,
    TResult? Function()? success,
    TResult? Function(ApiErrorModel apiErrorModel)? failure,
  }) {
    return plansRatesLoaded?.call(planRate);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Plan> plans)? plansLoaded,
    TResult Function(PlanRate planRate)? plansRatesLoaded,
    TResult Function()? success,
    TResult Function(ApiErrorModel apiErrorModel)? failure,
    required TResult orElse(),
  }) {
    if (plansRatesLoaded != null) {
      return plansRatesLoaded(planRate);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_PlansLoaded value) plansLoaded,
    required TResult Function(_PlansRatesLoaded value) plansRatesLoaded,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
  }) {
    return plansRatesLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_PlansLoaded value)? plansLoaded,
    TResult? Function(_PlansRatesLoaded value)? plansRatesLoaded,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
  }) {
    return plansRatesLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_PlansLoaded value)? plansLoaded,
    TResult Function(_PlansRatesLoaded value)? plansRatesLoaded,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (plansRatesLoaded != null) {
      return plansRatesLoaded(this);
    }
    return orElse();
  }
}

abstract class _PlansRatesLoaded implements PlansState {
  const factory _PlansRatesLoaded({required final PlanRate planRate}) =
      _$PlansRatesLoadedImpl;

  PlanRate get planRate;

  /// Create a copy of PlansState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlansRatesLoadedImplCopyWith<_$PlansRatesLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$PlansStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlansState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl();

  @override
  String toString() {
    return 'PlansState.success()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Plan> plans) plansLoaded,
    required TResult Function(PlanRate planRate) plansRatesLoaded,
    required TResult Function() success,
    required TResult Function(ApiErrorModel apiErrorModel) failure,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Plan> plans)? plansLoaded,
    TResult? Function(PlanRate planRate)? plansRatesLoaded,
    TResult? Function()? success,
    TResult? Function(ApiErrorModel apiErrorModel)? failure,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Plan> plans)? plansLoaded,
    TResult Function(PlanRate planRate)? plansRatesLoaded,
    TResult Function()? success,
    TResult Function(ApiErrorModel apiErrorModel)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_PlansLoaded value) plansLoaded,
    required TResult Function(_PlansRatesLoaded value) plansRatesLoaded,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_PlansLoaded value)? plansLoaded,
    TResult? Function(_PlansRatesLoaded value)? plansRatesLoaded,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_PlansLoaded value)? plansLoaded,
    TResult Function(_PlansRatesLoaded value)? plansRatesLoaded,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements PlansState {
  const factory _Success() = _$SuccessImpl;
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
    extends _$PlansStateCopyWithImpl<$Res, _$FailureImpl>
    implements _$$FailureImplCopyWith<$Res> {
  __$$FailureImplCopyWithImpl(
      _$FailureImpl _value, $Res Function(_$FailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlansState
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
    return 'PlansState.failure(apiErrorModel: $apiErrorModel)';
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

  /// Create a copy of PlansState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FailureImplCopyWith<_$FailureImpl> get copyWith =>
      __$$FailureImplCopyWithImpl<_$FailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Plan> plans) plansLoaded,
    required TResult Function(PlanRate planRate) plansRatesLoaded,
    required TResult Function() success,
    required TResult Function(ApiErrorModel apiErrorModel) failure,
  }) {
    return failure(apiErrorModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Plan> plans)? plansLoaded,
    TResult? Function(PlanRate planRate)? plansRatesLoaded,
    TResult? Function()? success,
    TResult? Function(ApiErrorModel apiErrorModel)? failure,
  }) {
    return failure?.call(apiErrorModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Plan> plans)? plansLoaded,
    TResult Function(PlanRate planRate)? plansRatesLoaded,
    TResult Function()? success,
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
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_PlansLoaded value) plansLoaded,
    required TResult Function(_PlansRatesLoaded value) plansRatesLoaded,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_PlansLoaded value)? plansLoaded,
    TResult? Function(_PlansRatesLoaded value)? plansRatesLoaded,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_PlansLoaded value)? plansLoaded,
    TResult Function(_PlansRatesLoaded value)? plansRatesLoaded,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _Failure implements PlansState {
  const factory _Failure({required final ApiErrorModel apiErrorModel}) =
      _$FailureImpl;

  ApiErrorModel get apiErrorModel;

  /// Create a copy of PlansState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FailureImplCopyWith<_$FailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
