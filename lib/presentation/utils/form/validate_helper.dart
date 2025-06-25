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
      return 'Email is required';
    }

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
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
      return '$fieldName must be at least $minLength characters';
    }
    return null;
  }
}

class PasswordValidator implements FieldValidator {
  @override
  String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    final List<String> errors = [];

    if (value.length < 8) {
      errors.add('at least 8 characters');
    }
    if (!RegExp('[a-z]').hasMatch(value)) {
      errors.add('lowercase letter');
    }
    if (!RegExp('[A-Z]').hasMatch(value)) {
      errors.add('uppercase letter');
    }
    if (!RegExp(r'\d').hasMatch(value)) {
      errors.add('number');
    }
    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      errors.add('special character');
    }

    if (errors.isNotEmpty) {
      return 'Password must contain: ${errors.join(', ')}';
    }

    return null;
  }
}

class PhoneNumberValidator implements FieldValidator {
  @override
  String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }

    final phoneRegex = RegExp(r'^\+?[\d\s\-]{10,}$');
    if (!phoneRegex.hasMatch(value)) {
      return 'Please enter a valid phone number';
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
      return '$fieldName is required';
    }
    return null;
  }
}
