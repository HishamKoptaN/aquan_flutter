// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notifications_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NotificationsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getNotifications,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getNotifications,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getNotifications,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetNotifications value) getNotifications,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetNotifications value)? getNotifications,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetNotifications value)? getNotifications,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationsEventCopyWith<$Res> {
  factory $NotificationsEventCopyWith(
          NotificationsEvent value, $Res Function(NotificationsEvent) then) =
      _$NotificationsEventCopyWithImpl<$Res, NotificationsEvent>;
}

/// @nodoc
class _$NotificationsEventCopyWithImpl<$Res, $Val extends NotificationsEvent>
    implements $NotificationsEventCopyWith<$Res> {
  _$NotificationsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NotificationsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GetNotificationsImplCopyWith<$Res> {
  factory _$$GetNotificationsImplCopyWith(_$GetNotificationsImpl value,
          $Res Function(_$GetNotificationsImpl) then) =
      __$$GetNotificationsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetNotificationsImplCopyWithImpl<$Res>
    extends _$NotificationsEventCopyWithImpl<$Res, _$GetNotificationsImpl>
    implements _$$GetNotificationsImplCopyWith<$Res> {
  __$$GetNotificationsImplCopyWithImpl(_$GetNotificationsImpl _value,
      $Res Function(_$GetNotificationsImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetNotificationsImpl implements _GetNotifications {
  const _$GetNotificationsImpl();

  @override
  String toString() {
    return 'NotificationsEvent.getNotifications()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetNotificationsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getNotifications,
  }) {
    return getNotifications();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getNotifications,
  }) {
    return getNotifications?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getNotifications,
    required TResult orElse(),
  }) {
    if (getNotifications != null) {
      return getNotifications();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetNotifications value) getNotifications,
  }) {
    return getNotifications(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetNotifications value)? getNotifications,
  }) {
    return getNotifications?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetNotifications value)? getNotifications,
    required TResult orElse(),
  }) {
    if (getNotifications != null) {
      return getNotifications(this);
    }
    return orElse();
  }
}

abstract class _GetNotifications implements NotificationsEvent {
  const factory _GetNotifications() = _$GetNotificationsImpl;
}
