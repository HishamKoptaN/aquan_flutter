// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dash_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DashEvent<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() get,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? get,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? get,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Get<T> value) get,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Get<T> value)? get,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Get<T> value)? get,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashEventCopyWith<T, $Res> {
  factory $DashEventCopyWith(
          DashEvent<T> value, $Res Function(DashEvent<T>) then) =
      _$DashEventCopyWithImpl<T, $Res, DashEvent<T>>;
}

/// @nodoc
class _$DashEventCopyWithImpl<T, $Res, $Val extends DashEvent<T>>
    implements $DashEventCopyWith<T, $Res> {
  _$DashEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DashEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GetImplCopyWith<T, $Res> {
  factory _$$GetImplCopyWith(
          _$GetImpl<T> value, $Res Function(_$GetImpl<T>) then) =
      __$$GetImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$GetImplCopyWithImpl<T, $Res>
    extends _$DashEventCopyWithImpl<T, $Res, _$GetImpl<T>>
    implements _$$GetImplCopyWith<T, $Res> {
  __$$GetImplCopyWithImpl(
      _$GetImpl<T> _value, $Res Function(_$GetImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of DashEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetImpl<T> implements _Get<T> {
  const _$GetImpl();

  @override
  String toString() {
    return 'DashEvent<$T>.get()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() get,
  }) {
    return get();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? get,
  }) {
    return get?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? get,
    required TResult orElse(),
  }) {
    if (get != null) {
      return get();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Get<T> value) get,
  }) {
    return get(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Get<T> value)? get,
  }) {
    return get?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Get<T> value)? get,
    required TResult orElse(),
  }) {
    if (get != null) {
      return get(this);
    }
    return orElse();
  }
}

abstract class _Get<T> implements DashEvent<T> {
  const factory _Get() = _$GetImpl<T>;
}
