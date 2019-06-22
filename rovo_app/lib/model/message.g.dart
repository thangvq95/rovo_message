// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) {
  return Message(
      json['id'] as num,
      json['groupId'] as num,
      json['type'] as String,
      json['position'] as int,
      json['content'] == null
          ? null
          : Content.fromJson(json['content'] as Map<String, dynamic>),
      json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      json['updateAt'] == null
          ? null
          : DateTime.parse(json['updateAt'] as String),
      json['senderId'] as int,
      json['sender'] == null
          ? null
          : User.fromJson(json['sender'] as Map<String, dynamic>));
}

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'id': instance.id,
      'groupId': instance.groupId,
      'type': instance.type,
      'position': instance.position,
      'content': instance.content,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updateAt': instance.updateAt?.toIso8601String(),
      'senderId': instance.senderId,
      'sender': instance.sender
    };
