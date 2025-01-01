// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'buy_sell_res_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BuySellResModel _$BuySellResModelFromJson(Map<String, dynamic> json) {
  return _BuySellResModel.fromJson(json);
}

/// @nodoc
mixin _$BuySellResModel {
  @JsonKey(name: "buy_sell_status")
  bool? get buySellStatus => throw _privateConstructorUsedError;
  @JsonKey(name: "buy_sell_message")
  String? get buySellMessage => throw _privateConstructorUsedError;
  @JsonKey(name: "total_monthly_transfers")
  int? get totalMonthlyTransfers => throw _privateConstructorUsedError;
  @JsonKey(name: "total_daily_transfers")
  int? get totalDailyTransfers => throw _privateConstructorUsedError;
  @JsonKey(name: "max_transfer_count")
  int? get maxTransferCount => throw _privateConstructorUsedError;
  @JsonKey(name: "monthly_transfer_count")
  int? get monthlyTransferCount => throw _privateConstructorUsedError;
  @JsonKey(name: "daily_transfer_count")
  int? get dailyTransferCount => throw _privateConstructorUsedError;
  @JsonKey(name: "currencies")
  List<Currency>? get currencies => throw _privateConstructorUsedError;
  @JsonKey(name: "rates")
  List<Rate>? get rates => throw _privateConstructorUsedError;
  @JsonKey(name: "accounts")
  List<Account>? get accounts => throw _privateConstructorUsedError;

  /// Serializes this BuySellResModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BuySellResModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BuySellResModelCopyWith<BuySellResModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BuySellResModelCopyWith<$Res> {
  factory $BuySellResModelCopyWith(
          BuySellResModel value, $Res Function(BuySellResModel) then) =
      _$BuySellResModelCopyWithImpl<$Res, BuySellResModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "buy_sell_status") bool? buySellStatus,
      @JsonKey(name: "buy_sell_message") String? buySellMessage,
      @JsonKey(name: "total_monthly_transfers") int? totalMonthlyTransfers,
      @JsonKey(name: "total_daily_transfers") int? totalDailyTransfers,
      @JsonKey(name: "max_transfer_count") int? maxTransferCount,
      @JsonKey(name: "monthly_transfer_count") int? monthlyTransferCount,
      @JsonKey(name: "daily_transfer_count") int? dailyTransferCount,
      @JsonKey(name: "currencies") List<Currency>? currencies,
      @JsonKey(name: "rates") List<Rate>? rates,
      @JsonKey(name: "accounts") List<Account>? accounts});
}

