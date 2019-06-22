import 'content.dart';
import 'user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'message.g.dart';

@JsonSerializable()
class Message{
  @JsonKey(name: 'id')
  num id;
  @JsonKey(name: 'groupId')
  num groupId;
  @JsonKey(name: 'type')
  String type;
  @JsonKey(name: 'position')
  int position;
  @JsonKey(name: 'content')
  Content content;
  @JsonKey(name: 'createdAt')
  DateTime createdAt;
  @JsonKey(name: 'updateAt')
  DateTime updateAt;
  @JsonKey(name: 'senderId')
  int senderId;
  @JsonKey(name: 'sender')
  User sender;

  Message(this.id, this.groupId, this.type, this.position, this.content,
      this.createdAt, this.updateAt, this.senderId, this.sender);

  factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);
  Map<String, dynamic> toJson() => _$MessageToJson(this);
}




