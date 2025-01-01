// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'withdraw_rates_res_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WithdrawRatesResModel _$WithdrawRatesResModelFromJson(
    Map<String, dynamic> json) {
  return _WithdrawRatesResModel.fromJson(json);
}

/// @nodoc
mixin _$WithdrawRatesResModel {
  @JsonKey(name: "total_withdrawals")
  double get totalWithdrawals => throw _privateConstructorUsedError;
  @JsonKey(name: "from_binance_rates")
  List<FromBinanceRate> get fromBinanceRates =>
      throw _privateConstructorUsedError;

  /// Serializes this WithdrawRatesResModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WithdrawRatesResModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WithdrawRatesResModelCopyWith<WithdrawRatesResModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WithdrawRatesResModelCopyWith<$Res> {
  factory $WithdrawRatesResModelCopyWith(WithdrawRatesResModel value,
          $Res Function(WithdrawRatesResModel) then) =
      _$WithdrawRatesResModelCopyWithImpl<$Res, WithdrawRatesResModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "total_withdrawals") double totalWithdrawals,
      @JsonKey(name: "from_binance_rates")
      List<FromBinanceRate> fromBinanceRates});
}

/// @nodoc
class _$WithdrawRatesResModelCopyWithImpl<$Res,
        $Val extends WithdrawRatesResModel>
    implements $WithdrawRatesResModelCopyWith<$Res> {
  _$WithdrawRatesResModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WithdrawRatesResModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalWithdrawals = null,
    Object? fromBinanceRates = null,
  }) {
    return _then(_value.copyWith(
      totalWithdrawals: null == totalWithdrawals
          ? _value.totalWithdrawals
          : totalWithdrawals // ignore: cast_nullable_to_non_nullable
              as double,
      fromBinanceRates: null == fromBinanceRates
          ? _value.fromBinanceRates
          : fromBinanceRates // ignore: cast_nullable_to_non_nullable
              as List<FromBinanceRate>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WithdrawRatesResModelImplCopyWith<$Res>
    implements $WithdrawRatesResModelCopyWith<$Res> {
  factory _$$WithdrawRatesResModelImplCopyWith(
          _$WithdrawRatesResModelImpl value,
          $Res Function(_$WithdrawRatesResModelImpl) then) =
      __$$WithdrawRatesResModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "total_withdrawals") double totalWithdrawals,
      @JsonKey(name: "from_binance_rates")
      List<FromBinanceRate> fromBinanceRates});
}

/// @nodoc
class __$$WithdrawRatesResModelImplCopyWithImpl<$Res>
    extends _$WithdrawRatesResModelCopyWithImpl<$Res,
        _$WithdrawRatesResModelImpl>
    implements _$$WithdrawRatesResModelImplCopyWith<$Res> {
  __$$WithdrawRatesResModelImplCopyWithImpl(_$WithdrawRatesResModelImpl _value,
      $Res Function(_$WithdrawRatesResModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of WithdrawRatesResModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalWithdrawals = null,
    Object? fromBinanceRates = null,
  }) {
    return _then(_$WithdrawRatesResModelImpl(
      totalWithdrawals: null == totalWithdrawals
          ? _value.totalWithdrawals
          : totalWithdrawals // ignore: cast_nullable_to_non_nullable
              as double,
      fromBinanceRates: null == fromBinanceRates
          ? _value._fromBinanceRates
          : fromBinanceRates // ignore: cast_nullable_to_non_nullable
              as List<FromBinanceRate>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WithdrawRatesResModelImpl implements _WithdrawRatesResModel {
  const _$WithdrawRatesResModelImpl(
      {@JsonKey(name: "total_withdrawals") this.totalWithdrawals = 0.0,
      @JsonKey(name: "from_binance_rates")
      final List<FromBinanceRate> fromBinanceRates = const []})
      : _fromBinanceRates = fromBinanceRates;

  factory _$WithdrawRatesResModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WithdrawRatesResModelImplFromJson(json);

  @override
  @JsonKey(name: "total_withdrawals")
  final double totalWithdrawals;
  final List<FromBinanceRate> _fromBinanceRates;
  @override
  @JsonKey(name: "from_binance_rates")
  List<FromBinanceRate> get fromBinanceRates {
    if (_fromBinanceRates is EqualUnmodifiableListView)
      return _fromBinanceRates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_fromBinanceRates);
  }

  @override
  String toString() {
    return 'WithdrawRatesResModel(totalWithdrawals: $totalWithdrawals, fromBinanceRates: $fromBinanceRates)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WithdrawRatesResModelImpl &&
            (identical(other.totalWithdrawals, totalWithdrawals) ||
                other.totalWithdrawals == totalWithdrawals) &&
            const DeepCollectionEquality()
                .equals(other._fromBinanceRates, _fromBinanceRates));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, totalWithdrawals,
      const DeepCollectionEquality().hash(_fromBinanceRates));

  /// Create a copy of WithdrawRatesResModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WithdrawRatesResModelImplCopyWith<_$WithdrawRatesResModelImpl>
      get copyWith => __$$WithdrawRatesResModelImplCopyWithImpl<
          _$WithdrawRatesResModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WithdrawRatesResModelImplToJson(
      this,
    );
  }
}

abstract class _WithdrawRatesResModel implements WithdrawRatesResModel {
  const factory _WithdrawRatesResModel(
          {@JsonKey(name: "total_withdrawals") final double totalWithdrawals,
          @JsonKey(name: "from_binance_rates")
          final List<FromBinanceRate> fromBinanceRates}) =
      _$WithdrawRatesResModelImpl;

  factory _WithdrawRatesResModel.fromJson(Map<String, dynamic> json) =
      _$WithdrawRatesResModelImpl.fromJson;

  @override
  @JsonKey(name: "total_withdrawals")
  double get totalWithdrawals;
  @override
  @JsonKey(name: "from_binance_rates")
  List<FromBinanceRate> get fromBinanceRates;

  /// Create a copy of WithdrawRatesResModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WithdrawRatesResModelImplCopyWith<_$WithdrawRatesResModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

FromBinanceRate _$FromBinanceRateFromJson(Map<String, dynamic> json) {
  return _FromBinanceRate.fromJson(json);
}

/// @nodoc
mixin _$FromBinanceRate {
  @JsonKey(name: "price")
  int get price => throw _privateConstructorUsedError;
  @JsonKey(name: "updated_at")
  String get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: "currency_name")
  String get currencyName => throw _privateConstructorUsedError;
  @JsonKey(name: "to")
  int get to => throw _privateConstructorUsedError;

  /// Serializes this FromBinanceRate to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FromBinanceRate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FromBinanceRateCopyWith<FromBinanceRate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FromBinanceRateCopyWith<$Res> {
  factory $FromBinanceRateCopyWith(
          FromBinanceRate value, $Res Function(FromBinanceRate) then) =
      _$FromBinanceRateCopyWithImpl<$Res, FromBinanceRate>;
  @useResult
  $Res call(
      {@JsonKey(name: "price") int price,
      @JsonKey(name: "updated_at") String updatedAt,
      @JsonKey(name: "currency_name") String currencyName,
      @JsonKey(name: "to") int to});
}

/// @nodoc
class _$FromBinanceRateCopyWithImpl<$Res, $Val extends FromBinanceRate>
    implements $FromBinanceRateCopyWith<$Res> {
  _$FromBinanceRateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FromBinanceRate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? price = null,
    Object? updatedAt = null,
    Object? currencyName = null,
    Object? to = null,
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
      to: null == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FromBinanceRateImplCopyWith<$Res>
    implements $FromBinanceRateCopyWith<$Res> {
  factory _$$FromBinanceRateImplCopyWith(_$FromBinanceRateImpl value,
          $Res Function(_$FromBinanceRateImpl) then) =
      __$$FromBinanceRateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "price") int price,
      @JsonKey(name: "updated_at") String updatedAt,
      @JsonKey(name: "currency_name") String currencyName,
      @JsonKey(name: "to") int to});
}

