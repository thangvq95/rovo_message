// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Event _$EventFromJson(Map<String, dynamic> json) {
  return Event(
      json['key'] as String,
      json['parameter'] == null
          ? null
          : Parameter.fromJson(json['parameter'] as Map<String, dynamic>));
}

Map<String, dynamic> _$EventToJson(Event instance) =>
    <String, dynamic>{'key': instance.key, 'parameter': instance.parameter};
