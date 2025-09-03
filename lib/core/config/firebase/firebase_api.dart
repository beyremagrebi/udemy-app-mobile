import 'dart:async';

import 'package:erudaxis/core/constants/constant.dart';
import 'package:erudaxis/presentation/global/notification_view.dart';
import 'package:erudaxis/presentation/utils/navigator_utils.dart';
import 'package:erudaxis/providers/global/notification_view_model.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:vibration/vibration.dart';

class FirebaseApi {
  static final FirebaseApi _instance = FirebaseApi._internal();
  static FirebaseApi get shared => _instance;

  final FirebaseMessaging _firebasemessaging = FirebaseMessaging.instance;
  late NotificationViewModel viewModel;

  StreamSubscription<RemoteMessage>? _onMessageSub;
  StreamSubscription<RemoteMessage>? _onMessageOpenedSub;

  FirebaseApi._internal();

  Future<void> disposeListeners() async {
    await _onMessageSub?.cancel();
    _onMessageSub = null;
    await _onMessageOpenedSub?.cancel();
    _onMessageOpenedSub = null;
  }

  Future<String?> getToken() async {
    return await _firebasemessaging.getToken();
  }

  Future<void> initialNotification() async {
    viewModel = Provider.of<NotificationViewModel>(mainContext, listen: false);
    await _firebasemessaging.requestPermission();
    debugPrint('FCM-TOKEN ${await getToken()}');

    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);

    await _onMessageSub?.cancel();
    await _onMessageOpenedSub?.cancel();

    _onMessageSub = FirebaseMessaging.onMessage.listen(
      (event) => handleForgroundMessage(event, viewModel),
    );

    _onMessageOpenedSub = FirebaseMessaging.onMessageOpenedApp.listen(
      (event) => navigateTo(mainContext, const NotificationView()),
    );
  }

  static Future<void> handleBackgroundMessage(RemoteMessage message) async {
    debugPrint('Notification received on background');
    debugPrint('${message.notification?.title}');
    debugPrint('${message.notification?.body}');
  }

  static Future<void> handleForgroundMessage(
    RemoteMessage message,
    NotificationViewModel viewModel,
  ) async {
    debugPrint('Notification received on Forground');

    if (message.notification?.android?.channelId.toString() !=
        dotenv.env['CHANNEL_MESSAGES_KEY'].toString()) {
      if (await Vibration.hasVibrator()) {
        Vibration.vibrate();
      }
      viewModel.incrementNotifCount();
    }
    if (message.notification?.android?.channelId.toString() ==
        dotenv.env['CHANNEL_MESSAGES_KEY'].toString()) {
      viewModel.incrementChatNotifCount();
    }

    debugPrint('${message.notification?.title}');
    debugPrint('${message.notification?.body}');
  }
}
