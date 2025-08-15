import 'package:erudaxis/interfaces/i_api_service.dart';
import 'package:erudaxis/models/global/notification.dart';
import 'package:erudaxis/services/base_service.dart';

import '../../core/api/api_response.dart';
import '../../core/api/api_services.dart';

class NotificationService extends BaseService<NotificationModel> {
  static final NotificationService _instance = NotificationService._internal();

  static NotificationService get shared => _instance;

  NotificationService._internal();
  @override
  NotificationModel Function(dynamic json) get fromMapFunction =>
      NotificationModel.fromMap;

  Future<ApiResponse<Map<String, String>>> deleteNotification(
      String? id) async {
    return ApiService.instance.request<Map<String, String>>(
      url: '$endpoint/delete-notif/$id',
      method: DioMethod.delete,
      fromJson: (json) => Map<String, String>.from(json as Map),
    );
  }

  Future<ApiResponse<List<NotificationModel>>> getAllNotifications() async {
    return ApiService.instance.request<List<NotificationModel>>(
      url: '$endpoint/get-all-notif',
      fromJson: (json) =>
          (json as List).map<NotificationModel>(fromMapFunction).toList(),
    );
  }

  Future<ApiResponse<NotificationModel>> updateNotification(
      NotificationModel notifcation) async {
    return ApiService.instance.request<NotificationModel>(
      url: '$endpoint/update-notif/${notifcation.id}',
      method: DioMethod.patch,
      data: notifcation.toMap(),
      fromJson: fromMapFunction,
    );
  }
}