/// @nodoc
class _$BuySellResModelCopyWithImpl<$Res, $Val extends BuySellResModel>
    implements $BuySellResModelCopyWith<$Res> {
  _$BuySellResModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BuySellResModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? buySellStatus = freezed,
    Object? buySellMessage = freezed,
    Object? totalMonthlyTransfers = freezed,
    Object? totalDailyTransfers = freezed,
    Object? maxTransferCount = freezed,
    Object? monthlyTransferCount = freezed,
    Object? dailyTransferCount = freezed,
    Object? currencies = freezed,
    Object? rates = freezed,
    Object? accounts = freezed,
  }) {
    return _then(_value.copyWith(
      buySellStatus: freezed == buySellStatus
          ? _value.buySellStatus
          : buySellStatus // ignore: cast_nullable_to_non_nullable
              as bool?,
      buySellMessage: freezed == buySellMessage
          ? _value.buySellMessage
          : buySellMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      totalMonthlyTransfers: freezed == totalMonthlyTransfers
          ? _value.totalMonthlyTransfers
          : totalMonthlyTransfers // ignore: cast_nullable_to_non_nullable
              as int?,
      totalDailyTransfers: freezed == totalDailyTransfers
          ? _value.totalDailyTransfers
          : totalDailyTransfers // ignore: cast_nullable_to_non_nullable
              as int?,
      maxTransferCount: freezed == maxTransferCount
          ? _value.maxTransferCount
          : maxTransferCount // ignore: cast_nullable_to_non_nullable
              as int?,
      monthlyTransferCount: freezed == monthlyTransferCount
          ? _value.monthlyTransferCount
          : monthlyTransferCount // ignore: cast_nullable_to_non_nullable
              as int?,
      dailyTransferCount: freezed == dailyTransferCount
          ? _value.dailyTransferCount
          : dailyTransferCount // ignore: cast_nullable_to_non_nullable
              as int?,
      currencies: freezed == currencies
          ? _value.currencies
          : currencies // ignore: cast_nullable_to_non_nullable
              as List<Currency>?,
      rates: freezed == rates
          ? _value.rates
          : rates // ignore: cast_nullable_to_non_nullable
              as List<Rate>?,
      accounts: freezed == accounts
          ? _value.accounts
          : accounts // ignore: cast_nullable_to_non_nullable
              as List<Account>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BuySellResModelImplCopyWith<$Res>
    implements $BuySellResModelCopyWith<$Res> {
  factory _$$BuySellResModelImplCopyWith(_$BuySellResModelImpl value,
          $Res Function(_$BuySellResModelImpl) then) =
      __$$BuySellResModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "buy_sell_status") bool? buySellStatus,
      @JsonKey(name: "buy_sell_message") String? buySellMessage,
      @JsonKey(name: "total_monthly_transfers") int? totalMonthlyTransfers,
      @JsonKey(name: "total_daily_transfers") int? totalDailyTransfers,
      @JsonKey(name: "max_transfer_count") int? maxTransferCount,
      @JsonKey(name: "monthly_transfer_count") int? monthlyTransferCount,
      @JsonKey(name: "daily_transfer_count") int? dailyTransferCount,
      @JsonKey(name: "currencies") List<Currency>? currencies,
      @JsonKey(name: "rates") List<Rate>? rates,
      @JsonKey(name: "accounts") List<Account>? accounts});
}

