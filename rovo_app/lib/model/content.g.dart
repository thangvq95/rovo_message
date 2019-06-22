// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Content _$ContentFromJson(Map<String, dynamic> json) {
  return Content(Event.dataFromJson(json['event'] as Map<String, dynamic>),
      json['text'] as String, json['subText'] as String);
}

Map<String, dynamic> _$ContentToJson(Content instance) => <String, dynamic>{
      'event': Event.dataToJson(instance.event),
      'text': instance.text,
      'subText': instance.subText
    };
