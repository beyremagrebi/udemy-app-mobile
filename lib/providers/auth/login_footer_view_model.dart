import 'package:erudaxis/providers/base_view_model.dart';

class LoginFooterViewModel extends BaseViewModel {
  bool? rememberMe = false;
  LoginFooterViewModel(super.context);

  void toggleRemember({bool? value}) {
    rememberMe = value;
    update();
  }
}
