import 'package:dio/dio.dart';
import 'package:erudaxis/models/base/base_chat.dart';
import 'package:erudaxis/models/global/message.dart';

import '../../core/api/from_json.dart';
import 'user.dart';

class ChatGroup extends BaseChat {
  List<User>? groupAdmin;
  ChatGroup({
    required super.id,
    super.name,
    super.users,
    super.lastMessage,
    this.groupAdmin,
    super.isGroupChat,
  });

  ChatGroup.fromId(String? id) : super(id: id);

  factory ChatGroup.fromMap(dynamic map) {
    if (map is String) {
      return ChatGroup.fromId(map);
    }
    return ChatGroup(
      id: FromJson.string(map['_id']),
      name: FromJson.string(map['chatName']),
      lastMessage: FromJson.model(map['latestMessage'], Message.fromMap),
      users: FromJson.modelList<User>(
        map['users'],
        User.fromMap,
      ),
      groupAdmin: FromJson.modelList<User>(
        map['groupAdmin'],
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
