// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  @JsonKey(name: "id")
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "status")
  bool? get status => throw _privateConstructorUsedError;
  @JsonKey(name: "account_number")
  String? get accountNumber => throw _privateConstructorUsedError;
  @JsonKey(name: "online_offline")
  String? get onlineOffline => throw _privateConstructorUsedError;
  @JsonKey(name: "first_name")
  String? get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: "last_name")
  String? get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: "password")
  String? get password => throw _privateConstructorUsedError;
  @JsonKey(name: "email")
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: "image")
  String? get image => throw _privateConstructorUsedError;
  @JsonKey(name: "address")
  String? get address => throw _privateConstructorUsedError;
  @JsonKey(name: "phone")
  String? get phone => throw _privateConstructorUsedError;
  @JsonKey(name: "comment")
  String? get comment => throw _privateConstructorUsedError;
  @JsonKey(name: "user_plan")
  UserPlan? get userPlan => throw _privateConstructorUsedError;
  @JsonKey(name: "balance")
  Balance? get balance => throw _privateConstructorUsedError;

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "status") bool? status,
      @JsonKey(name: "account_number") String? accountNumber,
      @JsonKey(name: "online_offline") String? onlineOffline,
      @JsonKey(name: "first_name") String? firstName,
      @JsonKey(name: "last_name") String? lastName,
      @JsonKey(name: "password") String? password,
      @JsonKey(name: "email") String? email,
      @JsonKey(name: "image") String? image,
      @JsonKey(name: "address") String? address,
      @JsonKey(name: "phone") String? phone,
      @JsonKey(name: "comment") String? comment,
      @JsonKey(name: "user_plan") UserPlan? userPlan,
      @JsonKey(name: "balance") Balance? balance});

  $UserPlanCopyWith<$Res>? get userPlan;
  $BalanceCopyWith<$Res>? get balance;
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? status = freezed,
    Object? accountNumber = freezed,
    Object? onlineOffline = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? password = freezed,
    Object? email = freezed,
    Object? image = freezed,
    Object? address = freezed,
    Object? phone = freezed,
    Object? comment = freezed,
    Object? userPlan = freezed,
    Object? balance = freezed,
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
      accountNumber: freezed == accountNumber
          ? _value.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      onlineOffline: freezed == onlineOffline
          ? _value.onlineOffline
          : onlineOffline // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      userPlan: freezed == userPlan
          ? _value.userPlan
          : userPlan // ignore: cast_nullable_to_non_nullable
              as UserPlan?,
      balance: freezed == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as Balance?,
    ) as $Val);
  }

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserPlanCopyWith<$Res>? get userPlan {
    if (_value.userPlan == null) {
      return null;
    }

    return $UserPlanCopyWith<$Res>(_value.userPlan!, (value) {
      return _then(_value.copyWith(userPlan: value) as $Val);
    });
  }

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BalanceCopyWith<$Res>? get balance {
    if (_value.balance == null) {
      return null;
    }

    return $BalanceCopyWith<$Res>(_value.balance!, (value) {
      return _then(_value.copyWith(balance: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "status") bool? status,
      @JsonKey(name: "account_number") String? accountNumber,
      @JsonKey(name: "online_offline") String? onlineOffline,
      @JsonKey(name: "first_name") String? firstName,
      @JsonKey(name: "last_name") String? lastName,
      @JsonKey(name: "password") String? password,
      @JsonKey(name: "email") String? email,
      @JsonKey(name: "image") String? image,
      @JsonKey(name: "address") String? address,
      @JsonKey(name: "phone") String? phone,
      @JsonKey(name: "comment") String? comment,
      @JsonKey(name: "user_plan") UserPlan? userPlan,
      @JsonKey(name: "balance") Balance? balance});

  @override
  $UserPlanCopyWith<$Res>? get userPlan;
  @override
  $BalanceCopyWith<$Res>? get balance;
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? status = freezed,
    Object? accountNumber = freezed,
    Object? onlineOffline = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? password = freezed,
    Object? email = freezed,
    Object? image = freezed,
    Object? address = freezed,
    Object? phone = freezed,
    Object? comment = freezed,
    Object? userPlan = freezed,
    Object? balance = freezed,
  }) {
    return _then(_$UserImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      accountNumber: freezed == accountNumber
          ? _value.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      onlineOffline: freezed == onlineOffline
          ? _value.onlineOffline
          : onlineOffline // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      userPlan: freezed == userPlan
          ? _value.userPlan
          : userPlan // ignore: cast_nullable_to_non_nullable
              as UserPlan?,
      balance: freezed == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as Balance?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserImpl implements _User {
  const _$UserImpl(
      {@JsonKey(name: "id") this.id,
      @JsonKey(name: "status") this.status,
      @JsonKey(name: "account_number") this.accountNumber,
      @JsonKey(name: "online_offline") this.onlineOffline,
      @JsonKey(name: "first_name") this.firstName,
      @JsonKey(name: "last_name") this.lastName,
      @JsonKey(name: "password") this.password,
      @JsonKey(name: "email") this.email,
      @JsonKey(name: "image") this.image,
      @JsonKey(name: "address") this.address,
      @JsonKey(name: "phone") this.phone,
      @JsonKey(name: "comment") this.comment,
      @JsonKey(name: "user_plan") this.userPlan,
      @JsonKey(name: "balance") this.balance});

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final int? id;
  @override
  @JsonKey(name: "status")
  final bool? status;
  @override
  @JsonKey(name: "account_number")
  final String? accountNumber;
  @override
  @JsonKey(name: "online_offline")
  final String? onlineOffline;
  @override
  @JsonKey(name: "first_name")
  final String? firstName;
  @override
  @JsonKey(name: "last_name")
  final String? lastName;
  @override
  @JsonKey(name: "password")
  final String? password;
  @override
  @JsonKey(name: "email")
  final String? email;
  @override
  @JsonKey(name: "image")
  final String? image;
  @override
  @JsonKey(name: "address")
  final String? address;
  @override
  @JsonKey(name: "phone")
  final String? phone;
  @override
  @JsonKey(name: "comment")
  final String? comment;
  @override
  @JsonKey(name: "user_plan")
  final UserPlan? userPlan;
  @override
  @JsonKey(name: "balance")
  final Balance? balance;

  @override
  String toString() {
    return 'User(id: $id, status: $status, accountNumber: $accountNumber, onlineOffline: $onlineOffline, firstName: $firstName, lastName: $lastName, password: $password, email: $email, image: $image, address: $address, phone: $phone, comment: $comment, userPlan: $userPlan, balance: $balance)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.accountNumber, accountNumber) ||
                other.accountNumber == accountNumber) &&
            (identical(other.onlineOffline, onlineOffline) ||
                other.onlineOffline == onlineOffline) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.userPlan, userPlan) ||
                other.userPlan == userPlan) &&
            (identical(other.balance, balance) || other.balance == balance));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      status,
      accountNumber,
      onlineOffline,
      firstName,
      lastName,
      password,
      email,
      image,
      address,
      phone,
      comment,
      userPlan,
      balance);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(
      this,
    );
  }
}

