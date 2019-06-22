import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';
@JsonSerializable()
class User{
  @JsonKey(name: 'id')
  String id;
  @JsonKey(name: 'username')
  String username;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'firstName')
  String firstName;
  @JsonKey(name: 'lastName')
  String lastName;
  @JsonKey(name: 'pulseLevel')
  String pulseLevel;
  @JsonKey(name: 'pulsePoints')
  num pulsePoints;
  @JsonKey(name: 'picture')
  String picture;
  @JsonKey(name: 'city')
  String city;
  @JsonKey(name: 'status')
  String status;

  User(this.id, this.username, this.name, this.firstName, this.lastName,
      this.pulseLevel, this.pulsePoints, this.picture, this.city, this.status);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

