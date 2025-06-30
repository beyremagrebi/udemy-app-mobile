import 'package:erudaxis/core/api/from_json.dart';
import 'package:erudaxis/models/base_model.dart';
import 'package:erudaxis/models/global/facility.dart';

class User extends BaseModel {
  String? firstName;
  String? lastName;
  String? image;

  Facility? facility;

  List<Facility>? ownedFacilities;
  User({
    required super.id,
    this.firstName,
    this.lastName,
    this.image,
    this.facility,
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
      facility: FromJson.model(
        map['facility'],
        Facility.fromMap,
      ),
      ownedFacilities: FromJson.modelList(
        map['ownedFacilities'],
        Facility.fromMap,
      ),
    );
  }
  @override
  Map<String, Object> toMap() {
    throw UnimplementedError();
  }
}
