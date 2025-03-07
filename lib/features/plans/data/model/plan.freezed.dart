// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plan.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Plan _$PlanFromJson(Map<String, dynamic> json) {
  return _Plan.fromJson(json);
}

/// @nodoc
mixin _$Plan {
  @JsonKey(name: "id")
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "name")
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: "amount")
  int? get amount => throw _privateConstructorUsedError;
  @JsonKey(name: "user_amount_per_referal")
  int? get userAmountPerReferal => throw _privateConstructorUsedError;
  @JsonKey(name: "refered_amount")
  int? get referedAmount => throw _privateConstructorUsedError;
  @JsonKey(name: "amount_after_count")
  int? get amountAfterCount => throw _privateConstructorUsedError;
  @JsonKey(name: "count")
  int? get count => throw _privateConstructorUsedError;
  @JsonKey(name: "transfer_commission")
  double? get transferCommission => throw _privateConstructorUsedError;
  @JsonKey(name: "discount")
  int? get discount => throw _privateConstructorUsedError;
  @JsonKey(name: "discount_type")
  String? get discountType => throw _privateConstructorUsedError;
  @JsonKey(name: "daily_transfer_count")
  int? get dailyTransferCount => throw _privateConstructorUsedError;
  @JsonKey(name: "monthly_transfer_count")
  int? get monthlyTransferCount => throw _privateConstructorUsedError;
  @JsonKey(name: "max_transfer_count")
  int? get maxTransferCount => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "updated_at")
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Plan to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Plan
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlanCopyWith<Plan> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlanCopyWith<$Res> {
  factory $PlanCopyWith(Plan value, $Res Function(Plan) then) =
      _$PlanCopyWithImpl<$Res, Plan>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "name") String? name,
      @JsonKey(name: "amount") int? amount,
      @JsonKey(name: "user_amount_per_referal") int? userAmountPerReferal,
      @JsonKey(name: "refered_amount") int? referedAmount,
      @JsonKey(name: "amount_after_count") int? amountAfterCount,
      @JsonKey(name: "count") int? count,
      @JsonKey(name: "transfer_commission") double? transferCommission,
      @JsonKey(name: "discount") int? discount,
      @JsonKey(name: "discount_type") String? discountType,
      @JsonKey(name: "daily_transfer_count") int? dailyTransferCount,
      @JsonKey(name: "monthly_transfer_count") int? monthlyTransferCount,
      @JsonKey(name: "max_transfer_count") int? maxTransferCount,
      @JsonKey(name: "created_at") DateTime? createdAt,
      @JsonKey(name: "updated_at") DateTime? updatedAt});
}

/// @nodoc
class _$PlanCopyWithImpl<$Res, $Val extends Plan>
    implements $PlanCopyWith<$Res> {
  _$PlanCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Plan
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? amount = freezed,
    Object? userAmountPerReferal = freezed,
    Object? referedAmount = freezed,
    Object? amountAfterCount = freezed,
    Object? count = freezed,
    Object? transferCommission = freezed,
    Object? discount = freezed,
    Object? discountType = freezed,
    Object? dailyTransferCount = freezed,
    Object? monthlyTransferCount = freezed,
    Object? maxTransferCount = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
      userAmountPerReferal: freezed == userAmountPerReferal
          ? _value.userAmountPerReferal
          : userAmountPerReferal // ignore: cast_nullable_to_non_nullable
              as int?,
      referedAmount: freezed == referedAmount
          ? _value.referedAmount
          : referedAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      amountAfterCount: freezed == amountAfterCount
          ? _value.amountAfterCount
          : amountAfterCount // ignore: cast_nullable_to_non_nullable
              as int?,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      transferCommission: freezed == transferCommission
          ? _value.transferCommission
          : transferCommission // ignore: cast_nullable_to_non_nullable
              as double?,
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as int?,
      discountType: freezed == discountType
          ? _value.discountType
          : discountType // ignore: cast_nullable_to_non_nullable
              as String?,
      dailyTransferCount: freezed == dailyTransferCount
          ? _value.dailyTransferCount
          : dailyTransferCount // ignore: cast_nullable_to_non_nullable
              as int?,
      monthlyTransferCount: freezed == monthlyTransferCount
          ? _value.monthlyTransferCount
          : monthlyTransferCount // ignore: cast_nullable_to_non_nullable
              as int?,
      maxTransferCount: freezed == maxTransferCount
          ? _value.maxTransferCount
          : maxTransferCount // ignore: cast_nullable_to_non_nullable
              as int?,
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
abstract class _$$PlanImplCopyWith<$Res> implements $PlanCopyWith<$Res> {
  factory _$$PlanImplCopyWith(
          _$PlanImpl value, $Res Function(_$PlanImpl) then) =
      __$$PlanImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "name") String? name,
      @JsonKey(name: "amount") int? amount,
      @JsonKey(name: "user_amount_per_referal") int? userAmountPerReferal,
      @JsonKey(name: "refered_amount") int? referedAmount,
      @JsonKey(name: "amount_after_count") int? amountAfterCount,
      @JsonKey(name: "count") int? count,
      @JsonKey(name: "transfer_commission") double? transferCommission,
      @JsonKey(name: "discount") int? discount,
      @JsonKey(name: "discount_type") String? discountType,
      @JsonKey(name: "daily_transfer_count") int? dailyTransferCount,
      @JsonKey(name: "monthly_transfer_count") int? monthlyTransferCount,
      @JsonKey(name: "max_transfer_count") int? maxTransferCount,
      @JsonKey(name: "created_at") DateTime? createdAt,
      @JsonKey(name: "updated_at") DateTime? updatedAt});
}

