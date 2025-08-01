import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart';

class FirebaseApi {
  static final FirebaseApi _instance = FirebaseApi._internal();
  static FirebaseApi get shared => _instance;
  final FirebaseMessaging _firebasemessaging = FirebaseMessaging.instance;
  FirebaseApi._internal();

  Future<String?> getToken() async {
    return await _firebasemessaging.getToken();
  }

  Future<void> initialNotification() async {
    await _firebasemessaging.requestPermission();
    debugPrint(
      'FCM-TOKEN ${await getToken()}',
    );
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  }

  static Future<void> handleBackgroundMessage(RemoteMessage message) async {
    debugPrint('Notification received on background');
    debugPrint('${message.notification?.title}');
    debugPrint('${message.notification?.body}');
  }
}
