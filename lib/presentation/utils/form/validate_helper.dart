import 'package:erudaxis/core/constants/constant.dart';

class CompositeValidator implements FieldValidator {
  final List<FieldValidator> validators;

  CompositeValidator(this.validators);

  @override
  String? validate(String? value) {
    for (final validator in validators) {
      final result = validator.validate(value);
      if (result != null) {
        return result;
      }
    }
    return null;
  }
}

class EmailValidator implements FieldValidator {
  @override
  String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return intl.emailRequired;
    }

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return intl.invalidEmail;
    }

    return null;
  }
}

abstract class FieldValidator {
  String? validate(String? value);
}

class MinLengthValidator implements FieldValidator {
  final int minLength;
  final String fieldName;

  MinLengthValidator(this.minLength, {this.fieldName = 'This field'});

  @override
  String? validate(String? value) {
    if (value == null || value.length < minLength) {
      return intl.minLength(fieldName, minLength);
    }
    return null;
  }
}

class PasswordValidator implements FieldValidator {
  @override
  String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return intl.passwordRequired;
    }

    final List<String> errors = [];

    if (value.length < 8) {
      errors.add(intl.passwordMin);
    }
    if (!RegExp('[a-z]').hasMatch(value)) {
      errors.add(intl.passwordLower);
    }
    if (!RegExp('[A-Z]').hasMatch(value)) {
      errors.add(intl.passwordUpper);
    }
    if (!RegExp(r'\d').hasMatch(value)) {
      errors.add(intl.passwordNumber);
    }
    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      errors.add(intl.passwordSpecial);
    }

    if (errors.isNotEmpty) {
      return intl.passwordInvalid(errors.join(','));
    }

    return null;
  }
}

class PhoneNumberValidator implements FieldValidator {
  @override
  String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return intl.phoneRequired;
    }

    final phoneRegex = RegExp(r'^\+?[\d\s\-]{10,}$');
    if (!phoneRegex.hasMatch(value)) {
      return intl.invalidPhone;
    }

    return null;
  }
}

// ===========================
// Concrete Validators
// ===========================

class RequiredValidator implements FieldValidator {
  final String fieldName;

  RequiredValidator({this.fieldName = 'This field'});

  @override
  String? validate(String? value) {
    if (value == null || value.trim().isEmpty) {
      return intl.fieldRequired(fieldName);
    }
    return null;
  }
}
