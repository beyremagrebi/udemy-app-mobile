class ValidationHelpers {
  // Combine multiple validators
  static String? Function(String?) combineValidators(
    List<String? Function(String?)> validators,
  ) {
    return (value) {
      for (final validator in validators) {
        final result = validator(value);
        if (result != null) {
          return result;
        }
      }
      return null;
    };
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }

    return null;
  }

  static String? validateMinLength(String? value, int minLength,
      [String? fieldName]) {
    if (value == null || value.length < minLength) {
      return '${fieldName ?? 'This field'} must be at least $minLength characters';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }

    final bool hasLowercase = RegExp('[a-z]').hasMatch(value);
    final bool hasUppercase = RegExp('[A-Z]').hasMatch(value);
    final bool hasDigit = RegExp(r'\d').hasMatch(value);
    final bool hasSpecialChar =
        RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value);

    final List<String> missing = [];

    if (!hasLowercase) {
      missing.add('lowercase letter');
    }
    if (!hasUppercase) {
      missing.add('uppercase letter');
    }
    if (!hasDigit) {
      missing.add('number');
    }
    if (!hasSpecialChar) {
      missing.add('special character');
    }

    if (missing.isNotEmpty) {
      return 'Password must contain: ${missing.join(', ')}';
    }

    return null;
  }

  static String? validatePasswordComprehensive(String? value) {
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

    if (!RegExp(r'[!@#$%^&*()_+\-=\[\]{};:"\\|,.<>\/?~`]').hasMatch(value)) {
      errors.add('special character');
    }

    if (errors.isNotEmpty) {
      return 'Password must contain: ${errors.join(', ')}';
    }

    return null;
  }

  static String? validatePasswordFlexible(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }

    if (!RegExp(
            r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*()_+\-=\[\]{};:"\\|,.<>\/?])')
        .hasMatch(value)) {
      return 'Password must contain uppercase, lowercase, number, and special character';
    }

    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }

    final phoneRegex = RegExp(r'^\+?[\d\s\-$$$$]{10,}$');
    if (!phoneRegex.hasMatch(value)) {
      return 'Please enter a valid phone number';
    }

    return null;
  }

  static String? validateRequired(String? value, [String? fieldName]) {
    if (value == null || value.trim().isEmpty) {
      return '${fieldName ?? 'This field'} is required';
    }
    return null;
  }
}
