// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'last_message_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LastMessageModel _$LastMessageModelFromJson(Map<String, dynamic> json) {
  return _LastMessageModel.fromJson(json);
}

/// @nodoc
mixin _$LastMessageModel {
  String get username => throw _privateConstructorUsedError;
  String get profileUrl => throw _privateConstructorUsedError;
  String get contactId => throw _privateConstructorUsedError;
  String get lastMessage => throw _privateConstructorUsedError;
  DateTime get timeSent => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LastMessageModelCopyWith<LastMessageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LastMessageModelCopyWith<$Res> {
  factory $LastMessageModelCopyWith(
          LastMessageModel value, $Res Function(LastMessageModel) then) =
      _$LastMessageModelCopyWithImpl<$Res, LastMessageModel>;
  @useResult
  $Res call(
      {String username,
      String profileUrl,
      String contactId,
      String lastMessage,
      DateTime timeSent});
}

/// @nodoc
class _$LastMessageModelCopyWithImpl<$Res, $Val extends LastMessageModel>
    implements $LastMessageModelCopyWith<$Res> {
  _$LastMessageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? profileUrl = null,
    Object? contactId = null,
    Object? lastMessage = null,
    Object? timeSent = null,
  }) {
    return _then(_value.copyWith(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      profileUrl: null == profileUrl
          ? _value.profileUrl
          : profileUrl // ignore: cast_nullable_to_non_nullable
              as String,
      contactId: null == contactId
          ? _value.contactId
          : contactId // ignore: cast_nullable_to_non_nullable
              as String,
      lastMessage: null == lastMessage
          ? _value.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as String,
      timeSent: null == timeSent
          ? _value.timeSent
          : timeSent // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LastMessageModelCopyWith<$Res>
    implements $LastMessageModelCopyWith<$Res> {
  factory _$$_LastMessageModelCopyWith(
          _$_LastMessageModel value, $Res Function(_$_LastMessageModel) then) =
      __$$_LastMessageModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String username,
      String profileUrl,
      String contactId,
      String lastMessage,
      DateTime timeSent});
}

/// @nodoc
class __$$_LastMessageModelCopyWithImpl<$Res>
    extends _$LastMessageModelCopyWithImpl<$Res, _$_LastMessageModel>
    implements _$$_LastMessageModelCopyWith<$Res> {
  __$$_LastMessageModelCopyWithImpl(
      _$_LastMessageModel _value, $Res Function(_$_LastMessageModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? profileUrl = null,
    Object? contactId = null,
    Object? lastMessage = null,
    Object? timeSent = null,
  }) {
    return _then(_$_LastMessageModel(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      profileUrl: null == profileUrl
          ? _value.profileUrl
          : profileUrl // ignore: cast_nullable_to_non_nullable
              as String,
      contactId: null == contactId
          ? _value.contactId
          : contactId // ignore: cast_nullable_to_non_nullable
              as String,
      lastMessage: null == lastMessage
          ? _value.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as String,
      timeSent: null == timeSent
          ? _value.timeSent
          : timeSent // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LastMessageModel implements _LastMessageModel {
  _$_LastMessageModel(
      {required this.username,
      required this.profileUrl,
      required this.contactId,
      required this.lastMessage,
      required this.timeSent});

  factory _$_LastMessageModel.fromJson(Map<String, dynamic> json) =>
      _$$_LastMessageModelFromJson(json);

  @override
  final String username;
  @override
  final String profileUrl;
  @override
  final String contactId;
  @override
  final String lastMessage;
  @override
  final DateTime timeSent;

  @override
  String toString() {
    return 'LastMessageModel(username: $username, profileUrl: $profileUrl, contactId: $contactId, lastMessage: $lastMessage, timeSent: $timeSent)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LastMessageModel &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.profileUrl, profileUrl) ||
                other.profileUrl == profileUrl) &&
            (identical(other.contactId, contactId) ||
                other.contactId == contactId) &&
            (identical(other.lastMessage, lastMessage) ||
                other.lastMessage == lastMessage) &&
            (identical(other.timeSent, timeSent) ||
                other.timeSent == timeSent));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, username, profileUrl, contactId, lastMessage, timeSent);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LastMessageModelCopyWith<_$_LastMessageModel> get copyWith =>
      __$$_LastMessageModelCopyWithImpl<_$_LastMessageModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LastMessageModelToJson(
      this,
    );
  }
}

abstract class _LastMessageModel implements LastMessageModel {
  factory _LastMessageModel(
      {required final String username,
      required final String profileUrl,
      required final String contactId,
      required final String lastMessage,
      required final DateTime timeSent}) = _$_LastMessageModel;

  factory _LastMessageModel.fromJson(Map<String, dynamic> json) =
      _$_LastMessageModel.fromJson;

  @override
  String get username;
  @override
  String get profileUrl;
  @override
  String get contactId;
  @override
  String get lastMessage;
  @override
  DateTime get timeSent;
  @override
  @JsonKey(ignore: true)
  _$$_LastMessageModelCopyWith<_$_LastMessageModel> get copyWith =>
      throw _privateConstructorUsedError;
}