/// @nodoc
class __$$BuySellResModelImplCopyWithImpl<$Res>
    extends _$BuySellResModelCopyWithImpl<$Res, _$BuySellResModelImpl>
    implements _$$BuySellResModelImplCopyWith<$Res> {
  __$$BuySellResModelImplCopyWithImpl(
      _$BuySellResModelImpl _value, $Res Function(_$BuySellResModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of BuySellResModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? buySellStatus = freezed,
    Object? buySellMessage = freezed,
    Object? totalMonthlyTransfers = freezed,
    Object? totalDailyTransfers = freezed,
    Object? maxTransferCount = freezed,
    Object? monthlyTransferCount = freezed,
    Object? dailyTransferCount = freezed,
    Object? currencies = freezed,
    Object? rates = freezed,
    Object? accounts = freezed,
  }) {
    return _then(_$BuySellResModelImpl(
      buySellStatus: freezed == buySellStatus
          ? _value.buySellStatus
          : buySellStatus // ignore: cast_nullable_to_non_nullable
              as bool?,
      buySellMessage: freezed == buySellMessage
          ? _value.buySellMessage
          : buySellMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      totalMonthlyTransfers: freezed == totalMonthlyTransfers
          ? _value.totalMonthlyTransfers
          : totalMonthlyTransfers // ignore: cast_nullable_to_non_nullable
              as int?,
      totalDailyTransfers: freezed == totalDailyTransfers
          ? _value.totalDailyTransfers
          : totalDailyTransfers // ignore: cast_nullable_to_non_nullable
              as int?,
      maxTransferCount: freezed == maxTransferCount
          ? _value.maxTransferCount
          : maxTransferCount // ignore: cast_nullable_to_non_nullable
              as int?,
      monthlyTransferCount: freezed == monthlyTransferCount
          ? _value.monthlyTransferCount
          : monthlyTransferCount // ignore: cast_nullable_to_non_nullable
              as int?,
      dailyTransferCount: freezed == dailyTransferCount
          ? _value.dailyTransferCount
          : dailyTransferCount // ignore: cast_nullable_to_non_nullable
              as int?,
      currencies: freezed == currencies
          ? _value._currencies
          : currencies // ignore: cast_nullable_to_non_nullable
              as List<Currency>?,
      rates: freezed == rates
          ? _value._rates
          : rates // ignore: cast_nullable_to_non_nullable
              as List<Rate>?,
      accounts: freezed == accounts
          ? _value._accounts
          : accounts // ignore: cast_nullable_to_non_nullable
              as List<Account>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BuySellResModelImpl implements _BuySellResModel {
  const _$BuySellResModelImpl(
      {@JsonKey(name: "buy_sell_status") this.buySellStatus,
      @JsonKey(name: "buy_sell_message") this.buySellMessage,
      @JsonKey(name: "total_monthly_transfers") this.totalMonthlyTransfers,
      @JsonKey(name: "total_daily_transfers") this.totalDailyTransfers,
      @JsonKey(name: "max_transfer_count") this.maxTransferCount,
      @JsonKey(name: "monthly_transfer_count") this.monthlyTransferCount,
      @JsonKey(name: "daily_transfer_count") this.dailyTransferCount,
      @JsonKey(name: "currencies") final List<Currency>? currencies,
      @JsonKey(name: "rates") final List<Rate>? rates,
      @JsonKey(name: "accounts") final List<Account>? accounts})
      : _currencies = currencies,
        _rates = rates,
        _accounts = accounts;

  factory _$BuySellResModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BuySellResModelImplFromJson(json);

  @override
  @JsonKey(name: "buy_sell_status")
  final bool? buySellStatus;
  @override
  @JsonKey(name: "buy_sell_message")
  final String? buySellMessage;
  @override
  @JsonKey(name: "total_monthly_transfers")
  final int? totalMonthlyTransfers;
  @override
  @JsonKey(name: "total_daily_transfers")
  final int? totalDailyTransfers;
  @override
  @JsonKey(name: "max_transfer_count")
  final int? maxTransferCount;
  @override
  @JsonKey(name: "monthly_transfer_count")
  final int? monthlyTransferCount;
  @override
  @JsonKey(name: "daily_transfer_count")
  final int? dailyTransferCount;
  final List<Currency>? _currencies;
  @override
  @JsonKey(name: "currencies")
  List<Currency>? get currencies {
    final value = _currencies;
    if (value == null) return null;
    if (_currencies is EqualUnmodifiableListView) return _currencies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Rate>? _rates;
  @override
  @JsonKey(name: "rates")
  List<Rate>? get rates {
    final value = _rates;
    if (value == null) return null;
    if (_rates is EqualUnmodifiableListView) return _rates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Account>? _accounts;
  @override
  @JsonKey(name: "accounts")
  List<Account>? get accounts {
    final value = _accounts;
    if (value == null) return null;
    if (_accounts is EqualUnmodifiableListView) return _accounts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'BuySellResModel(buySellStatus: $buySellStatus, buySellMessage: $buySellMessage, totalMonthlyTransfers: $totalMonthlyTransfers, totalDailyTransfers: $totalDailyTransfers, maxTransferCount: $maxTransferCount, monthlyTransferCount: $monthlyTransferCount, dailyTransferCount: $dailyTransferCount, currencies: $currencies, rates: $rates, accounts: $accounts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BuySellResModelImpl &&
            (identical(other.buySellStatus, buySellStatus) ||
                other.buySellStatus == buySellStatus) &&
            (identical(other.buySellMessage, buySellMessage) ||
                other.buySellMessage == buySellMessage) &&
            (identical(other.totalMonthlyTransfers, totalMonthlyTransfers) ||
                other.totalMonthlyTransfers == totalMonthlyTransfers) &&
            (identical(other.totalDailyTransfers, totalDailyTransfers) ||
                other.totalDailyTransfers == totalDailyTransfers) &&
            (identical(other.maxTransferCount, maxTransferCount) ||
                other.maxTransferCount == maxTransferCount) &&
            (identical(other.monthlyTransferCount, monthlyTransferCount) ||
                other.monthlyTransferCount == monthlyTransferCount) &&
            (identical(other.dailyTransferCount, dailyTransferCount) ||
                other.dailyTransferCount == dailyTransferCount) &&
            const DeepCollectionEquality()
                .equals(other._currencies, _currencies) &&
            const DeepCollectionEquality().equals(other._rates, _rates) &&
            const DeepCollectionEquality().equals(other._accounts, _accounts));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      buySellStatus,
      buySellMessage,
      totalMonthlyTransfers,
      totalDailyTransfers,
      maxTransferCount,
      monthlyTransferCount,
      dailyTransferCount,
      const DeepCollectionEquality().hash(_currencies),
      const DeepCollectionEquality().hash(_rates),
      const DeepCollectionEquality().hash(_accounts));

  /// Create a copy of BuySellResModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BuySellResModelImplCopyWith<_$BuySellResModelImpl> get copyWith =>
      __$$BuySellResModelImplCopyWithImpl<_$BuySellResModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BuySellResModelImplToJson(
      this,
    );
  }
}

abstract class _BuySellResModel implements BuySellResModel {
  const factory _BuySellResModel(
      {@JsonKey(name: "buy_sell_status") final bool? buySellStatus,
      @JsonKey(name: "buy_sell_message") final String? buySellMessage,
      @JsonKey(name: "total_monthly_transfers")
      final int? totalMonthlyTransfers,
      @JsonKey(name: "total_daily_transfers") final int? totalDailyTransfers,
      @JsonKey(name: "max_transfer_count") final int? maxTransferCount,
      @JsonKey(name: "monthly_transfer_count") final int? monthlyTransferCount,
      @JsonKey(name: "daily_transfer_count") final int? dailyTransferCount,
      @JsonKey(name: "currencies") final List<Currency>? currencies,
      @JsonKey(name: "rates") final List<Rate>? rates,
      @JsonKey(name: "accounts")
      final List<Account>? accounts}) = _$BuySellResModelImpl;

  factory _BuySellResModel.fromJson(Map<String, dynamic> json) =
      _$BuySellResModelImpl.fromJson;

  @override
  @JsonKey(name: "buy_sell_status")
  bool? get buySellStatus;
  @override
  @JsonKey(name: "buy_sell_message")
  String? get buySellMessage;
  @override
  @JsonKey(name: "total_monthly_transfers")
  int? get totalMonthlyTransfers;
  @override
  @JsonKey(name: "total_daily_transfers")
  int? get totalDailyTransfers;
  @override
  @JsonKey(name: "max_transfer_count")
  int? get maxTransferCount;
  @override
  @JsonKey(name: "monthly_transfer_count")
  int? get monthlyTransferCount;
  @override
  @JsonKey(name: "daily_transfer_count")
  int? get dailyTransferCount;
  @override
  @JsonKey(name: "currencies")
  List<Currency>? get currencies;
  @override
  @JsonKey(name: "rates")
  List<Rate>? get rates;
  @override
  @JsonKey(name: "accounts")
  List<Account>? get accounts;

  /// Create a copy of BuySellResModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BuySellResModelImplCopyWith<_$BuySellResModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AccountCurrency _$AccountCurrencyFromJson(Map<String, dynamic> json) {
  return _AccountCurrency.fromJson(json);
}

/// @nodoc
mixin _$AccountCurrency {
  @JsonKey(name: "id")
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "name")
  String? get name => throw _privateConstructorUsedError;

  /// Serializes this AccountCurrency to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AccountCurrency
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AccountCurrencyCopyWith<AccountCurrency> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountCurrencyCopyWith<$Res> {
  factory $AccountCurrencyCopyWith(
          AccountCurrency value, $Res Function(AccountCurrency) then) =
      _$AccountCurrencyCopyWithImpl<$Res, AccountCurrency>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id, @JsonKey(name: "name") String? name});
}

/// @nodoc
class _$AccountCurrencyCopyWithImpl<$Res, $Val extends AccountCurrency>
    implements $AccountCurrencyCopyWith<$Res> {
  _$AccountCurrencyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AccountCurrency
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
abstract class _$$AccountCurrencyImplCopyWith<$Res>
    implements $AccountCurrencyCopyWith<$Res> {
  factory _$$AccountCurrencyImplCopyWith(_$AccountCurrencyImpl value,
          $Res Function(_$AccountCurrencyImpl) then) =
      __$$AccountCurrencyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id, @JsonKey(name: "name") String? name});
}

/// @nodoc
class __$$AccountCurrencyImplCopyWithImpl<$Res>
    extends _$AccountCurrencyCopyWithImpl<$Res, _$AccountCurrencyImpl>
    implements _$$AccountCurrencyImplCopyWith<$Res> {
  __$$AccountCurrencyImplCopyWithImpl(
      _$AccountCurrencyImpl _value, $Res Function(_$AccountCurrencyImpl) _then)
      : super(_value, _then);

  /// Create a copy of AccountCurrency
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_$AccountCurrencyImpl(
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
class _$AccountCurrencyImpl implements _AccountCurrency {
  const _$AccountCurrencyImpl(
      {@JsonKey(name: "id") this.id, @JsonKey(name: "name") this.name});

  factory _$AccountCurrencyImpl.fromJson(Map<String, dynamic> json) =>
      _$$AccountCurrencyImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final int? id;
  @override
  @JsonKey(name: "name")
  final String? name;

  @override
  String toString() {
    return 'AccountCurrency(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountCurrencyImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  /// Create a copy of AccountCurrency
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountCurrencyImplCopyWith<_$AccountCurrencyImpl> get copyWith =>
      __$$AccountCurrencyImplCopyWithImpl<_$AccountCurrencyImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AccountCurrencyImplToJson(
      this,
    );
  }
}

abstract class _AccountCurrency implements AccountCurrency {
  const factory _AccountCurrency(
      {@JsonKey(name: "id") final int? id,
      @JsonKey(name: "name") final String? name}) = _$AccountCurrencyImpl;

  factory _AccountCurrency.fromJson(Map<String, dynamic> json) =
      _$AccountCurrencyImpl.fromJson;

  @override
  @JsonKey(name: "id")
  int? get id;
  @override
  @JsonKey(name: "name")
  String? get name;

  /// Create a copy of AccountCurrency
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AccountCurrencyImplCopyWith<_$AccountCurrencyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Rate _$RateFromJson(Map<String, dynamic> json) {
  return _Rate.fromJson(json);
}

/// @nodoc
mixin _$Rate {
  @JsonKey(name: "id")
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "status")
  bool? get status => throw _privateConstructorUsedError;
  @JsonKey(name: "plan_id")
  int? get planId => throw _privateConstructorUsedError;
  @JsonKey(name: "from")
  int? get from => throw _privateConstructorUsedError;
  @JsonKey(name: "to")
  int? get to => throw _privateConstructorUsedError;
  @JsonKey(name: "price")
  int? get price => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "updated_at")
  String? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Rate to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Rate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RateCopyWith<Rate> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RateCopyWith<$Res> {
  factory $RateCopyWith(Rate value, $Res Function(Rate) then) =
      _$RateCopyWithImpl<$Res, Rate>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "status") bool? status,
      @JsonKey(name: "plan_id") int? planId,
      @JsonKey(name: "from") int? from,
      @JsonKey(name: "to") int? to,
      @JsonKey(name: "price") int? price,
      @JsonKey(name: "created_at") String? createdAt,
      @JsonKey(name: "updated_at") String? updatedAt});
}

