import 'package:dio/dio.dart';
import 'package:erudaxis/core/config/media/exstension.dart';

import '../../core/api/from_json.dart';
import '../base/base_scolarity_config.dart';

class CollegeConfig extends ScholarityConfigBase {
  String? enterpriseId;
  List<String>? pointage;
  List<String>? pointageConfig;
  List<String>? blocs;
  List<String>? examTypes;
  List<String>? formules;
  List<String>? periodes;
  List<String>? salles;
  List<String>? sousPeriodes;
  List<String>? typeSalles;
  List<String>? levels;
  List<String>? projet;
  List<String>? tache;
  List<String>? subjects;
  List<CollegeConfig>? classes;
  List<String>? quizzes;
  List<String>? sharedSubjects;

  CollegeConfig({
    required super.id,
    this.enterpriseId,
    this.pointage,
    this.pointageConfig,
    this.blocs,
    this.examTypes,
    this.formules,
    this.periodes,
    this.salles,
    this.sousPeriodes,
    this.typeSalles,
    this.levels,
    this.projet,
    this.tache,
    this.subjects,
    this.classes,
    this.quizzes,
    this.sharedSubjects,
  });

  factory CollegeConfig.fromMap(dynamic map) {
    if (map is String) {
      return CollegeConfig(id: map);
    }

    return CollegeConfig(
      id: FromJson.string(map['_id']),
      enterpriseId: FromJson.string(map['enterpriseId']),
      pointage: FromJson.list(map['pointage']),
      pointageConfig: FromJson.list(map['pointageConfig']),
      blocs: FromJson.list(map['blocs']),
      examTypes: FromJson.list(map['examTypes']),
      formules: FromJson.list(map['formules']),
      periodes: FromJson.list(map['periodes']),
      salles: FromJson.list(map['salles']),
      sousPeriodes: FromJson.list(map['sousPeriodes']),
      typeSalles: FromJson.list(map['typeSalles']),
      levels: FromJson.list(map['levels']),
      projet: FromJson.list(map['projet']),
      tache: FromJson.list(map['tache']),
      subjects: FromJson.list(map['subjects']),
      classes: FromJson.list(map['classes']),
      quizzes: FromJson.list(map['quizzes']),
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
    map.add('_id', id);
    map.add('enterpriseId', enterpriseId);
    map.add('pointage', pointage);
    map.add('pointageConfig', pointageConfig);
    map.add('blocs', blocs);
    map.add('examTypes', examTypes);
    map.add('formules', formules);
    map.add('periodes', periodes);
    map.add('salles', salles);
    map.add('sousPeriodes', sousPeriodes);
    map.add('typeSalles', typeSalles);
    map.add('levels', levels);
    map.add('projet', projet);
    map.add('tache', tache);
    map.add('subjects', subjects);
    map.add('classes', classes);
    map.add('quizzes', quizzes);
    map.add('sharedSubjects', sharedSubjects);

    return map;
  }
}
