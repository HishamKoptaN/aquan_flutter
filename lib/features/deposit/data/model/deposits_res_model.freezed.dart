// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'deposits_res_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DepositsResModel _$DepositsResModelFromJson(Map<String, dynamic> json) {
  return _DepositsResModel.fromJson(json);
}

/// @nodoc
mixin _$DepositsResModel {
  @JsonKey(name: "deposits")
  List<Deposit>? get deposits => throw _privateConstructorUsedError;

  /// Serializes this DepositsResModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DepositsResModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DepositsResModelCopyWith<DepositsResModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DepositsResModelCopyWith<$Res> {
  factory $DepositsResModelCopyWith(
          DepositsResModel value, $Res Function(DepositsResModel) then) =
      _$DepositsResModelCopyWithImpl<$Res, DepositsResModel>;
  @useResult
  $Res call({@JsonKey(name: "deposits") List<Deposit>? deposits});
}

/// @nodoc
class _$DepositsResModelCopyWithImpl<$Res, $Val extends DepositsResModel>
    implements $DepositsResModelCopyWith<$Res> {
  _$DepositsResModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DepositsResModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deposits = freezed,
  }) {
    return _then(_value.copyWith(
      deposits: freezed == deposits
          ? _value.deposits
          : deposits // ignore: cast_nullable_to_non_nullable
              as List<Deposit>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DepositsResModelImplCopyWith<$Res>
    implements $DepositsResModelCopyWith<$Res> {
  factory _$$DepositsResModelImplCopyWith(_$DepositsResModelImpl value,
          $Res Function(_$DepositsResModelImpl) then) =
      __$$DepositsResModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "deposits") List<Deposit>? deposits});
}

/// @nodoc
class __$$DepositsResModelImplCopyWithImpl<$Res>
    extends _$DepositsResModelCopyWithImpl<$Res, _$DepositsResModelImpl>
    implements _$$DepositsResModelImplCopyWith<$Res> {
  __$$DepositsResModelImplCopyWithImpl(_$DepositsResModelImpl _value,
      $Res Function(_$DepositsResModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of DepositsResModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deposits = freezed,
  }) {
    return _then(_$DepositsResModelImpl(
      deposits: freezed == deposits
          ? _value._deposits
          : deposits // ignore: cast_nullable_to_non_nullable
              as List<Deposit>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DepositsResModelImpl implements _DepositsResModel {
  const _$DepositsResModelImpl(
      {@JsonKey(name: "deposits") final List<Deposit>? deposits})
      : _deposits = deposits;

  factory _$DepositsResModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DepositsResModelImplFromJson(json);

  final List<Deposit>? _deposits;
  @override
  @JsonKey(name: "deposits")
  List<Deposit>? get deposits {
    final value = _deposits;
    if (value == null) return null;
    if (_deposits is EqualUnmodifiableListView) return _deposits;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'DepositsResModel(deposits: $deposits)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DepositsResModelImpl &&
            const DeepCollectionEquality().equals(other._deposits, _deposits));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_deposits));

  /// Create a copy of DepositsResModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DepositsResModelImplCopyWith<_$DepositsResModelImpl> get copyWith =>
      __$$DepositsResModelImplCopyWithImpl<_$DepositsResModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DepositsResModelImplToJson(
      this,
    );
  }
}

abstract class _DepositsResModel implements DepositsResModel {
  const factory _DepositsResModel(
          {@JsonKey(name: "deposits") final List<Deposit>? deposits}) =
      _$DepositsResModelImpl;

  factory _DepositsResModel.fromJson(Map<String, dynamic> json) =
      _$DepositsResModelImpl.fromJson;

  @override
  @JsonKey(name: "deposits")
  List<Deposit>? get deposits;

  /// Create a copy of DepositsResModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DepositsResModelImplCopyWith<_$DepositsResModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Deposit _$DepositFromJson(Map<String, dynamic> json) {
  return _Deposit.fromJson(json);
}

/// @nodoc
mixin _$Deposit {
  @JsonKey(name: "id")
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "status")
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: "user_id")
  int? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: "employee_id")
  int? get employeeId => throw _privateConstructorUsedError;
  @JsonKey(name: "amount")
  double? get amount => throw _privateConstructorUsedError;
  @JsonKey(name: "method")
  int? get method => throw _privateConstructorUsedError;
  @JsonKey(name: "image")
  String? get image => throw _privateConstructorUsedError;
  @JsonKey(name: "comment")
  String? get comment => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "updated_at")
  String? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: "currency")
  DepositCurrency? get currency => throw _privateConstructorUsedError;

  /// Serializes this Deposit to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Deposit
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DepositCopyWith<Deposit> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DepositCopyWith<$Res> {
  factory $DepositCopyWith(Deposit value, $Res Function(Deposit) then) =
      _$DepositCopyWithImpl<$Res, Deposit>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "status") String? status,
      @JsonKey(name: "user_id") int? userId,
      @JsonKey(name: "employee_id") int? employeeId,
      @JsonKey(name: "amount") double? amount,
      @JsonKey(name: "method") int? method,
      @JsonKey(name: "image") String? image,
      @JsonKey(name: "comment") String? comment,
      @JsonKey(name: "created_at") String? createdAt,
      @JsonKey(name: "updated_at") String? updatedAt,
      @JsonKey(name: "currency") DepositCurrency? currency});

  $DepositCurrencyCopyWith<$Res>? get currency;
}

