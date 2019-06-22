// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Content _$ContentFromJson(Map<String, dynamic> json) {
  return Content(
      url: json['url'] as String,
      event: json['i18n'] == null
          ? null
          : Event.fromJson(json['i18n'] as Map<String, dynamic>),
      text: json['text'] as String,
      subType: json['subType'] as String);
}

Map<String, dynamic> _$ContentToJson(Content instance) => <String, dynamic>{
      'url': instance.url,
      'i18n': instance.event,
      'text': instance.text,
      'subType': instance.subType
    };
