import 'package:erudaxis/core/enum/theme_app.dart';
import 'package:erudaxis/providers/base_view_model.dart';

import '../../../../presentation/utils/preferences/theme_preference.dart';

class ThemeViewModel extends BaseViewModel {
  ThemeApp currentTheme = ThemeApp.defaultTheme;
  ThemeViewModel(super.context);
  Future<void> loadTheme() async {
    currentTheme = await ThemePreference.shared.load() ?? ThemeApp.defaultTheme;
    update();
  }

  Future<void> selectTheme(ThemeApp selectedTheme) async {
    currentTheme = selectedTheme;
    await ThemePreference.shared.save(selectedTheme);
    update();
  }
}
