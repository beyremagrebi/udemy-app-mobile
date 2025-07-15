import 'package:dio/dio.dart';
import 'package:erudaxis/core/api/form_data_helper.dart';
import 'package:erudaxis/core/api/from_json.dart';
import 'package:erudaxis/core/config/media/exstension.dart';
import 'package:erudaxis/core/enum/gender.dart';
import 'package:erudaxis/core/enum/role.dart';
import 'package:erudaxis/models/base_model.dart';
import 'package:erudaxis/models/global/facility.dart';

class User extends BaseModel {
  String? firstName;
  String? lastName;
  String? image;
  String? email;
  String? cin;
  String? phoneNumber;
  String? birthday;

  Facility? facility;
  Gender? gender;
  Role? role;

  String? enterprise;

  List<Facility>? ownedFacilities;
  User({
    required super.id,
    this.role,
    this.firstName,
    this.lastName,
    this.image,
    this.email,
    this.cin,
    this.phoneNumber,
    this.birthday,
    this.facility,
    this.gender,
    this.enterprise,
    this.ownedFacilities,
  });
  User.fromId(String? id) : super(id: id);

  factory User.fromMap(dynamic map) {
    if (map is String) {
      return User.fromId(map);
    }

    return User(
      id: FromJson.string(map['_id']),
      firstName: FromJson.string(
        map['firstName'],
      ),
      lastName: FromJson.string(
        map['lastName'],
      ),
      image: FromJson.string(map['imageUrl']),
      email: FromJson.string(map['email']),
      role: FromJson.enumValue(
          RoleExtension.fromBackendValue(map['role'].toString())),
      cin: FromJson.string(map['cin']),
      phoneNumber: FromJson.string(map['phoneNumber']),
      birthday: FromJson.string(map['birthday']),
      gender: FromJson.enumValue<Gender>(
          GenderExtension.fromBackendValue(map['gender'].toString())),
      facility: FromJson.model(
        map['facility'],
        Facility.fromMap,
      ),
      ownedFacilities: FromJson.modelList(
        map['ownedFacilities'],
        Facility.fromMap,
      ),
      enterprise: FromJson.string(map['enterprise']),
    );
  }

  bool get isMen => gender == Gender.men;

  @override
  FormData toFormData() => toMap().toFormData();

  @override
  Map<String, Object> toMap() {
    final Map<String, Object> map = {};
    map.add('firstName', firstName);
    map.add('lastName', lastName);
    map.add('email', email);
    map.add('phoneNumber', phoneNumber);
    map.add('imageUrl', image);
    map.add('cin', cin);
    map.add('birthday', birthday);
    map.add('facility', facility?.id);
    map.add('ownedFacilities', ownedFacilities);
    map.add(
      'gender',
      gender?.toBackendValue(),
    );

    return map;
  }
}