/// @nodoc
class _$DepositCopyWithImpl<$Res, $Val extends Deposit>
    implements $DepositCopyWith<$Res> {
  _$DepositCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Deposit
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? status = freezed,
    Object? userId = freezed,
    Object? employeeId = freezed,
    Object? amount = freezed,
    Object? method = freezed,
    Object? image = freezed,
    Object? comment = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? currency = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      employeeId: freezed == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as int?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      method: freezed == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as int?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as DepositCurrency?,
    ) as $Val);
  }

  /// Create a copy of Deposit
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DepositCurrencyCopyWith<$Res>? get currency {
    if (_value.currency == null) {
      return null;
    }

    return $DepositCurrencyCopyWith<$Res>(_value.currency!, (value) {
      return _then(_value.copyWith(currency: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DepositImplCopyWith<$Res> implements $DepositCopyWith<$Res> {
  factory _$$DepositImplCopyWith(
          _$DepositImpl value, $Res Function(_$DepositImpl) then) =
      __$$DepositImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "status") String? status,
      @JsonKey(name: "user_id") int? userId,
      @JsonKey(name: "employee_id") int? employeeId,
      @JsonKey(name: "amount") double? amount,
      @JsonKey(name: "method") int? method,
      @JsonKey(name: "image") String? image,
      @JsonKey(name: "comment") String? comment,
      @JsonKey(name: "created_at") String? createdAt,
      @JsonKey(name: "updated_at") String? updatedAt,
      @JsonKey(name: "currency") DepositCurrency? currency});

  @override
  $DepositCurrencyCopyWith<$Res>? get currency;
}

/// @nodoc
class __$$DepositImplCopyWithImpl<$Res>
    extends _$DepositCopyWithImpl<$Res, _$DepositImpl>
    implements _$$DepositImplCopyWith<$Res> {
  __$$DepositImplCopyWithImpl(
      _$DepositImpl _value, $Res Function(_$DepositImpl) _then)
      : super(_value, _then);

  /// Create a copy of Deposit
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? status = freezed,
    Object? userId = freezed,
    Object? employeeId = freezed,
    Object? amount = freezed,
    Object? method = freezed,
    Object? image = freezed,
    Object? comment = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? currency = freezed,
  }) {
    return _then(_$DepositImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      employeeId: freezed == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as int?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      method: freezed == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as int?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as DepositCurrency?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DepositImpl implements _Deposit {
  const _$DepositImpl(
      {@JsonKey(name: "id") this.id,
      @JsonKey(name: "status") this.status,
      @JsonKey(name: "user_id") this.userId,
      @JsonKey(name: "employee_id") this.employeeId,
      @JsonKey(name: "amount") this.amount,
      @JsonKey(name: "method") this.method,
      @JsonKey(name: "image") this.image,
      @JsonKey(name: "comment") this.comment,
      @JsonKey(name: "created_at") this.createdAt,
      @JsonKey(name: "updated_at") this.updatedAt,
      @JsonKey(name: "currency") this.currency});

  factory _$DepositImpl.fromJson(Map<String, dynamic> json) =>
      _$$DepositImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final int? id;
  @override
  @JsonKey(name: "status")
  final String? status;
  @override
  @JsonKey(name: "user_id")
  final int? userId;
  @override
  @JsonKey(name: "employee_id")
  final int? employeeId;
  @override
  @JsonKey(name: "amount")
  final double? amount;
  @override
  @JsonKey(name: "method")
  final int? method;
  @override
  @JsonKey(name: "image")
  final String? image;
  @override
  @JsonKey(name: "comment")
  final String? comment;
  @override
  @JsonKey(name: "created_at")
  final String? createdAt;
  @override
  @JsonKey(name: "updated_at")
  final String? updatedAt;
  @override
  @JsonKey(name: "currency")
  final DepositCurrency? currency;

  @override
  String toString() {
    return 'Deposit(id: $id, status: $status, userId: $userId, employeeId: $employeeId, amount: $amount, method: $method, image: $image, comment: $comment, createdAt: $createdAt, updatedAt: $updatedAt, currency: $currency)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DepositImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.employeeId, employeeId) ||
                other.employeeId == employeeId) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.method, method) || other.method == method) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.currency, currency) ||
                other.currency == currency));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, status, userId, employeeId,
      amount, method, image, comment, createdAt, updatedAt, currency);

  /// Create a copy of Deposit
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DepositImplCopyWith<_$DepositImpl> get copyWith =>
      __$$DepositImplCopyWithImpl<_$DepositImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DepositImplToJson(
      this,
    );
  }
}

