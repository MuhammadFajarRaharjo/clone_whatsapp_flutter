// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MessageModel _$$_MessageModelFromJson(Map<String, dynamic> json) =>
    _$_MessageModel(
      senderId: json['senderId'] as String,
      reciverId: json['reciverId'] as String,
      textMessage: json['textMessage'] as String,
      messageType: $enumDecode(_$MessageTypeEnumMap, json['messageType']),
      timeSent: json['timeSent'] as int,
      messageId: json['messageId'] as String,
      isSeen: json['isSeen'] as bool? ?? false,
    );

Map<String, dynamic> _$$_MessageModelToJson(_$_MessageModel instance) =>
    <String, dynamic>{
      'senderId': instance.senderId,
      'reciverId': instance.reciverId,
      'textMessage': instance.textMessage,
      'messageType': _$MessageTypeEnumMap[instance.messageType]!,
      'timeSent': instance.timeSent,
      'messageId': instance.messageId,
      'isSeen': instance.isSeen,
    };

const _$MessageTypeEnumMap = {
  MessageType.text: 'text',
  MessageType.audio: 'audio',
  MessageType.image: 'image',
  MessageType.video: 'video',
  MessageType.gift: 'gift',
};
