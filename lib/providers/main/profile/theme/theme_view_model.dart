import 'package:erudaxis/core/enum/theme_app.dart';
import 'package:erudaxis/providers/base_view_model.dart';

class ThemeViewModel extends BaseViewModel {
  ThemeApp currentTheme = ThemeApp.defaultTheme;
  ThemeViewModel(super.context);

  void selectTheme(ThemeApp selectedTheme) {
    currentTheme = selectedTheme;
    update();
  }
}
