import 'package:flutter/widgets.dart';

final GlobalKey<NavigatorState> mainnavigatorKey = GlobalKey();
BuildContext get mainContext => mainnavigatorKey.currentContext!;

NavigatorState get mainState => mainnavigatorKey.currentState!;