abstract class _Deposit implements Deposit {
  const factory _Deposit(
          {@JsonKey(name: "id") final int? id,
          @JsonKey(name: "status") final String? status,
          @JsonKey(name: "user_id") final int? userId,
          @JsonKey(name: "employee_id") final int? employeeId,
          @JsonKey(name: "amount") final double? amount,
          @JsonKey(name: "method") final int? method,
          @JsonKey(name: "image") final String? image,
          @JsonKey(name: "comment") final String? comment,
          @JsonKey(name: "created_at") final String? createdAt,
          @JsonKey(name: "updated_at") final String? updatedAt,
          @JsonKey(name: "currency") final DepositCurrency? currency}) =
      _$DepositImpl;

  factory _Deposit.fromJson(Map<String, dynamic> json) = _$DepositImpl.fromJson;

  @override
  @JsonKey(name: "id")
  int? get id;
  @override
  @JsonKey(name: "status")
  String? get status;
  @override
  @JsonKey(name: "user_id")
  int? get userId;
  @override
  @JsonKey(name: "employee_id")
  int? get employeeId;
  @override
  @JsonKey(name: "amount")
  double? get amount;
  @override
  @JsonKey(name: "method")
  int? get method;
  @override
  @JsonKey(name: "image")
  String? get image;
  @override
  @JsonKey(name: "comment")
  String? get comment;
  @override
  @JsonKey(name: "created_at")
  String? get createdAt;
  @override
  @JsonKey(name: "updated_at")
  String? get updatedAt;
  @override
  @JsonKey(name: "currency")
  DepositCurrency? get currency;

  /// Create a copy of Deposit
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DepositImplCopyWith<_$DepositImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DepositCurrency _$DepositCurrencyFromJson(Map<String, dynamic> json) {
  return _Currency.fromJson(json);
}

/// @nodoc
mixin _$DepositCurrency {
  @JsonKey(name: "id")
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "name")
  String? get name => throw _privateConstructorUsedError;

  /// Serializes this DepositCurrency to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DepositCurrency
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DepositCurrencyCopyWith<DepositCurrency> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DepositCurrencyCopyWith<$Res> {
  factory $DepositCurrencyCopyWith(
          DepositCurrency value, $Res Function(DepositCurrency) then) =
      _$DepositCurrencyCopyWithImpl<$Res, DepositCurrency>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id, @JsonKey(name: "name") String? name});
}

/// @nodoc
class _$DepositCurrencyCopyWithImpl<$Res, $Val extends DepositCurrency>
    implements $DepositCurrencyCopyWith<$Res> {
  _$DepositCurrencyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DepositCurrency
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CurrencyImplCopyWith<$Res>
    implements $DepositCurrencyCopyWith<$Res> {
  factory _$$CurrencyImplCopyWith(
          _$CurrencyImpl value, $Res Function(_$CurrencyImpl) then) =
      __$$CurrencyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id, @JsonKey(name: "name") String? name});
}

/// @nodoc
class __$$CurrencyImplCopyWithImpl<$Res>
    extends _$DepositCurrencyCopyWithImpl<$Res, _$CurrencyImpl>
    implements _$$CurrencyImplCopyWith<$Res> {
  __$$CurrencyImplCopyWithImpl(
      _$CurrencyImpl _value, $Res Function(_$CurrencyImpl) _then)
      : super(_value, _then);

  /// Create a copy of DepositCurrency
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_$CurrencyImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CurrencyImpl implements _Currency {
  const _$CurrencyImpl(
      {@JsonKey(name: "id") this.id, @JsonKey(name: "name") this.name});

  factory _$CurrencyImpl.fromJson(Map<String, dynamic> json) =>
      _$$CurrencyImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final int? id;
  @override
  @JsonKey(name: "name")
  final String? name;

  @override
  String toString() {
    return 'DepositCurrency(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurrencyImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  /// Create a copy of DepositCurrency
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CurrencyImplCopyWith<_$CurrencyImpl> get copyWith =>
      __$$CurrencyImplCopyWithImpl<_$CurrencyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CurrencyImplToJson(
      this,
    );
  }
}

abstract class _Currency implements DepositCurrency {
  const factory _Currency(
      {@JsonKey(name: "id") final int? id,
      @JsonKey(name: "name") final String? name}) = _$CurrencyImpl;

  factory _Currency.fromJson(Map<String, dynamic> json) =
      _$CurrencyImpl.fromJson;

  @override
  @JsonKey(name: "id")
  int? get id;
  @override
  @JsonKey(name: "name")
  String? get name;

  /// Create a copy of DepositCurrency
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CurrencyImplCopyWith<_$CurrencyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
