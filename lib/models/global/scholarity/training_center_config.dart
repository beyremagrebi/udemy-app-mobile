import 'package:dio/dio.dart';

import '../../../core/api/from_json.dart';
import '../base_scolarity_config.dart';
import '../facility.dart';

class TrainingCenterConfig extends ScholarityConfigBase {
  Facility? facility;
  String? enterpriseId;
  List<String>? subjects;
  List<String>? classes;
  List<String>? attendances;
  List<String>? quizzes;
  List<String>? results;
  List<String>? projet;
  List<String>? sharedSubjects;

  TrainingCenterConfig({
    required super.id,
    this.facility,
    this.enterpriseId,
    this.subjects,
    this.classes,
    this.attendances,
    this.quizzes,
    this.results,
    this.projet,
    this.sharedSubjects,
  });

  TrainingCenterConfig.fromId(String? id) : super(id: id);

  factory TrainingCenterConfig.fromMap(dynamic map) {
    if (map is String) {
      return TrainingCenterConfig.fromId(map);
    }

    return TrainingCenterConfig(
      id: FromJson.string(map['_id']),
      facility: FromJson.model(map['facilityId'], Facility.fromMap),
      enterpriseId: FromJson.string(map['enterpriseId']),
      classes: FromJson.list(
        map['classes'],
      ),
      subjects: FromJson.list(map['subjects']),
      attendances: FromJson.list(map['attendances']),
      projet: FromJson.list(map['projet']),
      quizzes: FromJson.list(map['quizzes']),
      results: FromJson.list(map['results']),
      sharedSubjects: FromJson.list(map['sharedSubjects']),
    );
  }

  @override
  FormData toFormData() {
    throw UnimplementedError();
  }

  @override
  Map<String, Object> toMap() {
    final Map<String, Object> map = {};

    return map;
  }
}
