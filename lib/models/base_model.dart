import 'package:dio/dio.dart';

abstract class BaseModel {
  final String? id;

  BaseModel({required this.id});
  FormData toFormData();
  Map<String, Object> toMap();
}
