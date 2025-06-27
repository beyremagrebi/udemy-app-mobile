import 'package:erudaxis/core/api/from_json.dart';
import 'package:erudaxis/models/base_model.dart';

class User extends BaseModel {
  String? firstName;

  String? lastName;
  User({
    required super.id,
    this.firstName,
    this.lastName,
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
    );
  }
  @override
  Map<String, Object> toMap() {
    throw UnimplementedError();
  }
}
