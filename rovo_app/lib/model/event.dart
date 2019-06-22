import 'parameter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'event.g.dart';

@JsonSerializable()
class Event{
  @JsonKey(name: 'key')
  String key;
  @JsonKey(name: 'parameter')
  Parameter parameter;

  Event({this.key, this.parameter});

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
  Map<String, dynamic> toJson() => _$EventToJson(this);
}