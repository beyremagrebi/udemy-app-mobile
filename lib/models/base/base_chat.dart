import 'package:erudaxis/models/base_model.dart';
import 'package:erudaxis/models/global/message.dart';
import 'package:erudaxis/models/global/user.dart';

abstract class BaseChat extends BaseModel {
  String? name;
  List<User>? users;
  Message? lastMessage;
  bool? isGroupChat;
  DateTime? createdAt;

  BaseChat({
    required super.id,
    this.lastMessage,
    this.name,
    this.users,
    this.isGroupChat,
    this.createdAt,
  });
}
