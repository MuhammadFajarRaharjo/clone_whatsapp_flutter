// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'last_message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LastMessageModel _$$_LastMessageModelFromJson(Map<String, dynamic> json) =>
    _$_LastMessageModel(
      username: json['username'] as String,
      profileUrl: json['profileUrl'] as String,
      contactId: json['contactId'] as String,
      lastMessage: json['lastMessage'] as String,
      timeSent: DateTime.parse(json['timeSent'] as String),
    );

Map<String, dynamic> _$$_LastMessageModelToJson(_$_LastMessageModel instance) =>
    <String, dynamic>{
      'username': instance.username,
      'profileUrl': instance.profileUrl,
      'contactId': instance.contactId,
      'lastMessage': instance.lastMessage,
      'timeSent': instance.timeSent.toIso8601String(),
    };
