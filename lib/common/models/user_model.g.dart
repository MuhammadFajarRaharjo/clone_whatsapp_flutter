// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      uid: json['uid'] as String,
      name: json['name'] as String,
      status: json['status'] as String? ?? 'Tidak dapat bicara, WhatsApp saja',
      phoneNumber: json['phoneNumber'] as String,
      profileImageUrl: json['profileImageUrl'] as String,
      lastSeen: json['lastSeen'] as int,
      active: json['active'] as bool,
      groupId:
          (json['groupId'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'status': instance.status,
      'phoneNumber': instance.phoneNumber,
      'profileImageUrl': instance.profileImageUrl,
      'lastSeen': instance.lastSeen,
      'active': instance.active,
      'groupId': instance.groupId,
    };
