import 'package:erudaxis/core/api/from_json.dart';
import 'package:erudaxis/models/base_model.dart';

class GithubRelease extends BaseModel {
  String? tagName;

  String? name;
  GithubRelease({required super.id, this.name, this.tagName});

  factory GithubRelease.fromMap(dynamic map) {
    return GithubRelease(
      id: FromJson.string(map['id']),
      name: FromJson.string(map['name'])?.replaceFirst('v', ''),
      tagName: FromJson.string(map['tag_name']),
    );
  }
  @override
  Map<String, Object> toMap() {
    throw UnimplementedError();
  }
}
