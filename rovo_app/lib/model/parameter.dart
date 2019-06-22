import 'package:json_annotation/json_annotation.dart';

part 'parameter.g.dart';

@JsonSerializable()
class Parameter{
  @JsonKey(name: 'firstName')
  String firstName;
  @JsonKey(name: 'lng')
  String lng;

  Parameter(this.firstName, this.lng);

  static Parameter dataFromJson(Map<String, dynamic> input){
    return new Parameter.fromJson(input);
  }

  static Map<String, dynamic> dataToJson(Parameter model){
    return model.toJson();
  }

  factory Parameter.fromJson(Map<String, dynamic> json) => _$ParameterFromJson(json);
  Map<String, dynamic> toJson() => _$ParameterToJson(this);
}