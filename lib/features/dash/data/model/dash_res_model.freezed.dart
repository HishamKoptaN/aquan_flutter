// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dash_res_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DashResModel _$DashResModelFromJson(Map<String, dynamic> json) {
  return _DashResModel.fromJson(json);
}

/// @nodoc
mixin _$DashResModel {
  @JsonKey(name: "exchange_rates")
  List<Currency>? get exchangeRates => throw _privateConstructorUsedError;
  @JsonKey(name: "selling_prices")
  List<SellingPrice>? get sellingPrices => throw _privateConstructorUsedError;
  @JsonKey(name: "buying_prices")
  List<BuyingPrice>? get buyingPrices => throw _privateConstructorUsedError;
  @JsonKey(name: "currencies")
  List<Currency>? get currencies => throw _privateConstructorUsedError;
  @JsonKey(name: "rates")
  List<Rate>? get rates => throw _privateConstructorUsedError;
  @JsonKey(name: "commission")
  int? get commission => throw _privateConstructorUsedError;

  /// Serializes this DashResModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DashResModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DashResModelCopyWith<DashResModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashResModelCopyWith<$Res> {
  factory $DashResModelCopyWith(
          DashResModel value, $Res Function(DashResModel) then) =
      _$DashResModelCopyWithImpl<$Res, DashResModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "exchange_rates") List<Currency>? exchangeRates,
      @JsonKey(name: "selling_prices") List<SellingPrice>? sellingPrices,
      @JsonKey(name: "buying_prices") List<BuyingPrice>? buyingPrices,
      @JsonKey(name: "currencies") List<Currency>? currencies,
      @JsonKey(name: "rates") List<Rate>? rates,
      @JsonKey(name: "commission") int? commission});
}

/// @nodoc
class _$DashResModelCopyWithImpl<$Res, $Val extends DashResModel>
    implements $DashResModelCopyWith<$Res> {
  _$DashResModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DashResModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exchangeRates = freezed,
    Object? sellingPrices = freezed,
    Object? buyingPrices = freezed,
    Object? currencies = freezed,
    Object? rates = freezed,
    Object? commission = freezed,
  }) {
    return _then(_value.copyWith(
      exchangeRates: freezed == exchangeRates
          ? _value.exchangeRates
          : exchangeRates // ignore: cast_nullable_to_non_nullable
              as List<Currency>?,
      sellingPrices: freezed == sellingPrices
          ? _value.sellingPrices
          : sellingPrices // ignore: cast_nullable_to_non_nullable
              as List<SellingPrice>?,
      buyingPrices: freezed == buyingPrices
          ? _value.buyingPrices
          : buyingPrices // ignore: cast_nullable_to_non_nullable
              as List<BuyingPrice>?,
      currencies: freezed == currencies
          ? _value.currencies
          : currencies // ignore: cast_nullable_to_non_nullable
              as List<Currency>?,
      rates: freezed == rates
          ? _value.rates
          : rates // ignore: cast_nullable_to_non_nullable
              as List<Rate>?,
      commission: freezed == commission
          ? _value.commission
          : commission // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DashResModelImplCopyWith<$Res>
    implements $DashResModelCopyWith<$Res> {
  factory _$$DashResModelImplCopyWith(
          _$DashResModelImpl value, $Res Function(_$DashResModelImpl) then) =
      __$$DashResModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "exchange_rates") List<Currency>? exchangeRates,
      @JsonKey(name: "selling_prices") List<SellingPrice>? sellingPrices,
      @JsonKey(name: "buying_prices") List<BuyingPrice>? buyingPrices,
      @JsonKey(name: "currencies") List<Currency>? currencies,
      @JsonKey(name: "rates") List<Rate>? rates,
      @JsonKey(name: "commission") int? commission});
}

