import 'package:dio/dio.dart';
import 'package:erudaxis/models/base_model.dart';

class StudyMaterial extends BaseModel {
  String? displayName;
  String? fileName;
  StudyMaterial({
    required super.id,
    this.displayName,
    this.fileName,
  });

  @override
  FormData toFormData() {
    throw UnimplementedError();
  }

  @override
  Map<String, Object> toMap() {
    throw UnimplementedError();
  }
}
