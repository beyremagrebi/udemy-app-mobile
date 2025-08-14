import 'package:erudaxis/core/constants/constant.dart';
import 'package:erudaxis/presentation/global/notification_view.dart';
import 'package:erudaxis/presentation/utils/navigator_utils.dart';
import 'package:erudaxis/providers/global/notification_view_model.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:vibration/vibration.dart';

class FirebaseApi {
  static final FirebaseApi _instance = FirebaseApi._internal();
  static FirebaseApi get shared => _instance;
  final FirebaseMessaging _firebasemessaging = FirebaseMessaging.instance;
  late NotificationViewModel viewModel;
  FirebaseApi._internal();

  Future<String?> getToken() async {
    return await _firebasemessaging.getToken();
  }

  Future<void> initialNotification() async {
    viewModel = Provider.of<NotificationViewModel>(mainContext, listen: false);
    await _firebasemessaging.requestPermission();
    debugPrint(
      'FCM-TOKEN ${await getToken()}',
    );
    FirebaseMessaging.onBackgroundMessage(
      handleBackgroundMessage,
    );
    FirebaseMessaging.onMessage.listen(
      (event) => handleForgroundMessage(event, viewModel),
    );
    FirebaseMessaging.onMessageOpenedApp.listen(
      (event) => navigateTo(mainContext, const NotificationView()),
    );
  }

  static Future<void> handleBackgroundMessage(
    RemoteMessage message,
  ) async {
    debugPrint('Notification received on background');
    debugPrint('${message.notification?.title}');
    debugPrint('${message.notification?.body}');
  }

  static Future<void> handleForgroundMessage(
    RemoteMessage message,
    NotificationViewModel viewModel,
  ) async {
    debugPrint('Notification received on Forground');
    if (await Vibration.hasVibrator()) {
      Vibration.vibrate();
    }
    viewModel.incrementNotifCount();
    debugPrint('${message.notification?.title}');
    debugPrint('${message.notification?.body}');
  }
}