/// @nodoc
class __$$FromBinanceRateImplCopyWithImpl<$Res>
    extends _$FromBinanceRateCopyWithImpl<$Res, _$FromBinanceRateImpl>
    implements _$$FromBinanceRateImplCopyWith<$Res> {
  __$$FromBinanceRateImplCopyWithImpl(
      _$FromBinanceRateImpl _value, $Res Function(_$FromBinanceRateImpl) _then)
      : super(_value, _then);

  /// Create a copy of FromBinanceRate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? price = null,
    Object? updatedAt = null,
    Object? currencyName = null,
    Object? to = null,
  }) {
    return _then(_$FromBinanceRateImpl(
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
      to: null == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FromBinanceRateImpl implements _FromBinanceRate {
  const _$FromBinanceRateImpl(
      {@JsonKey(name: "price") this.price = 0,
      @JsonKey(name: "updated_at") this.updatedAt = "",
      @JsonKey(name: "currency_name") this.currencyName = "",
      @JsonKey(name: "to") this.to = 0});

  factory _$FromBinanceRateImpl.fromJson(Map<String, dynamic> json) =>
      _$$FromBinanceRateImplFromJson(json);

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
  @JsonKey(name: "to")
  final int to;

  @override
  String toString() {
    return 'FromBinanceRate(price: $price, updatedAt: $updatedAt, currencyName: $currencyName, to: $to)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FromBinanceRateImpl &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.currencyName, currencyName) ||
                other.currencyName == currencyName) &&
            (identical(other.to, to) || other.to == to));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, price, updatedAt, currencyName, to);

  /// Create a copy of FromBinanceRate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FromBinanceRateImplCopyWith<_$FromBinanceRateImpl> get copyWith =>
      __$$FromBinanceRateImplCopyWithImpl<_$FromBinanceRateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FromBinanceRateImplToJson(
      this,
    );
  }
}

abstract class _FromBinanceRate implements FromBinanceRate {
  const factory _FromBinanceRate(
      {@JsonKey(name: "price") final int price,
      @JsonKey(name: "updated_at") final String updatedAt,
      @JsonKey(name: "currency_name") final String currencyName,
      @JsonKey(name: "to") final int to}) = _$FromBinanceRateImpl;

  factory _FromBinanceRate.fromJson(Map<String, dynamic> json) =
      _$FromBinanceRateImpl.fromJson;

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
  @JsonKey(name: "to")
  int get to;

  /// Create a copy of FromBinanceRate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FromBinanceRateImplCopyWith<_$FromBinanceRateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
