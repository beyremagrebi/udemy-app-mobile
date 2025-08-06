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

  Future<ApiResponse<List<NotificationModel>>> getAllNotifications() async {
    return ApiService.instance.request<List<NotificationModel>>(
      url: '$endpoint/get-all-notif',
      fromJson: (json) =>
          (json as List).map<NotificationModel>(fromMapFunction).toList(),
    );
  }
}
