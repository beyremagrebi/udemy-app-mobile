import 'package:erudaxis/core/api/from_json.dart';
import 'package:erudaxis/models/base_model.dart';

class GithubRelease extends BaseModel {
  String? version;

  String? name;
  String? donwnloadUrl;
  GithubRelease({
    required super.id,
    this.name,
    this.version,
    this.donwnloadUrl,
  });

  factory GithubRelease.fromMap(dynamic map) {
    return GithubRelease(
        id: FromJson.string(map['id']),
        name: FromJson.string(map['name']),
        version: FromJson.string(map['tag_name'])?.replaceFirst('v', ''),
        donwnloadUrl: FromJson.string(map['assets'][0]['url']));
  }
  @override
  Map<String, Object> toMap() {
    throw UnimplementedError();
  }
}
