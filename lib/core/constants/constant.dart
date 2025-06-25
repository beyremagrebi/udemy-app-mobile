import 'package:flutter/material.dart';

import '../../generated/l10n.dart';

late S intl;
final GlobalKey<NavigatorState> mainnavigatorKey = GlobalKey();

late TextTheme textTheme;
BuildContext get mainContext => mainnavigatorKey.currentContext!;
NavigatorState get mainState => mainnavigatorKey.currentState!;

String get sharedAcessTokenKey => 'ACCESS_TOKEN_KEY';
String get sharedRefreshTokenKey => 'REFRESH_TOKEN_KEY';
