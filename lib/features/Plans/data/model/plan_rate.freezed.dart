// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plan_rate.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PlanRate _$PlanRateFromJson(Map<String, dynamic> json) {
  return _PlanRate.fromJson(json);
}

/// @nodoc
mixin _$PlanRate {
  @JsonKey(name: "employee_id")
  int get employeeId => throw _privateConstructorUsedError;
  @JsonKey(name: "account_info")
  List<AccountInfo> get accountInfo => throw _privateConstructorUsedError;
  @JsonKey(name: "to_binance_rates")
  List<ToBinanceRate> get toBinanceRates => throw _privateConstructorUsedError;

  /// Serializes this PlanRate to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PlanRate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlanRateCopyWith<PlanRate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlanRateCopyWith<$Res> {
  factory $PlanRateCopyWith(PlanRate value, $Res Function(PlanRate) then) =
      _$PlanRateCopyWithImpl<$Res, PlanRate>;
  @useResult
  $Res call(
      {@JsonKey(name: "employee_id") int employeeId,
      @JsonKey(name: "account_info") List<AccountInfo> accountInfo,
      @JsonKey(name: "to_binance_rates") List<ToBinanceRate> toBinanceRates});
}

/// @nodoc
class _$PlanRateCopyWithImpl<$Res, $Val extends PlanRate>
    implements $PlanRateCopyWith<$Res> {
  _$PlanRateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlanRate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? employeeId = null,
    Object? accountInfo = null,
    Object? toBinanceRates = null,
  }) {
    return _then(_value.copyWith(
      employeeId: null == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as int,
      accountInfo: null == accountInfo
          ? _value.accountInfo
          : accountInfo // ignore: cast_nullable_to_non_nullable
              as List<AccountInfo>,
      toBinanceRates: null == toBinanceRates
          ? _value.toBinanceRates
          : toBinanceRates // ignore: cast_nullable_to_non_nullable
              as List<ToBinanceRate>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlanRateImplCopyWith<$Res>
    implements $PlanRateCopyWith<$Res> {
  factory _$$PlanRateImplCopyWith(
          _$PlanRateImpl value, $Res Function(_$PlanRateImpl) then) =
      __$$PlanRateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "employee_id") int employeeId,
      @JsonKey(name: "account_info") List<AccountInfo> accountInfo,
      @JsonKey(name: "to_binance_rates") List<ToBinanceRate> toBinanceRates});
}

/// @nodoc
class __$$PlanRateImplCopyWithImpl<$Res>
    extends _$PlanRateCopyWithImpl<$Res, _$PlanRateImpl>
    implements _$$PlanRateImplCopyWith<$Res> {
  __$$PlanRateImplCopyWithImpl(
      _$PlanRateImpl _value, $Res Function(_$PlanRateImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlanRate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? employeeId = null,
    Object? accountInfo = null,
    Object? toBinanceRates = null,
  }) {
    return _then(_$PlanRateImpl(
      employeeId: null == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as int,
      accountInfo: null == accountInfo
          ? _value._accountInfo
          : accountInfo // ignore: cast_nullable_to_non_nullable
              as List<AccountInfo>,
      toBinanceRates: null == toBinanceRates
          ? _value._toBinanceRates
          : toBinanceRates // ignore: cast_nullable_to_non_nullable
              as List<ToBinanceRate>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlanRateImpl implements _PlanRate {
  const _$PlanRateImpl(
      {@JsonKey(name: "employee_id") this.employeeId = 0,
      @JsonKey(name: "account_info")
      final List<AccountInfo> accountInfo = const [],
      @JsonKey(name: "to_binance_rates")
      final List<ToBinanceRate> toBinanceRates = const []})
      : _accountInfo = accountInfo,
        _toBinanceRates = toBinanceRates;

  factory _$PlanRateImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlanRateImplFromJson(json);

  @override
  @JsonKey(name: "employee_id")
  final int employeeId;
  final List<AccountInfo> _accountInfo;
  @override
  @JsonKey(name: "account_info")
  List<AccountInfo> get accountInfo {
    if (_accountInfo is EqualUnmodifiableListView) return _accountInfo;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_accountInfo);
  }

  final List<ToBinanceRate> _toBinanceRates;
  @override
  @JsonKey(name: "to_binance_rates")
  List<ToBinanceRate> get toBinanceRates {
    if (_toBinanceRates is EqualUnmodifiableListView) return _toBinanceRates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_toBinanceRates);
  }

  @override
  String toString() {
    return 'PlanRate(employeeId: $employeeId, accountInfo: $accountInfo, toBinanceRates: $toBinanceRates)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlanRateImpl &&
            (identical(other.employeeId, employeeId) ||
                other.employeeId == employeeId) &&
            const DeepCollectionEquality()
                .equals(other._accountInfo, _accountInfo) &&
            const DeepCollectionEquality()
                .equals(other._toBinanceRates, _toBinanceRates));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      employeeId,
      const DeepCollectionEquality().hash(_accountInfo),
      const DeepCollectionEquality().hash(_toBinanceRates));

  /// Create a copy of PlanRate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlanRateImplCopyWith<_$PlanRateImpl> get copyWith =>
      __$$PlanRateImplCopyWithImpl<_$PlanRateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlanRateImplToJson(
      this,
    );
  }
}

