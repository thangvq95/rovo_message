import 'event.dart';
import 'package:json_annotation/json_annotation.dart';

part 'content.g.dart';

@JsonSerializable()
class Content{
  @JsonKey(name: 'event', fromJson: Event.dataFromJson, toJson: Event.dataToJson)
  Event event;
  @JsonKey(name: 'text')
  String text;
  @JsonKey(name: 'subText')
  String subText;


  Content(this.event, this.text, this.subText);

  static Content dataFromJson(Map<String, dynamic> input){
    return new Content.fromJson(input);
  }

  static Map<String, dynamic> dataToJson(Content model){
    return model.toJson();
  }

  factory Content.fromJson(Map<String, dynamic> json) => _$ContentFromJson(json);
  Map<String, dynamic> toJson() => _$ContentToJson(this);
}