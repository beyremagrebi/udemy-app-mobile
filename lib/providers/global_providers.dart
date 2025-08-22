import 'package:erudaxis/providers/global/notification_view_model.dart';
import 'package:erudaxis/providers/global/session_manager_view_model.dart';
import 'package:erudaxis/providers/main/profile/theme/theme_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'global/video_conferance_view_model.dart';
import 'main/bottom_navigation_view_model.dart';
import 'main/drawer_view_model.dart';
import 'main/profile/language/language_view_model.dart';

List<SingleChildWidget> globalProviders = [
  ChangeNotifierProvider(
    create: (context) => LanguageViewModel(context)..loadLanguage(),
  ),
  ChangeNotifierProvider(
    create: (context) => ThemeViewModel(context)..loadTheme(),
  ),
  ChangeNotifierProvider(
    create: DrawerViewModel.new,
  ),
  ChangeNotifierProvider(
    create: BottomNavigationViewModel.new,
  ),
  ChangeNotifierProvider(
    create: SessionManager.new,
  ),
  ChangeNotifierProvider(
    create: NotificationViewModel.new,
  ),
  ChangeNotifierProvider(
    create: VideoConferenceViewModel.new,
  ),
];
