// ignore_for_file: inference_failure_on_untyped_parameter

import 'package:erudaxis/models/base_model.dart';

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

  static T? enumValue<T>(value) {
    if (value == null) {
      return null;
    }
    return value as T;
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

  static Model? model<Model extends BaseModel>(
    dynamic value,
    Model Function(dynamic json) fromJson,
  ) {
    if (value == null) {
      return null;
    }
    return fromJson(value);
  }

  static List<Model>? modelList<Model extends BaseModel>(
    dynamic value,
    Model Function(dynamic json) fromJson,
  ) {
    if (value == null) {
      return null;
    }
    if (value is List) {
      return value
          .where((item) => item != null)
          .map((item) => fromJson(item))
          .toList();
    } else {
      throw ArgumentError('Expected a List but got ${value.runtimeType}');
    }
  }

  static String? string(value) {
    return value?.toString();
  }
}
