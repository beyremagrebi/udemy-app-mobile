import 'package:dio/dio.dart';
import 'package:erudaxis/models/base_model.dart';

class Teaching extends BaseModel {
  Teaching({required super.id});

  @override
  FormData toFormData() {
    throw UnimplementedError();
  }

  @override
  Map<String, Object> toMap() {
    throw UnimplementedError();
  }
}
