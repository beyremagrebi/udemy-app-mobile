// ignore_for_file: always_put_control_body_on_new_line

import 'dart:io';

import 'package:dio/dio.dart';

extension MapToFormData on Map<String, dynamic> {
  FormData toFormData() {
    final formMap = <String, dynamic>{};

    Future<void> walk(String field, dynamic value) async {
      if (value == null) return;

      switch (value.runtimeType) {
        case File _:
          formMap[field] = MultipartFile.fromFileSync(
            (value as File).path,
            filename: value.uri.pathSegments.last,
          );
          break;

        case MultipartFile _:
          formMap[field] = value;
          break;

        default:
          if (value is Iterable) {
            var i = 0;
            for (final v in value) {
              walk('$field[$i]', v);
              i++;
            }
          } else if (value is Map<String, dynamic>) {
            value.forEach((k, v) => walk('$field[$k]', v));
          } else {
            formMap[field] = value.toString();
          }
      }
    }

    forEach(walk);
    return FormData.fromMap(formMap);
  }
}
