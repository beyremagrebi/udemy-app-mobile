import 'package:dio/dio.dart';
import 'package:erudaxis/core/config/media/exstension.dart';

import '../../core/api/from_json.dart';
import '../base/base_scolarity_config.dart';

class LyceeConfig extends BaseScolarityConfig {
  String? enterpriseId;
  List<String>? pointage;
  List<String>? pointageConfig;
  List<String>? projet;
  List<String>? tache;
  List<String>? blocs;
  List<String>? examTypes;
  List<String>? formules;
  List<String>? periodes;
  List<String>? salles;
  List<String>? sousPeriodes;
  List<String>? typeSalles;
  List<String>? levels;
  List<String>? parcours;
  List<String>? sections;
  List<String>? subjects;
  List<LyceeConfig>? classes;
  List<String>? quizzes;
  List<String>? sharedSubjects;

  LyceeConfig({
    required super.id,
    this.enterpriseId,
    this.pointage,
    this.pointageConfig,
    this.projet,
    this.tache,
    this.blocs,
    this.examTypes,
    this.formules,
    this.periodes,
    this.salles,
    this.sousPeriodes,
    this.typeSalles,
    this.levels,
    this.parcours,
    this.sections,
    this.subjects,
    this.classes,
    this.quizzes,
    this.sharedSubjects,
  });

  factory LyceeConfig.fromMap(dynamic map) {
    if (map is String) {
      return LyceeConfig(id: map);
    }

    return LyceeConfig(
      id: FromJson.string(map['_id']),
      enterpriseId: FromJson.string(map['enterpriseId']),
      pointage: FromJson.list(map['pointage']),
      pointageConfig: FromJson.list(map['pointageConfig']),
      projet: FromJson.list(map['projet']),
      tache: FromJson.list(map['tache']),
      blocs: FromJson.list(map['blocs']),
      examTypes: FromJson.list(map['examTypes']),
      formules: FromJson.list(map['formules']),
      periodes: FromJson.list(map['periodes']),
      salles: FromJson.list(map['salles']),
      sousPeriodes: FromJson.list(map['sousPeriodes']),
      typeSalles: FromJson.list(map['typeSalles']),
      levels: FromJson.list(map['levels']),
      parcours: FromJson.list(map['parcours']),
      sections: FromJson.list(map['sections']),
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
    map.add('projet', projet);
    map.add('tache', tache);
    map.add('blocs', blocs);
    map.add('examTypes', examTypes);
    map.add('formules', formules);
    map.add('periodes', periodes);
    map.add('salles', salles);
    map.add('sousPeriodes', sousPeriodes);
    map.add('typeSalles', typeSalles);
    map.add('levels', levels);
    map.add('parcours', parcours);
    map.add('sections', sections);
    map.add('subjects', subjects);
    map.add('classes', classes);
    map.add('quizzes', quizzes);
    map.add('sharedSubjects', sharedSubjects);

    return map;
  }
}
