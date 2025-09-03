import 'package:dio/dio.dart';
import 'package:erudaxis/core/config/media/exstension.dart';
import 'package:erudaxis/models/base/base_chat.dart';
import 'package:erudaxis/models/base_model.dart';
import 'package:erudaxis/models/global/user.dart';

import '../../core/api/from_json.dart';

class Message extends BaseModel {
  String? message;
  String? type;
  BaseChat? chat;
  List<User>? readBy;
  User? author;
  DateTime? createdAt;
  Message({
    required super.id,
    this.chat,
    this.message,
    this.readBy,
    this.type,
    this.author,
    this.createdAt,
  });
  Message.fromId(String? id) : super(id: id);

  factory Message.fromMap(dynamic map) {
    if (map is String) {
      return Message.fromId(map);
    }
    return Message(
      id: FromJson.string(map['_id']),
      message: FromJson.string(map['text']),
      readBy: FromJson.modelList(map['readBy'], User.fromMap),
      author: FromJson.model(map['author'], User.fromMap),
      createdAt: FromJson.dateTime(map['createdAt']),
      type: FromJson.string('type'),
    );
  }
  @override
  FormData toFormData() {
    throw UnimplementedError();
  }

  @override
  Map<String, Object> toMap() {
    final Map<String, Object> map = {};
    map.add('message', message);
    map.add('author', author?.toMap());
    return map;
  }
}
