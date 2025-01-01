// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'msg_send.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MsgSend _$MsgSendFromJson(Map<String, dynamic> json) {
  return _MsgSend.fromJson(json);
}

/// @nodoc
mixin _$MsgSend {
  @JsonKey(name: "content")
  String? get content => throw _privateConstructorUsedError;
  @JsonKey(name: "sender_id")
  int? get senderId => throw _privateConstructorUsedError;
  @JsonKey(name: "is_file")
  bool? get isFile => throw _privateConstructorUsedError;
  @JsonKey(name: "sent_at")
  DateTime? get sentAt => throw _privateConstructorUsedError;
  @JsonKey(name: "read_at")
  DateTime? get readAt => throw _privateConstructorUsedError;

  /// Serializes this MsgSend to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MsgSend
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MsgSendCopyWith<MsgSend> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MsgSendCopyWith<$Res> {
  factory $MsgSendCopyWith(MsgSend value, $Res Function(MsgSend) then) =
      _$MsgSendCopyWithImpl<$Res, MsgSend>;
  @useResult
  $Res call(
      {@JsonKey(name: "content") String? content,
      @JsonKey(name: "sender_id") int? senderId,
      @JsonKey(name: "is_file") bool? isFile,
      @JsonKey(name: "sent_at") DateTime? sentAt,
      @JsonKey(name: "read_at") DateTime? readAt});
}

/// @nodoc
class _$MsgSendCopyWithImpl<$Res, $Val extends MsgSend>
    implements $MsgSendCopyWith<$Res> {
  _$MsgSendCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MsgSend
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = freezed,
    Object? senderId = freezed,
    Object? isFile = freezed,
    Object? sentAt = freezed,
    Object? readAt = freezed,
  }) {
    return _then(_value.copyWith(
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      senderId: freezed == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as int?,
      isFile: freezed == isFile
          ? _value.isFile
          : isFile // ignore: cast_nullable_to_non_nullable
              as bool?,
      sentAt: freezed == sentAt
          ? _value.sentAt
          : sentAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      readAt: freezed == readAt
          ? _value.readAt
          : readAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MsgSendImplCopyWith<$Res> implements $MsgSendCopyWith<$Res> {
  factory _$$MsgSendImplCopyWith(
          _$MsgSendImpl value, $Res Function(_$MsgSendImpl) then) =
      __$$MsgSendImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "content") String? content,
      @JsonKey(name: "sender_id") int? senderId,
      @JsonKey(name: "is_file") bool? isFile,
      @JsonKey(name: "sent_at") DateTime? sentAt,
      @JsonKey(name: "read_at") DateTime? readAt});
}

/// @nodoc
class __$$MsgSendImplCopyWithImpl<$Res>
    extends _$MsgSendCopyWithImpl<$Res, _$MsgSendImpl>
    implements _$$MsgSendImplCopyWith<$Res> {
  __$$MsgSendImplCopyWithImpl(
      _$MsgSendImpl _value, $Res Function(_$MsgSendImpl) _then)
      : super(_value, _then);

  /// Create a copy of MsgSend
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = freezed,
    Object? senderId = freezed,
    Object? isFile = freezed,
    Object? sentAt = freezed,
    Object? readAt = freezed,
  }) {
    return _then(_$MsgSendImpl(
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      senderId: freezed == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as int?,
      isFile: freezed == isFile
          ? _value.isFile
          : isFile // ignore: cast_nullable_to_non_nullable
              as bool?,
      sentAt: freezed == sentAt
          ? _value.sentAt
          : sentAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      readAt: freezed == readAt
          ? _value.readAt
          : readAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MsgSendImpl implements _MsgSend {
  const _$MsgSendImpl(
      {@JsonKey(name: "content") this.content,
      @JsonKey(name: "sender_id") this.senderId,
      @JsonKey(name: "is_file") this.isFile,
      @JsonKey(name: "sent_at") this.sentAt,
      @JsonKey(name: "read_at") this.readAt});

  factory _$MsgSendImpl.fromJson(Map<String, dynamic> json) =>
      _$$MsgSendImplFromJson(json);

  @override
  @JsonKey(name: "content")
  final String? content;
  @override
  @JsonKey(name: "sender_id")
  final int? senderId;
  @override
  @JsonKey(name: "is_file")
  final bool? isFile;
  @override
  @JsonKey(name: "sent_at")
  final DateTime? sentAt;
  @override
  @JsonKey(name: "read_at")
  final DateTime? readAt;

  @override
  String toString() {
    return 'MsgSend(content: $content, senderId: $senderId, isFile: $isFile, sentAt: $sentAt, readAt: $readAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MsgSendImpl &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.isFile, isFile) || other.isFile == isFile) &&
            (identical(other.sentAt, sentAt) || other.sentAt == sentAt) &&
            (identical(other.readAt, readAt) || other.readAt == readAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, content, senderId, isFile, sentAt, readAt);

  /// Create a copy of MsgSend
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MsgSendImplCopyWith<_$MsgSendImpl> get copyWith =>
      __$$MsgSendImplCopyWithImpl<_$MsgSendImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MsgSendImplToJson(
      this,
    );
  }
}

abstract class _MsgSend implements MsgSend {
  const factory _MsgSend(
      {@JsonKey(name: "content") final String? content,
      @JsonKey(name: "sender_id") final int? senderId,
      @JsonKey(name: "is_file") final bool? isFile,
      @JsonKey(name: "sent_at") final DateTime? sentAt,
      @JsonKey(name: "read_at") final DateTime? readAt}) = _$MsgSendImpl;

  factory _MsgSend.fromJson(Map<String, dynamic> json) = _$MsgSendImpl.fromJson;

  @override
  @JsonKey(name: "content")
  String? get content;
  @override
  @JsonKey(name: "sender_id")
  int? get senderId;
  @override
  @JsonKey(name: "is_file")
  bool? get isFile;
  @override
  @JsonKey(name: "sent_at")
  DateTime? get sentAt;
  @override
  @JsonKey(name: "read_at")
  DateTime? get readAt;

  /// Create a copy of MsgSend
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MsgSendImplCopyWith<_$MsgSendImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