/// @nodoc
class __$$PlanImplCopyWithImpl<$Res>
    extends _$PlanCopyWithImpl<$Res, _$PlanImpl>
    implements _$$PlanImplCopyWith<$Res> {
  __$$PlanImplCopyWithImpl(_$PlanImpl _value, $Res Function(_$PlanImpl) _then)
      : super(_value, _then);

  /// Create a copy of Plan
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? amount = freezed,
    Object? userAmountPerReferal = freezed,
    Object? referedAmount = freezed,
    Object? amountAfterCount = freezed,
    Object? count = freezed,
    Object? transferCommission = freezed,
    Object? discount = freezed,
    Object? discountType = freezed,
    Object? dailyTransferCount = freezed,
    Object? monthlyTransferCount = freezed,
    Object? maxTransferCount = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$PlanImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
      userAmountPerReferal: freezed == userAmountPerReferal
          ? _value.userAmountPerReferal
          : userAmountPerReferal // ignore: cast_nullable_to_non_nullable
              as int?,
      referedAmount: freezed == referedAmount
          ? _value.referedAmount
          : referedAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      amountAfterCount: freezed == amountAfterCount
          ? _value.amountAfterCount
          : amountAfterCount // ignore: cast_nullable_to_non_nullable
              as int?,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      transferCommission: freezed == transferCommission
          ? _value.transferCommission
          : transferCommission // ignore: cast_nullable_to_non_nullable
              as double?,
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as int?,
      discountType: freezed == discountType
          ? _value.discountType
          : discountType // ignore: cast_nullable_to_non_nullable
              as String?,
      dailyTransferCount: freezed == dailyTransferCount
          ? _value.dailyTransferCount
          : dailyTransferCount // ignore: cast_nullable_to_non_nullable
              as int?,
      monthlyTransferCount: freezed == monthlyTransferCount
          ? _value.monthlyTransferCount
          : monthlyTransferCount // ignore: cast_nullable_to_non_nullable
              as int?,
      maxTransferCount: freezed == maxTransferCount
          ? _value.maxTransferCount
          : maxTransferCount // ignore: cast_nullable_to_non_nullable
              as int?,
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
class _$PlanImpl implements _Plan {
  const _$PlanImpl(
      {@JsonKey(name: "id") this.id,
      @JsonKey(name: "name") this.name,
      @JsonKey(name: "amount") this.amount,
      @JsonKey(name: "user_amount_per_referal") this.userAmountPerReferal,
      @JsonKey(name: "refered_amount") this.referedAmount,
      @JsonKey(name: "amount_after_count") this.amountAfterCount,
      @JsonKey(name: "count") this.count,
      @JsonKey(name: "transfer_commission") this.transferCommission,
      @JsonKey(name: "discount") this.discount,
      @JsonKey(name: "discount_type") this.discountType,
      @JsonKey(name: "daily_transfer_count") this.dailyTransferCount,
      @JsonKey(name: "monthly_transfer_count") this.monthlyTransferCount,
      @JsonKey(name: "max_transfer_count") this.maxTransferCount,
      @JsonKey(name: "created_at") this.createdAt,
      @JsonKey(name: "updated_at") this.updatedAt});

  factory _$PlanImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlanImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final int? id;
  @override
  @JsonKey(name: "name")
  final String? name;
  @override
  @JsonKey(name: "amount")
  final int? amount;
  @override
  @JsonKey(name: "user_amount_per_referal")
  final int? userAmountPerReferal;
  @override
  @JsonKey(name: "refered_amount")
  final int? referedAmount;
  @override
  @JsonKey(name: "amount_after_count")
  final int? amountAfterCount;
  @override
  @JsonKey(name: "count")
  final int? count;
  @override
  @JsonKey(name: "transfer_commission")
  final double? transferCommission;
  @override
  @JsonKey(name: "discount")
  final int? discount;
  @override
  @JsonKey(name: "discount_type")
  final String? discountType;
  @override
  @JsonKey(name: "daily_transfer_count")
  final int? dailyTransferCount;
  @override
  @JsonKey(name: "monthly_transfer_count")
  final int? monthlyTransferCount;
  @override
  @JsonKey(name: "max_transfer_count")
  final int? maxTransferCount;
  @override
  @JsonKey(name: "created_at")
  final DateTime? createdAt;
  @override
  @JsonKey(name: "updated_at")
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'Plan(id: $id, name: $name, amount: $amount, userAmountPerReferal: $userAmountPerReferal, referedAmount: $referedAmount, amountAfterCount: $amountAfterCount, count: $count, transferCommission: $transferCommission, discount: $discount, discountType: $discountType, dailyTransferCount: $dailyTransferCount, monthlyTransferCount: $monthlyTransferCount, maxTransferCount: $maxTransferCount, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlanImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.userAmountPerReferal, userAmountPerReferal) ||
                other.userAmountPerReferal == userAmountPerReferal) &&
            (identical(other.referedAmount, referedAmount) ||
                other.referedAmount == referedAmount) &&
            (identical(other.amountAfterCount, amountAfterCount) ||
                other.amountAfterCount == amountAfterCount) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.transferCommission, transferCommission) ||
                other.transferCommission == transferCommission) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.discountType, discountType) ||
                other.discountType == discountType) &&
            (identical(other.dailyTransferCount, dailyTransferCount) ||
                other.dailyTransferCount == dailyTransferCount) &&
            (identical(other.monthlyTransferCount, monthlyTransferCount) ||
                other.monthlyTransferCount == monthlyTransferCount) &&
            (identical(other.maxTransferCount, maxTransferCount) ||
                other.maxTransferCount == maxTransferCount) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      amount,
      userAmountPerReferal,
      referedAmount,
      amountAfterCount,
      count,
      transferCommission,
      discount,
      discountType,
      dailyTransferCount,
      monthlyTransferCount,
      maxTransferCount,
      createdAt,
      updatedAt);

  /// Create a copy of Plan
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlanImplCopyWith<_$PlanImpl> get copyWith =>
      __$$PlanImplCopyWithImpl<_$PlanImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlanImplToJson(
      this,
    );
  }
}

