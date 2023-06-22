// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MessageModel _$MessageModelFromJson(Map<String, dynamic> json) {
  return _MessageModel.fromJson(json);
}

/// @nodoc
mixin _$MessageModel {
  String get senderId => throw _privateConstructorUsedError;
  String get reciverId => throw _privateConstructorUsedError;
  String get textMessage => throw _privateConstructorUsedError;
  MessageType get messageType => throw _privateConstructorUsedError;
  int get timeSent => throw _privateConstructorUsedError;
  String get messageId => throw _privateConstructorUsedError;
  bool get isSeen => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MessageModelCopyWith<MessageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageModelCopyWith<$Res> {
  factory $MessageModelCopyWith(
          MessageModel value, $Res Function(MessageModel) then) =
      _$MessageModelCopyWithImpl<$Res, MessageModel>;
  @useResult
  $Res call(
      {String senderId,
      String reciverId,
      String textMessage,
      MessageType messageType,
      int timeSent,
      String messageId,
      bool isSeen});
}

/// @nodoc
class _$MessageModelCopyWithImpl<$Res, $Val extends MessageModel>
    implements $MessageModelCopyWith<$Res> {
  _$MessageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? senderId = null,
    Object? reciverId = null,
    Object? textMessage = null,
    Object? messageType = null,
    Object? timeSent = null,
    Object? messageId = null,
    Object? isSeen = null,
  }) {
    return _then(_value.copyWith(
      senderId: null == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
      reciverId: null == reciverId
          ? _value.reciverId
          : reciverId // ignore: cast_nullable_to_non_nullable
              as String,
      textMessage: null == textMessage
          ? _value.textMessage
          : textMessage // ignore: cast_nullable_to_non_nullable
              as String,
      messageType: null == messageType
          ? _value.messageType
          : messageType // ignore: cast_nullable_to_non_nullable
              as MessageType,
      timeSent: null == timeSent
          ? _value.timeSent
          : timeSent // ignore: cast_nullable_to_non_nullable
              as int,
      messageId: null == messageId
          ? _value.messageId
          : messageId // ignore: cast_nullable_to_non_nullable
              as String,
      isSeen: null == isSeen
          ? _value.isSeen
          : isSeen // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MessageModelCopyWith<$Res>
    implements $MessageModelCopyWith<$Res> {
  factory _$$_MessageModelCopyWith(
          _$_MessageModel value, $Res Function(_$_MessageModel) then) =
      __$$_MessageModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String senderId,
      String reciverId,
      String textMessage,
      MessageType messageType,
      int timeSent,
      String messageId,
      bool isSeen});
}

/// @nodoc
class __$$_MessageModelCopyWithImpl<$Res>
    extends _$MessageModelCopyWithImpl<$Res, _$_MessageModel>
    implements _$$_MessageModelCopyWith<$Res> {
  __$$_MessageModelCopyWithImpl(
      _$_MessageModel _value, $Res Function(_$_MessageModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? senderId = null,
    Object? reciverId = null,
    Object? textMessage = null,
    Object? messageType = null,
    Object? timeSent = null,
    Object? messageId = null,
    Object? isSeen = null,
  }) {
    return _then(_$_MessageModel(
      senderId: null == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
      reciverId: null == reciverId
          ? _value.reciverId
          : reciverId // ignore: cast_nullable_to_non_nullable
              as String,
      textMessage: null == textMessage
          ? _value.textMessage
          : textMessage // ignore: cast_nullable_to_non_nullable
              as String,
      messageType: null == messageType
          ? _value.messageType
          : messageType // ignore: cast_nullable_to_non_nullable
              as MessageType,
      timeSent: null == timeSent
          ? _value.timeSent
          : timeSent // ignore: cast_nullable_to_non_nullable
              as int,
      messageId: null == messageId
          ? _value.messageId
          : messageId // ignore: cast_nullable_to_non_nullable
              as String,
      isSeen: null == isSeen
          ? _value.isSeen
          : isSeen // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MessageModel implements _MessageModel {
  _$_MessageModel(
      {required this.senderId,
      required this.reciverId,
      required this.textMessage,
      required this.messageType,
      required this.timeSent,
      required this.messageId,
      this.isSeen = false});

  factory _$_MessageModel.fromJson(Map<String, dynamic> json) =>
      _$$_MessageModelFromJson(json);

  @override
  final String senderId;
  @override
  final String reciverId;
  @override
  final String textMessage;
  @override
  final MessageType messageType;
  @override
  final int timeSent;
  @override
  final String messageId;
  @override
  @JsonKey()
  final bool isSeen;

  @override
  String toString() {
    return 'MessageModel(senderId: $senderId, reciverId: $reciverId, textMessage: $textMessage, messageType: $messageType, timeSent: $timeSent, messageId: $messageId, isSeen: $isSeen)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MessageModel &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.reciverId, reciverId) ||
                other.reciverId == reciverId) &&
            (identical(other.textMessage, textMessage) ||
                other.textMessage == textMessage) &&
            (identical(other.messageType, messageType) ||
                other.messageType == messageType) &&
            (identical(other.timeSent, timeSent) ||
                other.timeSent == timeSent) &&
            (identical(other.messageId, messageId) ||
                other.messageId == messageId) &&
            (identical(other.isSeen, isSeen) || other.isSeen == isSeen));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, senderId, reciverId, textMessage,
      messageType, timeSent, messageId, isSeen);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MessageModelCopyWith<_$_MessageModel> get copyWith =>
      __$$_MessageModelCopyWithImpl<_$_MessageModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MessageModelToJson(
      this,
    );
  }
}

abstract class _MessageModel implements MessageModel {
  factory _MessageModel(
      {required final String senderId,
      required final String reciverId,
      required final String textMessage,
      required final MessageType messageType,
      required final int timeSent,
      required final String messageId,
      final bool isSeen}) = _$_MessageModel;

  factory _MessageModel.fromJson(Map<String, dynamic> json) =
      _$_MessageModel.fromJson;

  @override
  String get senderId;
  @override
  String get reciverId;
  @override
  String get textMessage;
  @override
  MessageType get messageType;
  @override
  int get timeSent;
  @override
  String get messageId;
  @override
  bool get isSeen;
  @override
  @JsonKey(ignore: true)
  _$$_MessageModelCopyWith<_$_MessageModel> get copyWith =>
      throw _privateConstructorUsedError;
}
