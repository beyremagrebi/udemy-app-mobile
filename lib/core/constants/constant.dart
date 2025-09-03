import 'package:flutter/material.dart';

import '../../generated/l10n.dart';

final ScrollController homeScrollController = ScrollController();
late S intl;

final GlobalKey<NavigatorState> mainnavigatorKey = GlobalKey();
final ScrollController profileScrollController = ScrollController();

late TextTheme textTheme;
String get defualtIconAvatar => 'default-avatar-icon.jpg';
BuildContext get mainContext => mainnavigatorKey.currentContext!;

NavigatorState get mainState => mainnavigatorKey.currentState!;

String get sharedAcessTokenKey => 'ACCESS_TOKEN_KEY';
String get sharedChatNotificationKey => 'CHAT_NOTIFICATION_KEY';
String get sharedChatRoomNotificationKey => 'CHAT_ROOM_NOTIFICATION_KEY';
String get sharedFacilityKey => 'FACILITY_KEY';
String get sharedLanguageKey => 'LANGUAGE_APP_KEY';
String get sharedNotificationKey => 'NOTIFICATION_KEY';
String get sharedRefreshTokenKey => 'REFRESH_TOKEN_KEY';
String get sharedThemeKey => 'THEME_APP_KEY';
