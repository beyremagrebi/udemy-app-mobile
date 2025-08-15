import 'package:erudaxis/models/global/notification.dart';
import 'package:erudaxis/providers/base_view_model.dart';
import 'package:erudaxis/services/global/notification_service.dart';

class ActivityRecentViewModel extends BaseViewModel {
  List<NotificationModel>? recentActivities;

  ActivityRecentViewModel(super.context) {
    loadActivityRecent();
  }

  Future<void> loadActivityRecent() async {
    await makeApiCall(
      apiCall: NotificationService.shared.getRecentAcitivity(),
      displayLoading: false,
      onSuccess: (listRecentActivity) {
        recentActivities = listRecentActivity;
      },
    );
  }
}
