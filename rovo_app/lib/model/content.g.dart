// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Content _$ContentFromJson(Map<String, dynamic> json) {
  return Content(
      json['event'] == null
          ? null
          : Event.fromJson(json['event'] as Map<String, dynamic>),
      json['text'] as String,
      json['subText'] as String);
}

Map<String, dynamic> _$ContentToJson(Content instance) => <String, dynamic>{
      'event': instance.event,
      'text': instance.text,
      'subText': instance.subText
    };