import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_notification_channel/flutter_notification_channel.dart';
import 'package:flutter_notification_channel/notification_importance.dart';

class ChannelNotification {
  static Future<void> createChannels() async {
    final channels = [
      {
        'id': dotenv.env['CHANNEL_MESSAGES_KEY'],
        'name': dotenv.env['CHANNEL_MESSAGES_NAME'],
      },
      {
        'id': dotenv.env['CHANNEL_COURSES_KEY'],
        'name': dotenv.env['CHANNEL_COURSES_NAME'],
      },
      {
        'id': dotenv.env['CHANNEL_ASSIGNMENTS_KEY'],
        'name': dotenv.env['CHANNEL_ASSIGNMENTS_NAME'],
      },
      {
        'id': dotenv.env['CHANNEL_SCHEDULE_KEY'],
        'name': dotenv.env['CHANNEL_SCHEDULE_NAME'],
      },
      {
        'id': dotenv.env['CHANNEL_GRADES_KEY'],
        'name': dotenv.env['CHANNEL_GRADES_NAME'],
      },
    ];

    for (final channel in channels) {
      if (channel['id'] != null && channel['name'] != null) {
        await FlutterNotificationChannel().registerNotificationChannel(
          id: channel['id']!,
          name: channel['name']!,
          description: '${channel['name']} notifications',
          importance: NotificationImportance.IMPORTANCE_HIGH,
        );
      }
    }
  }

  static Future<void> initialize() async {
    await createChannels();
  }
}