abstract class _PlanRate implements PlanRate {
  const factory _PlanRate(
      {@JsonKey(name: "employee_id") final int employeeId,
      @JsonKey(name: "account_info") final List<AccountInfo> accountInfo,
      @JsonKey(name: "to_binance_rates")
      final List<ToBinanceRate> toBinanceRates}) = _$PlanRateImpl;

  factory _PlanRate.fromJson(Map<String, dynamic> json) =
      _$PlanRateImpl.fromJson;

  @override
  @JsonKey(name: "employee_id")
  int get employeeId;
  @override
  @JsonKey(name: "account_info")
  List<AccountInfo> get accountInfo;
  @override
  @JsonKey(name: "to_binance_rates")
  List<ToBinanceRate> get toBinanceRates;

  /// Create a copy of PlanRate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlanRateImplCopyWith<_$PlanRateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AccountInfo _$AccountInfoFromJson(Map<String, dynamic> json) {
  return _AccountInfo.fromJson(json);
}

/// @nodoc
mixin _$AccountInfo {
  @JsonKey(name: "id")
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "user_id")
  int get userId => throw _privateConstructorUsedError;
  @JsonKey(name: "bank_id")
  int get bankId => throw _privateConstructorUsedError;
  @JsonKey(name: "account_number")
  String get accountNumber => throw _privateConstructorUsedError;
  @JsonKey(name: "comment")
  String get comment => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "updated_at")
  String get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: "currency")
  Currency get currency => throw _privateConstructorUsedError;

  /// Serializes this AccountInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AccountInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AccountInfoCopyWith<AccountInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountInfoCopyWith<$Res> {
  factory $AccountInfoCopyWith(
          AccountInfo value, $Res Function(AccountInfo) then) =
      _$AccountInfoCopyWithImpl<$Res, AccountInfo>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") int id,
      @JsonKey(name: "user_id") int userId,
      @JsonKey(name: "bank_id") int bankId,
      @JsonKey(name: "account_number") String accountNumber,
      @JsonKey(name: "comment") String comment,
      @JsonKey(name: "created_at") String createdAt,
      @JsonKey(name: "updated_at") String updatedAt,
      @JsonKey(name: "currency") Currency currency});

  $CurrencyCopyWith<$Res> get currency;
}

