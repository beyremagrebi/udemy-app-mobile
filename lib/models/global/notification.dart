import 'package:dio/dio.dart';
import 'package:erudaxis/core/api/form_data_helper.dart';
import 'package:erudaxis/core/config/media/exstension.dart';
import 'package:erudaxis/models/base_model.dart';
import 'package:erudaxis/models/global/user.dart';

import '../../core/api/from_json.dart';

class NotificationModel extends BaseModel {
  User? receiver;
  User? sender;
  String? title;
  String? body;
  String? screen;
  String? image;
  String? status;

  String? type;
  DateTime? createdAt;

  NotificationModel({
    required super.id,
    this.body,
    this.image,
    this.receiver,
    this.sender,
    this.status,
    this.title,
    this.screen,
    this.type,
    this.createdAt,
  });
  NotificationModel.fromId(String? id) : super(id: id);

  factory NotificationModel.fromMap(dynamic map) {
    if (map is String) {
      return NotificationModel.fromId(map);
    }
    return NotificationModel(
        id: FromJson.string(map['_id']),
        receiver: FromJson.model(map['userId'], User.fromMap),
        sender: FromJson.model(map['fromUser'], User.fromMap),
        title: FromJson.string(map['title']),
        body: FromJson.string(map['body']),
        image: FromJson.string(map['image']),
        screen: FromJson.string(map['screen']).toString().split('/').last,
        status: FromJson.string(map['status']),
        type: FromJson.string(map['type']),
        createdAt: FromJson.dateTime(map['createdAt']));
  }

  bool get unread => status == 'unread';

  @override
  FormData toFormData() => toMap().toFormData();

  @override
  Map<String, Object> toMap() {
    final Map<String, Object> map = {};
    map.add('status', status);
    return map;
  }
}
