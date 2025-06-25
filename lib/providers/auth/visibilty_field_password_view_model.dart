import 'package:erudaxis/providers/base_view_model.dart';

class VisibiltyFieldPasswordViewModel extends BaseViewModel {
  bool securePassword = true;
  VisibiltyFieldPasswordViewModel(super.context);
  void toggleVisibility() {
    securePassword = !securePassword;
    update();
  }
}
