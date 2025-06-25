import 'package:erudaxis/providers/base_view_model.dart';

import '../../presentation/utils/form/validate_helper.dart';

class ValidatorViewModel extends BaseViewModel {
  late final FieldValidator emailValidator;
  late final FieldValidator passwordValidator;

  ValidatorViewModel(super.context) {
    emailValidator = CompositeValidator([
      RequiredValidator(fieldName: 'Email'),
      EmailValidator(),
    ]);

    passwordValidator = CompositeValidator([
      RequiredValidator(fieldName: 'Password'),
      PasswordValidator(),
    ]);
  }
}
