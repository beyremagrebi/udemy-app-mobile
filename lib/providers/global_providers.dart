import 'package:erudaxis/providers/global/session_manager_view_model.dart';
import 'package:erudaxis/providers/main/profile/theme/theme_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'main/profile/language/language_view_model.dart';

List<SingleChildWidget> globalProviders = [
  ChangeNotifierProvider(
    create: (context) => LanguageViewModel(context)..loadLanguage(),
  ),
  ChangeNotifierProvider(
    create: (context) => ThemeViewModel(context)..loadTheme(),
  ),
  ChangeNotifierProvider(
    create: SessionManager.new,
  ),
];
