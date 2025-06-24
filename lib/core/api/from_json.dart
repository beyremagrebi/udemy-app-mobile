// ignore_for_file: inference_failure_on_untyped_parameter

class FromJson {
  static bool? boolean(value) {
    if (value == null) {
      return null;
    }

    if (value is bool) {
      return value;
    }

    if (value is String) {
      return value.toLowerCase() == 'true';
    }

    if (value is num) {
      return value != 0;
    }

    return null;
  }

  static double? doubleValue(value) {
    if (value == null) {
      return null;
    }

    if (value is double) {
      return value;
    }

    if (value is int) {
      return value.toDouble();
    }

    if (value is String) {
      return double.tryParse(value);
    }

    return null;
  }

  static int? integer(value) {
    if (value == null) {
      return null;
    }

    if (value is int) {
      return value;
    }

    if (value is double) {
      return value.toInt();
    }

    if (value is String) {
      return int.tryParse(value);
    }

    return null;
  }

  static List<T>? list<T>(value) {
    if (value == null || value is! List) {
      return null;
    }

    try {
      return List<T>.from(value);
    } on Exception {
      return null;
    }
  }

  static Map<String, dynamic>? map(value) {
    if (value is Map<String, dynamic>) {
      return value;
    }

    return null;
  }

  static String? string(value) {
    return value?.toString();
  }
}
