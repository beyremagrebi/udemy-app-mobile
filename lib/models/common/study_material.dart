import 'package:dio/dio.dart';
import 'package:erudaxis/core/api/from_json.dart';
import 'package:erudaxis/models/base_model.dart';

class StudyMaterial extends BaseModel {
  String? displayName;
  String? fileName;
  StudyMaterial({
    required super.id,
    this.displayName,
    this.fileName,
  });
  StudyMaterial.fromId(String? id) : super(id: id);
  factory StudyMaterial.fromMap(dynamic map) {
    if (map is String) {
      return StudyMaterial.fromId(map);
    }
    return StudyMaterial(
      id: FromJson.string(map['_id']),
      displayName: FromJson.string(map['displayName']),
      fileName: FromJson.string(map['fileName']),
    );
  }
  @override
  FormData toFormData() {
    throw UnimplementedError();
  }

  @override
  Map<String, Object> toMap() {
    throw UnimplementedError();
  }
}
