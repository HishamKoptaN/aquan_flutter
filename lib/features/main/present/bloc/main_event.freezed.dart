// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MainEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() check,
    required TResult Function(EditPassReqBodyModel editPassReqBodyModel)
        editPass,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? check,
    TResult? Function(EditPassReqBodyModel editPassReqBodyModel)? editPass,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? check,
    TResult Function(EditPassReqBodyModel editPassReqBodyModel)? editPass,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Check value) check,
    required TResult Function(_EditPass value) editPass,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Check value)? check,
    TResult? Function(_EditPass value)? editPass,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Check value)? check,
    TResult Function(_EditPass value)? editPass,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainEventCopyWith<$Res> {
  factory $MainEventCopyWith(MainEvent value, $Res Function(MainEvent) then) =
      _$MainEventCopyWithImpl<$Res, MainEvent>;
}

/// @nodoc
class _$MainEventCopyWithImpl<$Res, $Val extends MainEvent>
    implements $MainEventCopyWith<$Res> {
  _$MainEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MainEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$CheckImplCopyWith<$Res> {
  factory _$$CheckImplCopyWith(
          _$CheckImpl value, $Res Function(_$CheckImpl) then) =
      __$$CheckImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CheckImplCopyWithImpl<$Res>
    extends _$MainEventCopyWithImpl<$Res, _$CheckImpl>
    implements _$$CheckImplCopyWith<$Res> {
  __$$CheckImplCopyWithImpl(
      _$CheckImpl _value, $Res Function(_$CheckImpl) _then)
      : super(_value, _then);

  /// Create a copy of MainEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CheckImpl implements _Check {
  const _$CheckImpl();

  @override
  String toString() {
    return 'MainEvent.check()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CheckImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() check,
    required TResult Function(EditPassReqBodyModel editPassReqBodyModel)
        editPass,
  }) {
    return check();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? check,
    TResult? Function(EditPassReqBodyModel editPassReqBodyModel)? editPass,
  }) {
    return check?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? check,
    TResult Function(EditPassReqBodyModel editPassReqBodyModel)? editPass,
    required TResult orElse(),
  }) {
    if (check != null) {
      return check();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Check value) check,
    required TResult Function(_EditPass value) editPass,
  }) {
    return check(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Check value)? check,
    TResult? Function(_EditPass value)? editPass,
  }) {
    return check?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Check value)? check,
    TResult Function(_EditPass value)? editPass,
    required TResult orElse(),
  }) {
    if (check != null) {
      return check(this);
    }
    return orElse();
  }
}

abstract class _Check implements MainEvent {
  const factory _Check() = _$CheckImpl;
}

/// @nodoc
abstract class _$$EditPassImplCopyWith<$Res> {
  factory _$$EditPassImplCopyWith(
          _$EditPassImpl value, $Res Function(_$EditPassImpl) then) =
      __$$EditPassImplCopyWithImpl<$Res>;
  @useResult
  $Res call({EditPassReqBodyModel editPassReqBodyModel});

  $EditPassReqBodyModelCopyWith<$Res> get editPassReqBodyModel;
}

/// @nodoc
class __$$EditPassImplCopyWithImpl<$Res>
    extends _$MainEventCopyWithImpl<$Res, _$EditPassImpl>
    implements _$$EditPassImplCopyWith<$Res> {
  __$$EditPassImplCopyWithImpl(
      _$EditPassImpl _value, $Res Function(_$EditPassImpl) _then)
      : super(_value, _then);

  /// Create a copy of MainEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? editPassReqBodyModel = null,
  }) {
    return _then(_$EditPassImpl(
      editPassReqBodyModel: null == editPassReqBodyModel
          ? _value.editPassReqBodyModel
          : editPassReqBodyModel // ignore: cast_nullable_to_non_nullable
              as EditPassReqBodyModel,
    ));
  }

  /// Create a copy of MainEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EditPassReqBodyModelCopyWith<$Res> get editPassReqBodyModel {
    return $EditPassReqBodyModelCopyWith<$Res>(_value.editPassReqBodyModel,
        (value) {
      return _then(_value.copyWith(editPassReqBodyModel: value));
    });
  }
}

/// @nodoc

class _$EditPassImpl implements _EditPass {
  const _$EditPassImpl({required this.editPassReqBodyModel});

  @override
  final EditPassReqBodyModel editPassReqBodyModel;

  @override
  String toString() {
    return 'MainEvent.editPass(editPassReqBodyModel: $editPassReqBodyModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditPassImpl &&
            (identical(other.editPassReqBodyModel, editPassReqBodyModel) ||
                other.editPassReqBodyModel == editPassReqBodyModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, editPassReqBodyModel);

  /// Create a copy of MainEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EditPassImplCopyWith<_$EditPassImpl> get copyWith =>
      __$$EditPassImplCopyWithImpl<_$EditPassImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() check,
    required TResult Function(EditPassReqBodyModel editPassReqBodyModel)
        editPass,
  }) {
    return editPass(editPassReqBodyModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? check,
    TResult? Function(EditPassReqBodyModel editPassReqBodyModel)? editPass,
  }) {
    return editPass?.call(editPassReqBodyModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? check,
    TResult Function(EditPassReqBodyModel editPassReqBodyModel)? editPass,
    required TResult orElse(),
  }) {
    if (editPass != null) {
      return editPass(editPassReqBodyModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Check value) check,
    required TResult Function(_EditPass value) editPass,
  }) {
    return editPass(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Check value)? check,
    TResult? Function(_EditPass value)? editPass,
  }) {
    return editPass?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Check value)? check,
    TResult Function(_EditPass value)? editPass,
    required TResult orElse(),
  }) {
    if (editPass != null) {
      return editPass(this);
    }
    return orElse();
  }
}

abstract class _EditPass implements MainEvent {
  const factory _EditPass(
          {required final EditPassReqBodyModel editPassReqBodyModel}) =
      _$EditPassImpl;

  EditPassReqBodyModel get editPassReqBodyModel;

  /// Create a copy of MainEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EditPassImplCopyWith<_$EditPassImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