/// @nodoc
class __$$DashResModelImplCopyWithImpl<$Res>
    extends _$DashResModelCopyWithImpl<$Res, _$DashResModelImpl>
    implements _$$DashResModelImplCopyWith<$Res> {
  __$$DashResModelImplCopyWithImpl(
      _$DashResModelImpl _value, $Res Function(_$DashResModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of DashResModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exchangeRates = freezed,
    Object? sellingPrices = freezed,
    Object? buyingPrices = freezed,
    Object? currencies = freezed,
    Object? rates = freezed,
    Object? commission = freezed,
  }) {
    return _then(_$DashResModelImpl(
      exchangeRates: freezed == exchangeRates
          ? _value._exchangeRates
          : exchangeRates // ignore: cast_nullable_to_non_nullable
              as List<Currency>?,
      sellingPrices: freezed == sellingPrices
          ? _value._sellingPrices
          : sellingPrices // ignore: cast_nullable_to_non_nullable
              as List<SellingPrice>?,
      buyingPrices: freezed == buyingPrices
          ? _value._buyingPrices
          : buyingPrices // ignore: cast_nullable_to_non_nullable
              as List<BuyingPrice>?,
      currencies: freezed == currencies
          ? _value._currencies
          : currencies // ignore: cast_nullable_to_non_nullable
              as List<Currency>?,
      rates: freezed == rates
          ? _value._rates
          : rates // ignore: cast_nullable_to_non_nullable
              as List<Rate>?,
      commission: freezed == commission
          ? _value.commission
          : commission // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DashResModelImpl implements _DashResModel {
  const _$DashResModelImpl(
      {@JsonKey(name: "exchange_rates") final List<Currency>? exchangeRates,
      @JsonKey(name: "selling_prices") final List<SellingPrice>? sellingPrices,
      @JsonKey(name: "buying_prices") final List<BuyingPrice>? buyingPrices,
      @JsonKey(name: "currencies") final List<Currency>? currencies,
      @JsonKey(name: "rates") final List<Rate>? rates,
      @JsonKey(name: "commission") this.commission})
      : _exchangeRates = exchangeRates,
        _sellingPrices = sellingPrices,
        _buyingPrices = buyingPrices,
        _currencies = currencies,
        _rates = rates;

  factory _$DashResModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DashResModelImplFromJson(json);

  final List<Currency>? _exchangeRates;
  @override
  @JsonKey(name: "exchange_rates")
  List<Currency>? get exchangeRates {
    final value = _exchangeRates;
    if (value == null) return null;
    if (_exchangeRates is EqualUnmodifiableListView) return _exchangeRates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<SellingPrice>? _sellingPrices;
  @override
  @JsonKey(name: "selling_prices")
  List<SellingPrice>? get sellingPrices {
    final value = _sellingPrices;
    if (value == null) return null;
    if (_sellingPrices is EqualUnmodifiableListView) return _sellingPrices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<BuyingPrice>? _buyingPrices;
  @override
  @JsonKey(name: "buying_prices")
  List<BuyingPrice>? get buyingPrices {
    final value = _buyingPrices;
    if (value == null) return null;
    if (_buyingPrices is EqualUnmodifiableListView) return _buyingPrices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

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

  @override
  @JsonKey(name: "commission")
  final int? commission;

  @override
  String toString() {
    return 'DashResModel(exchangeRates: $exchangeRates, sellingPrices: $sellingPrices, buyingPrices: $buyingPrices, currencies: $currencies, rates: $rates, commission: $commission)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashResModelImpl &&
            const DeepCollectionEquality()
                .equals(other._exchangeRates, _exchangeRates) &&
            const DeepCollectionEquality()
                .equals(other._sellingPrices, _sellingPrices) &&
            const DeepCollectionEquality()
                .equals(other._buyingPrices, _buyingPrices) &&
            const DeepCollectionEquality()
                .equals(other._currencies, _currencies) &&
            const DeepCollectionEquality().equals(other._rates, _rates) &&
            (identical(other.commission, commission) ||
                other.commission == commission));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_exchangeRates),
      const DeepCollectionEquality().hash(_sellingPrices),
      const DeepCollectionEquality().hash(_buyingPrices),
      const DeepCollectionEquality().hash(_currencies),
      const DeepCollectionEquality().hash(_rates),
      commission);

  /// Create a copy of DashResModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DashResModelImplCopyWith<_$DashResModelImpl> get copyWith =>
      __$$DashResModelImplCopyWithImpl<_$DashResModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DashResModelImplToJson(
      this,
    );
  }
}

abstract class _DashResModel implements DashResModel {
  const factory _DashResModel(
      {@JsonKey(name: "exchange_rates") final List<Currency>? exchangeRates,
      @JsonKey(name: "selling_prices") final List<SellingPrice>? sellingPrices,
      @JsonKey(name: "buying_prices") final List<BuyingPrice>? buyingPrices,
      @JsonKey(name: "currencies") final List<Currency>? currencies,
      @JsonKey(name: "rates") final List<Rate>? rates,
      @JsonKey(name: "commission") final int? commission}) = _$DashResModelImpl;

  factory _DashResModel.fromJson(Map<String, dynamic> json) =
      _$DashResModelImpl.fromJson;

  @override
  @JsonKey(name: "exchange_rates")
  List<Currency>? get exchangeRates;
  @override
  @JsonKey(name: "selling_prices")
  List<SellingPrice>? get sellingPrices;
  @override
  @JsonKey(name: "buying_prices")
  List<BuyingPrice>? get buyingPrices;
  @override
  @JsonKey(name: "currencies")
  List<Currency>? get currencies;
  @override
  @JsonKey(name: "rates")
  List<Rate>? get rates;
  @override
  @JsonKey(name: "commission")
  int? get commission;

  /// Create a copy of DashResModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DashResModelImplCopyWith<_$DashResModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BuyingPrice _$BuyingPriceFromJson(Map<String, dynamic> json) {
  return _BuyingPrice.fromJson(json);
}

/// @nodoc
mixin _$BuyingPrice {
  @JsonKey(name: "price")
  int? get price => throw _privateConstructorUsedError;
  @JsonKey(name: "updated_at")
  String? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: "to")
  int? get to => throw _privateConstructorUsedError;

  /// Serializes this BuyingPrice to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BuyingPrice
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BuyingPriceCopyWith<BuyingPrice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BuyingPriceCopyWith<$Res> {
  factory $BuyingPriceCopyWith(
          BuyingPrice value, $Res Function(BuyingPrice) then) =
      _$BuyingPriceCopyWithImpl<$Res, BuyingPrice>;
  @useResult
  $Res call(
      {@JsonKey(name: "price") int? price,
      @JsonKey(name: "updated_at") String? updatedAt,
      @JsonKey(name: "to") int? to});
}

/// @nodoc
class _$BuyingPriceCopyWithImpl<$Res, $Val extends BuyingPrice>
    implements $BuyingPriceCopyWith<$Res> {
  _$BuyingPriceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BuyingPrice
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? price = freezed,
    Object? updatedAt = freezed,
    Object? to = freezed,
  }) {
    return _then(_value.copyWith(
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      to: freezed == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BuyingPriceImplCopyWith<$Res>
    implements $BuyingPriceCopyWith<$Res> {
  factory _$$BuyingPriceImplCopyWith(
          _$BuyingPriceImpl value, $Res Function(_$BuyingPriceImpl) then) =
      __$$BuyingPriceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "price") int? price,
      @JsonKey(name: "updated_at") String? updatedAt,
      @JsonKey(name: "to") int? to});
}

/// @nodoc
class __$$BuyingPriceImplCopyWithImpl<$Res>
    extends _$BuyingPriceCopyWithImpl<$Res, _$BuyingPriceImpl>
    implements _$$BuyingPriceImplCopyWith<$Res> {
  __$$BuyingPriceImplCopyWithImpl(
      _$BuyingPriceImpl _value, $Res Function(_$BuyingPriceImpl) _then)
      : super(_value, _then);

  /// Create a copy of BuyingPrice
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? price = freezed,
    Object? updatedAt = freezed,
    Object? to = freezed,
  }) {
    return _then(_$BuyingPriceImpl(
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      to: freezed == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BuyingPriceImpl implements _BuyingPrice {
  const _$BuyingPriceImpl(
      {@JsonKey(name: "price") this.price,
      @JsonKey(name: "updated_at") this.updatedAt,
      @JsonKey(name: "to") this.to});

  factory _$BuyingPriceImpl.fromJson(Map<String, dynamic> json) =>
      _$$BuyingPriceImplFromJson(json);

  @override
  @JsonKey(name: "price")
  final int? price;
  @override
  @JsonKey(name: "updated_at")
  final String? updatedAt;
  @override
  @JsonKey(name: "to")
  final int? to;

  @override
  String toString() {
    return 'BuyingPrice(price: $price, updatedAt: $updatedAt, to: $to)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BuyingPriceImpl &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.to, to) || other.to == to));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, price, updatedAt, to);

  /// Create a copy of BuyingPrice
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BuyingPriceImplCopyWith<_$BuyingPriceImpl> get copyWith =>
      __$$BuyingPriceImplCopyWithImpl<_$BuyingPriceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BuyingPriceImplToJson(
      this,
    );
  }
}

abstract class _BuyingPrice implements BuyingPrice {
  const factory _BuyingPrice(
      {@JsonKey(name: "price") final int? price,
      @JsonKey(name: "updated_at") final String? updatedAt,
      @JsonKey(name: "to") final int? to}) = _$BuyingPriceImpl;

  factory _BuyingPrice.fromJson(Map<String, dynamic> json) =
      _$BuyingPriceImpl.fromJson;

  @override
  @JsonKey(name: "price")
  int? get price;
  @override
  @JsonKey(name: "updated_at")
  String? get updatedAt;
  @override
  @JsonKey(name: "to")
  int? get to;

  /// Create a copy of BuyingPrice
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BuyingPriceImplCopyWith<_$BuyingPriceImpl> get copyWith =>
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

SellingPrice _$SellingPriceFromJson(Map<String, dynamic> json) {
  return _SellingPrice.fromJson(json);
}

/// @nodoc
mixin _$SellingPrice {
  @JsonKey(name: "price")
  int? get price => throw _privateConstructorUsedError;
  @JsonKey(name: "updated_at")
  String? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: "from")
  int? get from => throw _privateConstructorUsedError;

  /// Serializes this SellingPrice to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SellingPrice
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SellingPriceCopyWith<SellingPrice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SellingPriceCopyWith<$Res> {
  factory $SellingPriceCopyWith(
          SellingPrice value, $Res Function(SellingPrice) then) =
      _$SellingPriceCopyWithImpl<$Res, SellingPrice>;
  @useResult
  $Res call(
      {@JsonKey(name: "price") int? price,
      @JsonKey(name: "updated_at") String? updatedAt,
      @JsonKey(name: "from") int? from});
}

/// @nodoc
class _$SellingPriceCopyWithImpl<$Res, $Val extends SellingPrice>
    implements $SellingPriceCopyWith<$Res> {
  _$SellingPriceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SellingPrice
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? price = freezed,
    Object? updatedAt = freezed,
    Object? from = freezed,
  }) {
    return _then(_value.copyWith(
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      from: freezed == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SellingPriceImplCopyWith<$Res>
    implements $SellingPriceCopyWith<$Res> {
  factory _$$SellingPriceImplCopyWith(
          _$SellingPriceImpl value, $Res Function(_$SellingPriceImpl) then) =
      __$$SellingPriceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "price") int? price,
      @JsonKey(name: "updated_at") String? updatedAt,
      @JsonKey(name: "from") int? from});
}

/// @nodoc
class __$$SellingPriceImplCopyWithImpl<$Res>
    extends _$SellingPriceCopyWithImpl<$Res, _$SellingPriceImpl>
    implements _$$SellingPriceImplCopyWith<$Res> {
  __$$SellingPriceImplCopyWithImpl(
      _$SellingPriceImpl _value, $Res Function(_$SellingPriceImpl) _then)
      : super(_value, _then);

  /// Create a copy of SellingPrice
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? price = freezed,
    Object? updatedAt = freezed,
    Object? from = freezed,
  }) {
    return _then(_$SellingPriceImpl(
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      from: freezed == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SellingPriceImpl implements _SellingPrice {
  const _$SellingPriceImpl(
      {@JsonKey(name: "price") this.price,
      @JsonKey(name: "updated_at") this.updatedAt,
      @JsonKey(name: "from") this.from});

  factory _$SellingPriceImpl.fromJson(Map<String, dynamic> json) =>
      _$$SellingPriceImplFromJson(json);

  @override
  @JsonKey(name: "price")
  final int? price;
  @override
  @JsonKey(name: "updated_at")
  final String? updatedAt;
  @override
  @JsonKey(name: "from")
  final int? from;

  @override
  String toString() {
    return 'SellingPrice(price: $price, updatedAt: $updatedAt, from: $from)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SellingPriceImpl &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.from, from) || other.from == from));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, price, updatedAt, from);

  /// Create a copy of SellingPrice
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SellingPriceImplCopyWith<_$SellingPriceImpl> get copyWith =>
      __$$SellingPriceImplCopyWithImpl<_$SellingPriceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SellingPriceImplToJson(
      this,
    );
  }
}

abstract class _SellingPrice implements SellingPrice {
  const factory _SellingPrice(
      {@JsonKey(name: "price") final int? price,
      @JsonKey(name: "updated_at") final String? updatedAt,
      @JsonKey(name: "from") final int? from}) = _$SellingPriceImpl;

  factory _SellingPrice.fromJson(Map<String, dynamic> json) =
      _$SellingPriceImpl.fromJson;

  @override
  @JsonKey(name: "price")
  int? get price;
  @override
  @JsonKey(name: "updated_at")
  String? get updatedAt;
  @override
  @JsonKey(name: "from")
  int? get from;

  /// Create a copy of SellingPrice
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SellingPriceImplCopyWith<_$SellingPriceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
