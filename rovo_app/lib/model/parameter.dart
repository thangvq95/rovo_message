import 'package:json_annotation/json_annotation.dart';

part 'parameter.g.dart';

@JsonSerializable()
class Parameter{
  @JsonKey(name: 'firstName')
  String firstName;
  @JsonKey(name: 'groupName')
  String groupName;
  @JsonKey(name: 'lng')
  String lng;

  Parameter({this.firstName, this.groupName, this.lng});

  factory Parameter.fromJson(Map<String, dynamic> json) => _$ParameterFromJson(json);
  Map<String, dynamic> toJson() => _$ParameterToJson(this);
}