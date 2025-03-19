// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'section_res_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SectionResModel _$SectionResModelFromJson(Map<String, dynamic> json) {
  return _SectionResModel.fromJson(json);
}

/// @nodoc
mixin _$SectionResModel {
  @JsonKey(name: "status")
  bool? get status => throw _privateConstructorUsedError;
  @JsonKey(name: "message")
  String? get message => throw _privateConstructorUsedError;

  /// Serializes this SectionResModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SectionResModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SectionResModelCopyWith<SectionResModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SectionResModelCopyWith<$Res> {
  factory $SectionResModelCopyWith(
          SectionResModel value, $Res Function(SectionResModel) then) =
      _$SectionResModelCopyWithImpl<$Res, SectionResModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "status") bool? status,
      @JsonKey(name: "message") String? message});
}

/// @nodoc
class _$SectionResModelCopyWithImpl<$Res, $Val extends SectionResModel>
    implements $SectionResModelCopyWith<$Res> {
  _$SectionResModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SectionResModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SectionResModelImplCopyWith<$Res>
    implements $SectionResModelCopyWith<$Res> {
  factory _$$SectionResModelImplCopyWith(_$SectionResModelImpl value,
          $Res Function(_$SectionResModelImpl) then) =
      __$$SectionResModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "status") bool? status,
      @JsonKey(name: "message") String? message});
}

/// @nodoc
class __$$SectionResModelImplCopyWithImpl<$Res>
    extends _$SectionResModelCopyWithImpl<$Res, _$SectionResModelImpl>
    implements _$$SectionResModelImplCopyWith<$Res> {
  __$$SectionResModelImplCopyWithImpl(
      _$SectionResModelImpl _value, $Res Function(_$SectionResModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SectionResModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
  }) {
    return _then(_$SectionResModelImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SectionResModelImpl implements _SectionResModel {
  const _$SectionResModelImpl(
      {@JsonKey(name: "status") this.status,
      @JsonKey(name: "message") this.message});

  factory _$SectionResModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SectionResModelImplFromJson(json);

  @override
  @JsonKey(name: "status")
  final bool? status;
  @override
  @JsonKey(name: "message")
  final String? message;

  @override
  String toString() {
    return 'SectionResModel(status: $status, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SectionResModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message);

  /// Create a copy of SectionResModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SectionResModelImplCopyWith<_$SectionResModelImpl> get copyWith =>
      __$$SectionResModelImplCopyWithImpl<_$SectionResModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SectionResModelImplToJson(
      this,
    );
  }
}

abstract class _SectionResModel implements SectionResModel {
  const factory _SectionResModel(
      {@JsonKey(name: "status") final bool? status,
      @JsonKey(name: "message") final String? message}) = _$SectionResModelImpl;

  factory _SectionResModel.fromJson(Map<String, dynamic> json) =
      _$SectionResModelImpl.fromJson;

  @override
  @JsonKey(name: "status")
  bool? get status;
  @override
  @JsonKey(name: "message")
  String? get message;

  /// Create a copy of SectionResModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SectionResModelImplCopyWith<_$SectionResModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
