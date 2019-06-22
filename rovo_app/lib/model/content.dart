import 'event.dart';
import 'package:json_annotation/json_annotation.dart';

part 'content.g.dart';

@JsonSerializable()
class Content{
  @JsonKey(name: 'url')
  String url;
  @JsonKey(name: 'i18n')
  Event event;
  @JsonKey(name: 'text')
  String text;
  @JsonKey(name: 'subType')
  String subType;


  Content({this.url, this.event, this.text, this.subType});

//  static Content dataFromJson(Map<String, dynamic> input){
//    return new Content.fromJson(input);
//  }
//
//  static Map<String, dynamic> dataToJson(Content model){
//    return model.toJson();
//  }

  factory Content.fromJson(Map<String, dynamic> json) => _$ContentFromJson(json);
  Map<String, dynamic> toJson() => _$ContentToJson(this);
}