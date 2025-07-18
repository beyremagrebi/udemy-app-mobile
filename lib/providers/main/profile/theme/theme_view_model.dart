import 'package:erudaxis/core/enum/theme_app.dart';
import 'package:erudaxis/providers/base_view_model.dart';

import '../../../../presentation/utils/preferences/theme_preference.dart';

class ThemeViewModel extends BaseViewModel {
  ThemeApp currentTheme = ThemeApp.defaultTheme;
  bool sombre = false;
  ThemeViewModel(super.context);

  Future<void> loadTheme() async {
    currentTheme = await ThemePreference.shared.load() ?? ThemeApp.defaultTheme;
    if (currentTheme == ThemeApp.charcoal) {
      sombre = true;
    }
    update();
  }

  Future<void> selectTheme(ThemeApp selectedTheme) async {
    currentTheme = selectedTheme;
    await ThemePreference.shared.save(selectedTheme);
    if (selectedTheme == ThemeApp.charcoal) {
      sombre = true;
    } else {
      sombre = false;
    }
    update();
  }

  Future<void> setSombreTheme({required bool value}) async {
    sombre = value;
    if (value == true) {
      await selectTheme(ThemeApp.charcoal);
    } else {
      await selectTheme(ThemeApp.defaultTheme);
    }
  }
}