/// @nodoc
class _$RateCopyWithImpl<$Res, $Val extends Rate>
    implements $RateCopyWith<$Res> {
  _$RateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Rate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? status = freezed,
    Object? planId = freezed,
    Object? from = freezed,
    Object? to = freezed,
    Object? price = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      planId: freezed == planId
          ? _value.planId
          : planId // ignore: cast_nullable_to_non_nullable
              as int?,
      from: freezed == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as int?,
      to: freezed == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as int?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RateImplCopyWith<$Res> implements $RateCopyWith<$Res> {
  factory _$$RateImplCopyWith(
          _$RateImpl value, $Res Function(_$RateImpl) then) =
      __$$RateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "status") bool? status,
      @JsonKey(name: "plan_id") int? planId,
      @JsonKey(name: "from") int? from,
      @JsonKey(name: "to") int? to,
      @JsonKey(name: "price") int? price,
      @JsonKey(name: "created_at") String? createdAt,
      @JsonKey(name: "updated_at") String? updatedAt});
}

/// @nodoc
class __$$RateImplCopyWithImpl<$Res>
    extends _$RateCopyWithImpl<$Res, _$RateImpl>
    implements _$$RateImplCopyWith<$Res> {
  __$$RateImplCopyWithImpl(_$RateImpl _value, $Res Function(_$RateImpl) _then)
      : super(_value, _then);

  /// Create a copy of Rate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? status = freezed,
    Object? planId = freezed,
    Object? from = freezed,
    Object? to = freezed,
    Object? price = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$RateImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      planId: freezed == planId
          ? _value.planId
          : planId // ignore: cast_nullable_to_non_nullable
              as int?,
      from: freezed == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as int?,
      to: freezed == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as int?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RateImpl implements _Rate {
  const _$RateImpl(
      {@JsonKey(name: "id") this.id,
      @JsonKey(name: "status") this.status,
      @JsonKey(name: "plan_id") this.planId,
      @JsonKey(name: "from") this.from,
      @JsonKey(name: "to") this.to,
      @JsonKey(name: "price") this.price,
      @JsonKey(name: "created_at") this.createdAt,
      @JsonKey(name: "updated_at") this.updatedAt});

  factory _$RateImpl.fromJson(Map<String, dynamic> json) =>
      _$$RateImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final int? id;
  @override
  @JsonKey(name: "status")
  final bool? status;
  @override
  @JsonKey(name: "plan_id")
  final int? planId;
  @override
  @JsonKey(name: "from")
  final int? from;
  @override
  @JsonKey(name: "to")
  final int? to;
  @override
  @JsonKey(name: "price")
  final int? price;
  @override
  @JsonKey(name: "created_at")
  final String? createdAt;
  @override
  @JsonKey(name: "updated_at")
  final String? updatedAt;

  @override
  String toString() {
    return 'Rate(id: $id, status: $status, planId: $planId, from: $from, to: $to, price: $price, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RateImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.planId, planId) || other.planId == planId) &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, status, planId, from, to, price, createdAt, updatedAt);

  /// Create a copy of Rate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RateImplCopyWith<_$RateImpl> get copyWith =>
      __$$RateImplCopyWithImpl<_$RateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RateImplToJson(
      this,
    );
  }
}

abstract class _Rate implements Rate {
  const factory _Rate(
      {@JsonKey(name: "id") final int? id,
      @JsonKey(name: "status") final bool? status,
      @JsonKey(name: "plan_id") final int? planId,
      @JsonKey(name: "from") final int? from,
      @JsonKey(name: "to") final int? to,
      @JsonKey(name: "price") final int? price,
      @JsonKey(name: "created_at") final String? createdAt,
      @JsonKey(name: "updated_at") final String? updatedAt}) = _$RateImpl;

  factory _Rate.fromJson(Map<String, dynamic> json) = _$RateImpl.fromJson;

  @override
  @JsonKey(name: "id")
  int? get id;
  @override
  @JsonKey(name: "status")
  bool? get status;
  @override
  @JsonKey(name: "plan_id")
  int? get planId;
  @override
  @JsonKey(name: "from")
  int? get from;
  @override
  @JsonKey(name: "to")
  int? get to;
  @override
  @JsonKey(name: "price")
  int? get price;
  @override
  @JsonKey(name: "created_at")
  String? get createdAt;
  @override
  @JsonKey(name: "updated_at")
  String? get updatedAt;

  /// Create a copy of Rate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RateImplCopyWith<_$RateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