abstract class _Plan implements Plan {
  const factory _Plan(
      {@JsonKey(name: "id") final int? id,
      @JsonKey(name: "name") final String? name,
      @JsonKey(name: "amount") final int? amount,
      @JsonKey(name: "user_amount_per_referal") final int? userAmountPerReferal,
      @JsonKey(name: "refered_amount") final int? referedAmount,
      @JsonKey(name: "amount_after_count") final int? amountAfterCount,
      @JsonKey(name: "count") final int? count,
      @JsonKey(name: "transfer_commission") final double? transferCommission,
      @JsonKey(name: "discount") final int? discount,
      @JsonKey(name: "discount_type") final String? discountType,
      @JsonKey(name: "daily_transfer_count") final int? dailyTransferCount,
      @JsonKey(name: "monthly_transfer_count") final int? monthlyTransferCount,
      @JsonKey(name: "max_transfer_count") final int? maxTransferCount,
      @JsonKey(name: "created_at") final DateTime? createdAt,
      @JsonKey(name: "updated_at") final DateTime? updatedAt}) = _$PlanImpl;

  factory _Plan.fromJson(Map<String, dynamic> json) = _$PlanImpl.fromJson;

  @override
  @JsonKey(name: "id")
  int? get id;
  @override
  @JsonKey(name: "name")
  String? get name;
  @override
  @JsonKey(name: "amount")
  int? get amount;
  @override
  @JsonKey(name: "user_amount_per_referal")
  int? get userAmountPerReferal;
  @override
  @JsonKey(name: "refered_amount")
  int? get referedAmount;
  @override
  @JsonKey(name: "amount_after_count")
  int? get amountAfterCount;
  @override
  @JsonKey(name: "count")
  int? get count;
  @override
  @JsonKey(name: "transfer_commission")
  double? get transferCommission;
  @override
  @JsonKey(name: "discount")
  int? get discount;
  @override
  @JsonKey(name: "discount_type")
  String? get discountType;
  @override
  @JsonKey(name: "daily_transfer_count")
  int? get dailyTransferCount;
  @override
  @JsonKey(name: "monthly_transfer_count")
  int? get monthlyTransferCount;
  @override
  @JsonKey(name: "max_transfer_count")
  int? get maxTransferCount;
  @override
  @JsonKey(name: "created_at")
  DateTime? get createdAt;
  @override
  @JsonKey(name: "updated_at")
  DateTime? get updatedAt;

  /// Create a copy of Plan
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlanImplCopyWith<_$PlanImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
