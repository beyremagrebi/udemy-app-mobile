abstract class BaseModel {
  final String? id;

  BaseModel({required this.id});
  Map<String, Object> toMap();
}
