// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_plan.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserPlan _$UserPlanFromJson(Map<String, dynamic> json) {
  return _UserPlan.fromJson(json);
}

/// @nodoc
mixin _$UserPlan {
  @JsonKey(name: "id")
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "user_id")
  int? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: "plan_id")
  int? get planId => throw _privateConstructorUsedError;
  @JsonKey(name: "upgraded_at")
  DateTime? get upgradedAt => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "updated_at")
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this UserPlan to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserPlan
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserPlanCopyWith<UserPlan> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserPlanCopyWith<$Res> {
  factory $UserPlanCopyWith(UserPlan value, $Res Function(UserPlan) then) =
      _$UserPlanCopyWithImpl<$Res, UserPlan>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "user_id") int? userId,
      @JsonKey(name: "plan_id") int? planId,
      @JsonKey(name: "upgraded_at") DateTime? upgradedAt,
      @JsonKey(name: "created_at") DateTime? createdAt,
      @JsonKey(name: "updated_at") DateTime? updatedAt});
}

/// @nodoc
class _$UserPlanCopyWithImpl<$Res, $Val extends UserPlan>
    implements $UserPlanCopyWith<$Res> {
  _$UserPlanCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserPlan
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? planId = freezed,
    Object? upgradedAt = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
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
      planId: freezed == planId
          ? _value.planId
          : planId // ignore: cast_nullable_to_non_nullable
              as int?,
      upgradedAt: freezed == upgradedAt
          ? _value.upgradedAt
          : upgradedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserPlanImplCopyWith<$Res>
    implements $UserPlanCopyWith<$Res> {
  factory _$$UserPlanImplCopyWith(
          _$UserPlanImpl value, $Res Function(_$UserPlanImpl) then) =
      __$$UserPlanImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "user_id") int? userId,
      @JsonKey(name: "plan_id") int? planId,
      @JsonKey(name: "upgraded_at") DateTime? upgradedAt,
      @JsonKey(name: "created_at") DateTime? createdAt,
      @JsonKey(name: "updated_at") DateTime? updatedAt});
}

/// @nodoc
class __$$UserPlanImplCopyWithImpl<$Res>
    extends _$UserPlanCopyWithImpl<$Res, _$UserPlanImpl>
    implements _$$UserPlanImplCopyWith<$Res> {
  __$$UserPlanImplCopyWithImpl(
      _$UserPlanImpl _value, $Res Function(_$UserPlanImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserPlan
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? planId = freezed,
    Object? upgradedAt = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$UserPlanImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      planId: freezed == planId
          ? _value.planId
          : planId // ignore: cast_nullable_to_non_nullable
              as int?,
      upgradedAt: freezed == upgradedAt
          ? _value.upgradedAt
          : upgradedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserPlanImpl implements _UserPlan {
  const _$UserPlanImpl(
      {@JsonKey(name: "id") this.id,
      @JsonKey(name: "user_id") this.userId,
      @JsonKey(name: "plan_id") this.planId,
      @JsonKey(name: "upgraded_at") this.upgradedAt,
      @JsonKey(name: "created_at") this.createdAt,
      @JsonKey(name: "updated_at") this.updatedAt});

  factory _$UserPlanImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserPlanImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final int? id;
  @override
  @JsonKey(name: "user_id")
  final int? userId;
  @override
  @JsonKey(name: "plan_id")
  final int? planId;
  @override
  @JsonKey(name: "upgraded_at")
  final DateTime? upgradedAt;
  @override
  @JsonKey(name: "created_at")
  final DateTime? createdAt;
  @override
  @JsonKey(name: "updated_at")
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'UserPlan(id: $id, userId: $userId, planId: $planId, upgradedAt: $upgradedAt, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserPlanImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.planId, planId) || other.planId == planId) &&
            (identical(other.upgradedAt, upgradedAt) ||
                other.upgradedAt == upgradedAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, userId, planId, upgradedAt, createdAt, updatedAt);

  /// Create a copy of UserPlan
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserPlanImplCopyWith<_$UserPlanImpl> get copyWith =>
      __$$UserPlanImplCopyWithImpl<_$UserPlanImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserPlanImplToJson(
      this,
    );
  }
}

abstract class _UserPlan implements UserPlan {
  const factory _UserPlan(
      {@JsonKey(name: "id") final int? id,
      @JsonKey(name: "user_id") final int? userId,
      @JsonKey(name: "plan_id") final int? planId,
      @JsonKey(name: "upgraded_at") final DateTime? upgradedAt,
      @JsonKey(name: "created_at") final DateTime? createdAt,
      @JsonKey(name: "updated_at") final DateTime? updatedAt}) = _$UserPlanImpl;

  factory _UserPlan.fromJson(Map<String, dynamic> json) =
      _$UserPlanImpl.fromJson;

  @override
  @JsonKey(name: "id")
  int? get id;
  @override
  @JsonKey(name: "user_id")
  int? get userId;
  @override
  @JsonKey(name: "plan_id")
  int? get planId;
  @override
  @JsonKey(name: "upgraded_at")
  DateTime? get upgradedAt;
  @override
  @JsonKey(name: "created_at")
  DateTime? get createdAt;
  @override
  @JsonKey(name: "updated_at")
  DateTime? get updatedAt;

  /// Create a copy of UserPlan
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserPlanImplCopyWith<_$UserPlanImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
