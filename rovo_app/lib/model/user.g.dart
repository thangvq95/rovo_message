// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
      json['id'] as num,
      json['username'] as String,
      json['name'] as String,
      json['firstName'] as String,
      json['lastName'] as String,
      json['pulseLevel'] as String,
      json['pulsePoints'] as num,
      json['picture'] as String,
      json['city'] as String,
      json['status'] as String);
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'name': instance.name,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'pulseLevel': instance.pulseLevel,
      'pulsePoints': instance.pulsePoints,
      'picture': instance.picture,
      'city': instance.city,
      'status': instance.status
    };
