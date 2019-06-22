// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
      id: json['id'] as num,
      username: json['username'] as String,
      name: json['name'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      pulseLevel: json['pulseLevel'] as String,
      pulsePoints: json['pulsePoints'] as num,
      picture: json['picture'] as String,
      city: json['city'] as String,
      status: json['status'] as String);
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
