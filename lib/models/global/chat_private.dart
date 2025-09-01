import 'package:dio/dio.dart';
import 'package:erudaxis/models/base/base_chat.dart';
import 'package:erudaxis/models/global/message.dart';

import '../../core/api/from_json.dart';
import 'user.dart';

class ChatPrivate extends BaseChat {
  ChatPrivate({
    required super.id,
    super.name,
    super.users,
    super.lastMessage,
    super.isGroupChat,
  });

  ChatPrivate.fromId(String? id) : super(id: id);

  factory ChatPrivate.fromMap(dynamic map) {
    if (map is String) {
      return ChatPrivate.fromId(map);
    }
    return ChatPrivate(
      id: FromJson.string(map['_id']),
      name: FromJson.string(map['chatName']),
      lastMessage: FromJson.model(map['latestMessage'], Message.fromMap),
      users: FromJson.modelList<User>(
        map['users'],
        User.fromMap,
      ),
      isGroupChat: FromJson.boolean(map['isGroupChat']),
    );
  }

  @override
  FormData toFormData() {
    throw UnimplementedError();
  }

  @override
  Map<String, Object> toMap() {
    throw UnimplementedError();
  }
}
