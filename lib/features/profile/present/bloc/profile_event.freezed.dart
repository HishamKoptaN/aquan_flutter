// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProfileEvent {
  FormData get formData => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(FormData formData) editProfile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(FormData formData)? editProfile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(FormData formData)? editProfile,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_editProfile value) editProfile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_editProfile value)? editProfile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_editProfile value)? editProfile,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfileEventCopyWith<ProfileEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileEventCopyWith<$Res> {
  factory $ProfileEventCopyWith(
          ProfileEvent value, $Res Function(ProfileEvent) then) =
      _$ProfileEventCopyWithImpl<$Res, ProfileEvent>;
  @useResult
  $Res call({FormData formData});
}

/// @nodoc
class _$ProfileEventCopyWithImpl<$Res, $Val extends ProfileEvent>
    implements $ProfileEventCopyWith<$Res> {
  _$ProfileEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? formData = null,
  }) {
    return _then(_value.copyWith(
      formData: null == formData
          ? _value.formData
          : formData // ignore: cast_nullable_to_non_nullable
              as FormData,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$editProfileImplCopyWith<$Res>
    implements $ProfileEventCopyWith<$Res> {
  factory _$$editProfileImplCopyWith(
          _$editProfileImpl value, $Res Function(_$editProfileImpl) then) =
      __$$editProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({FormData formData});
}

/// @nodoc
class __$$editProfileImplCopyWithImpl<$Res>
    extends _$ProfileEventCopyWithImpl<$Res, _$editProfileImpl>
    implements _$$editProfileImplCopyWith<$Res> {
  __$$editProfileImplCopyWithImpl(
      _$editProfileImpl _value, $Res Function(_$editProfileImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? formData = null,
  }) {
    return _then(_$editProfileImpl(
      formData: null == formData
          ? _value.formData
          : formData // ignore: cast_nullable_to_non_nullable
              as FormData,
    ));
  }
}

/// @nodoc

class _$editProfileImpl implements _editProfile {
  const _$editProfileImpl({required this.formData});

  @override
  final FormData formData;

  @override
  String toString() {
    return 'ProfileEvent.editProfile(formData: $formData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$editProfileImpl &&
            (identical(other.formData, formData) ||
                other.formData == formData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, formData);

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$editProfileImplCopyWith<_$editProfileImpl> get copyWith =>
      __$$editProfileImplCopyWithImpl<_$editProfileImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(FormData formData) editProfile,
  }) {
    return editProfile(formData);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(FormData formData)? editProfile,
  }) {
    return editProfile?.call(formData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(FormData formData)? editProfile,
    required TResult orElse(),
  }) {
    if (editProfile != null) {
      return editProfile(formData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_editProfile value) editProfile,
  }) {
    return editProfile(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_editProfile value)? editProfile,
  }) {
    return editProfile?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_editProfile value)? editProfile,
    required TResult orElse(),
  }) {
    if (editProfile != null) {
      return editProfile(this);
    }
    return orElse();
  }
}

abstract class _editProfile implements ProfileEvent {
  const factory _editProfile({required final FormData formData}) =
      _$editProfileImpl;

  @override
  FormData get formData;

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$editProfileImplCopyWith<_$editProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
