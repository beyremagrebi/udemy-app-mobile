import 'dart:io';

import 'package:dio/dio.dart';

class MultipartDataBuilder {
  static Future<FormData> buildFormData({
    required String filePath,
    required String fieldName,
    Map<String, dynamic>? additionalFields,
    String? fileName,
  }) async {
    final file = File(filePath);
    if (!await file.exists()) {
      throw Exception('File does not exist: $filePath');
    }

    final formData = FormData();

    // Add file
    formData.files.add(
      MapEntry(
        fieldName,
        await MultipartFile.fromFile(
          filePath,
          filename: fileName ?? file.path.split('/').last,
        ),
      ),
    );

    // Add additional fields
    if (additionalFields != null) {
      additionalFields.forEach((key, value) {
        formData.fields.add(MapEntry(key, value.toString()));
      });
    }

    return formData;
  }

  static FormData buildFormDataFromMap(Map<String, dynamic> data) {
    final formData = FormData();

    data.forEach((key, value) {
      if (value is File) {
        formData.files.add(
          MapEntry(
            key,
            MultipartFile.fromFileSync(
              value.path,
              filename: value.path.split('/').last,
            ),
          ),
        );
      } else if (value is MultipartFile) {
        formData.files.add(MapEntry(key, value));
      } else {
        formData.fields.add(MapEntry(key, value.toString()));
      }
    });

    return formData;
  }
}
