import 'package:erudaxis/providers/base_view_model.dart';

class LoginViewModel extends BaseViewModel {
  bool securePassword = true;
  LoginViewModel(super.context);

  void toggleVisibility() {
    securePassword = !securePassword;
    update();
  }
}