abstract class _User implements User {
  const factory _User(
      {@JsonKey(name: "id") final int? id,
      @JsonKey(name: "status") final bool? status,
      @JsonKey(name: "account_number") final String? accountNumber,
      @JsonKey(name: "online_offline") final String? onlineOffline,
      @JsonKey(name: "first_name") final String? firstName,
      @JsonKey(name: "last_name") final String? lastName,
      @JsonKey(name: "password") final String? password,
      @JsonKey(name: "email") final String? email,
      @JsonKey(name: "image") final String? image,
      @JsonKey(name: "address") final String? address,
      @JsonKey(name: "phone") final String? phone,
      @JsonKey(name: "comment") final String? comment,
      @JsonKey(name: "user_plan") final UserPlan? userPlan,
      @JsonKey(name: "balance") final Balance? balance}) = _$UserImpl;

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  @JsonKey(name: "id")
  int? get id;
  @override
  @JsonKey(name: "status")
  bool? get status;
  @override
  @JsonKey(name: "account_number")
  String? get accountNumber;
  @override
  @JsonKey(name: "online_offline")
  String? get onlineOffline;
  @override
  @JsonKey(name: "first_name")
  String? get firstName;
  @override
  @JsonKey(name: "last_name")
  String? get lastName;
  @override
  @JsonKey(name: "password")
  String? get password;
  @override
  @JsonKey(name: "email")
  String? get email;
  @override
  @JsonKey(name: "image")
  String? get image;
  @override
  @JsonKey(name: "address")
  String? get address;
  @override
  @JsonKey(name: "phone")
  String? get phone;
  @override
  @JsonKey(name: "comment")
  String? get comment;
  @override
  @JsonKey(name: "user_plan")
  UserPlan? get userPlan;
  @override
  @JsonKey(name: "balance")
  Balance? get balance;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
