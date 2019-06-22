// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parameter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Parameter _$ParameterFromJson(Map<String, dynamic> json) {
  return Parameter(
      firstName: json['firstName'] as String,
      groupName: json['groupName'] as String,
      lng: json['lng'] as String);
}

Map<String, dynamic> _$ParameterToJson(Parameter instance) => <String, dynamic>{
      'firstName': instance.firstName,
      'groupName': instance.groupName,
      'lng': instance.lng
    };
