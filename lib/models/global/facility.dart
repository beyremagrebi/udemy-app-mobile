import 'package:dio/dio.dart';
import 'package:erudaxis/core/api/form_data_helper.dart';
import 'package:erudaxis/core/api/from_json.dart';
import 'package:erudaxis/models/base_model.dart';

class Facility extends BaseModel {
  String? name;
  String? type;

  Facility({
    required super.id,
    this.name,
    this.type,
  });

  Facility.fromId(String? id) : super(id: id);

  factory Facility.fromMap(dynamic map) {
    if (map is String) {
      return Facility.fromId(map);
    }
    return Facility(
      id: FromJson.string(map['_id']),
      type: FromJson.string(map['type']),
    );
  }

  @override
  FormData toFormData() => toMap().toFormData();
  @override
  Map<String, Object> toMap() {
    throw UnimplementedError();
  }
}
