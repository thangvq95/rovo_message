import 'parameter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'event.g.dart';

@JsonSerializable()
class Event{
  @JsonKey(name: 'key')
  String key;
  @JsonKey(name: 'parameter', fromJson: Parameter.dataFromJson, toJson: Parameter.dataToJson)
  Parameter parameter;

  Event(this.key, this.parameter);

  static Event dataFromJson(Map<String, dynamic> input){
    return new Event.fromJson(input);
  }

  static Map<String, dynamic> dataToJson(Event model){
    return model.toJson();
  }

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
  Map<String, dynamic> toJson() => _$EventToJson(this);
}