/// @nodoc
class _$AccountInfoCopyWithImpl<$Res, $Val extends AccountInfo>
    implements $AccountInfoCopyWith<$Res> {
  _$AccountInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AccountInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? bankId = null,
    Object? accountNumber = null,
    Object? comment = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? currency = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      bankId: null == bankId
          ? _value.bankId
          : bankId // ignore: cast_nullable_to_non_nullable
              as int,
      accountNumber: null == accountNumber
          ? _value.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency,
    ) as $Val);
  }

  /// Create a copy of AccountInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CurrencyCopyWith<$Res> get currency {
    return $CurrencyCopyWith<$Res>(_value.currency, (value) {
      return _then(_value.copyWith(currency: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AccountInfoImplCopyWith<$Res>
    implements $AccountInfoCopyWith<$Res> {
  factory _$$AccountInfoImplCopyWith(
          _$AccountInfoImpl value, $Res Function(_$AccountInfoImpl) then) =
      __$$AccountInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") int id,
      @JsonKey(name: "user_id") int userId,
      @JsonKey(name: "bank_id") int bankId,
      @JsonKey(name: "account_number") String accountNumber,
      @JsonKey(name: "comment") String comment,
      @JsonKey(name: "created_at") String createdAt,
      @JsonKey(name: "updated_at") String updatedAt,
      @JsonKey(name: "currency") Currency currency});

  @override
  $CurrencyCopyWith<$Res> get currency;
}

/// @nodoc
class __$$AccountInfoImplCopyWithImpl<$Res>
    extends _$AccountInfoCopyWithImpl<$Res, _$AccountInfoImpl>
    implements _$$AccountInfoImplCopyWith<$Res> {
  __$$AccountInfoImplCopyWithImpl(
      _$AccountInfoImpl _value, $Res Function(_$AccountInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of AccountInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? bankId = null,
    Object? accountNumber = null,
    Object? comment = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? currency = null,
  }) {
    return _then(_$AccountInfoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      bankId: null == bankId
          ? _value.bankId
          : bankId // ignore: cast_nullable_to_non_nullable
              as int,
      accountNumber: null == accountNumber
          ? _value.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AccountInfoImpl implements _AccountInfo {
  const _$AccountInfoImpl(
      {@JsonKey(name: "id") this.id = 0,
      @JsonKey(name: "user_id") this.userId = 0,
      @JsonKey(name: "bank_id") this.bankId = 0,
      @JsonKey(name: "account_number") this.accountNumber = '',
      @JsonKey(name: "comment") this.comment = '',
      @JsonKey(name: "created_at") this.createdAt = '',
      @JsonKey(name: "updated_at") this.updatedAt = '',
      @JsonKey(name: "currency") this.currency = const Currency()});

  factory _$AccountInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$AccountInfoImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final int id;
  @override
  @JsonKey(name: "user_id")
  final int userId;
  @override
  @JsonKey(name: "bank_id")
  final int bankId;
  @override
  @JsonKey(name: "account_number")
  final String accountNumber;
  @override
  @JsonKey(name: "comment")
  final String comment;
  @override
  @JsonKey(name: "created_at")
  final String createdAt;
  @override
  @JsonKey(name: "updated_at")
  final String updatedAt;
  @override
  @JsonKey(name: "currency")
  final Currency currency;

  @override
  String toString() {
    return 'AccountInfo(id: $id, userId: $userId, bankId: $bankId, accountNumber: $accountNumber, comment: $comment, createdAt: $createdAt, updatedAt: $updatedAt, currency: $currency)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountInfoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.bankId, bankId) || other.bankId == bankId) &&
            (identical(other.accountNumber, accountNumber) ||
                other.accountNumber == accountNumber) &&
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
  int get hashCode => Object.hash(runtimeType, id, userId, bankId,
      accountNumber, comment, createdAt, updatedAt, currency);

  /// Create a copy of AccountInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountInfoImplCopyWith<_$AccountInfoImpl> get copyWith =>
      __$$AccountInfoImplCopyWithImpl<_$AccountInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AccountInfoImplToJson(
      this,
    );
  }
}

abstract class _AccountInfo implements AccountInfo {
  const factory _AccountInfo(
      {@JsonKey(name: "id") final int id,
      @JsonKey(name: "user_id") final int userId,
      @JsonKey(name: "bank_id") final int bankId,
      @JsonKey(name: "account_number") final String accountNumber,
      @JsonKey(name: "comment") final String comment,
      @JsonKey(name: "created_at") final String createdAt,
      @JsonKey(name: "updated_at") final String updatedAt,
      @JsonKey(name: "currency") final Currency currency}) = _$AccountInfoImpl;

  factory _AccountInfo.fromJson(Map<String, dynamic> json) =
      _$AccountInfoImpl.fromJson;

  @override
  @JsonKey(name: "id")
  int get id;
  @override
  @JsonKey(name: "user_id")
  int get userId;
  @override
  @JsonKey(name: "bank_id")
  int get bankId;
  @override
  @JsonKey(name: "account_number")
  String get accountNumber;
  @override
  @JsonKey(name: "comment")
  String get comment;
  @override
  @JsonKey(name: "created_at")
  String get createdAt;
  @override
  @JsonKey(name: "updated_at")
  String get updatedAt;
  @override
  @JsonKey(name: "currency")
  Currency get currency;

  /// Create a copy of AccountInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AccountInfoImplCopyWith<_$AccountInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ToBinanceRate _$ToBinanceRateFromJson(Map<String, dynamic> json) {
  return _ToBinanceRate.fromJson(json);
}

/// @nodoc
mixin _$ToBinanceRate {
  @JsonKey(name: "price")
  int get price => throw _privateConstructorUsedError;
  @JsonKey(name: "updated_at")
  String get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: "currency_name")
  String get currencyName => throw _privateConstructorUsedError;
  @JsonKey(name: "from")
  int get from => throw _privateConstructorUsedError;

  /// Serializes this ToBinanceRate to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ToBinanceRate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ToBinanceRateCopyWith<ToBinanceRate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ToBinanceRateCopyWith<$Res> {
  factory $ToBinanceRateCopyWith(
          ToBinanceRate value, $Res Function(ToBinanceRate) then) =
      _$ToBinanceRateCopyWithImpl<$Res, ToBinanceRate>;
  @useResult
  $Res call(
      {@JsonKey(name: "price") int price,
      @JsonKey(name: "updated_at") String updatedAt,
      @JsonKey(name: "currency_name") String currencyName,
      @JsonKey(name: "from") int from});
}

/// @nodoc
class _$ToBinanceRateCopyWithImpl<$Res, $Val extends ToBinanceRate>
    implements $ToBinanceRateCopyWith<$Res> {
  _$ToBinanceRateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ToBinanceRate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? price = null,
    Object? updatedAt = null,
    Object? currencyName = null,
    Object? from = null,
  }) {
    return _then(_value.copyWith(
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      currencyName: null == currencyName
          ? _value.currencyName
          : currencyName // ignore: cast_nullable_to_non_nullable
              as String,
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ToBinanceRateImplCopyWith<$Res>
    implements $ToBinanceRateCopyWith<$Res> {
  factory _$$ToBinanceRateImplCopyWith(
          _$ToBinanceRateImpl value, $Res Function(_$ToBinanceRateImpl) then) =
      __$$ToBinanceRateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "price") int price,
      @JsonKey(name: "updated_at") String updatedAt,
      @JsonKey(name: "currency_name") String currencyName,
      @JsonKey(name: "from") int from});
}

/// @nodoc
class __$$ToBinanceRateImplCopyWithImpl<$Res>
    extends _$ToBinanceRateCopyWithImpl<$Res, _$ToBinanceRateImpl>
    implements _$$ToBinanceRateImplCopyWith<$Res> {
  __$$ToBinanceRateImplCopyWithImpl(
      _$ToBinanceRateImpl _value, $Res Function(_$ToBinanceRateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ToBinanceRate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? price = null,
    Object? updatedAt = null,
    Object? currencyName = null,
    Object? from = null,
  }) {
    return _then(_$ToBinanceRateImpl(
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      currencyName: null == currencyName
          ? _value.currencyName
          : currencyName // ignore: cast_nullable_to_non_nullable
              as String,
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ToBinanceRateImpl implements _ToBinanceRate {
  const _$ToBinanceRateImpl(
      {@JsonKey(name: "price") this.price = 0,
      @JsonKey(name: "updated_at") this.updatedAt = '',
      @JsonKey(name: "currency_name") this.currencyName = '',
      @JsonKey(name: "from") this.from = 0});

  factory _$ToBinanceRateImpl.fromJson(Map<String, dynamic> json) =>
      _$$ToBinanceRateImplFromJson(json);

  @override
  @JsonKey(name: "price")
  final int price;
  @override
  @JsonKey(name: "updated_at")
  final String updatedAt;
  @override
  @JsonKey(name: "currency_name")
  final String currencyName;
  @override
  @JsonKey(name: "from")
  final int from;

  @override
  String toString() {
    return 'ToBinanceRate(price: $price, updatedAt: $updatedAt, currencyName: $currencyName, from: $from)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToBinanceRateImpl &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.currencyName, currencyName) ||
                other.currencyName == currencyName) &&
            (identical(other.from, from) || other.from == from));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, price, updatedAt, currencyName, from);

  /// Create a copy of ToBinanceRate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ToBinanceRateImplCopyWith<_$ToBinanceRateImpl> get copyWith =>
      __$$ToBinanceRateImplCopyWithImpl<_$ToBinanceRateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ToBinanceRateImplToJson(
      this,
    );
  }
}

abstract class _ToBinanceRate implements ToBinanceRate {
  const factory _ToBinanceRate(
      {@JsonKey(name: "price") final int price,
      @JsonKey(name: "updated_at") final String updatedAt,
      @JsonKey(name: "currency_name") final String currencyName,
      @JsonKey(name: "from") final int from}) = _$ToBinanceRateImpl;

  factory _ToBinanceRate.fromJson(Map<String, dynamic> json) =
      _$ToBinanceRateImpl.fromJson;

  @override
  @JsonKey(name: "price")
  int get price;
  @override
  @JsonKey(name: "updated_at")
  String get updatedAt;
  @override
  @JsonKey(name: "currency_name")
  String get currencyName;
  @override
  @JsonKey(name: "from")
  int get from;

  /// Create a copy of ToBinanceRate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ToBinanceRateImplCopyWith<_$ToBinanceRateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
