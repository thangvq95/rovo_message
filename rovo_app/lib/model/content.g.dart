// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Content _$ContentFromJson(Map<String, dynamic> json) {
  return Content(
      json['url'] as String,
      json['i18n'] == null
          ? null
          : Event.fromJson(json['i18n'] as Map<String, dynamic>),
      json['text'] as String,
      json['subType'] as String);
}

Map<String, dynamic> _$ContentToJson(Content instance) => <String, dynamic>{
      'url': instance.url,
      'i18n': instance.event,
      'text': instance.text,
      'subType': instance.subType
    };
