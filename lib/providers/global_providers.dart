import 'package:erudaxis/providers/main/profile/theme/theme_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'main/profile/language/language_view_model.dart';

List<SingleChildWidget> globalProviders = [
  ChangeNotifierProvider(
    create: LanguageViewModel.new,
  ),
  ChangeNotifierProvider(
    create: ThemeViewModel.new,
  ),
];
