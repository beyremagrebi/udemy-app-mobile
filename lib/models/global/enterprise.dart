import 'package:dio/dio.dart';
import 'package:erudaxis/core/api/from_json.dart';
import 'package:erudaxis/models/base_model.dart';
import 'package:erudaxis/models/global/facility.dart';

class Enterprise extends BaseModel {
  String? name;
  String? email;
  String? phone;
  String? logo;
  String? type;
  String? serialNumber;
  List<Facility>? facilites;
  Enterprise({
    required super.id,
    this.email,
    this.facilites,
    this.logo,
    this.name,
    this.phone,
    this.serialNumber,
    this.type,
  });

  Enterprise.fromId(String? id) : super(id: id);

  factory Enterprise.fromMap(dynamic map) {
    if (map is String) {
      return Enterprise.fromId(map);
    }
    return Enterprise(
      id: FromJson.string(map['_id']),
      name: FromJson.string(map['name']),
      email: FromJson.string(map['email']),
      logo: FromJson.string(map['logo']),
      phone: FromJson.string(map['phone']),
      serialNumber: FromJson.string(map['serialNumber']),
      type: FromJson.string(map['type']),
      facilites: FromJson.modelList(map['facilities'], Facility.fromMap),
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
