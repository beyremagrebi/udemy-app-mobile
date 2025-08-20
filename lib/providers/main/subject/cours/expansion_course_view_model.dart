import 'package:erudaxis/models/base/base_subject_type.dart';
import 'package:erudaxis/models/college/subject_college.dart';
import 'package:erudaxis/models/lycee/subject_lycee.dart';
import 'package:erudaxis/providers/base_view_model.dart';

import '../../../../models/base/base_class.dart';
import '../../../../models/base/base_lesson.dart';
import '../../../../models/base/base_subject.dart';
import '../../../../presentation/utils/session/facility_manager.dart';
import '../../../../presentation/utils/snackbar_utils.dart';
import '../../../../services/college/lesson_college_services.dart';
import '../../../../services/lycee/lesson_lycee_services.dart';
import '../../../../services/training_center/lesson_tc_services.dart';

class ExpansionCourseViewModel extends BaseViewModel {
  BaseClass classe;
  BaseSubject subject;
  List<BaseLesson>? courses;

  String? expandedCourseId;

  List<BaseSubjectType> subjectTypes = [];
  BaseSubjectType? selectedSubjectType;
  ExpansionCourseViewModel(
    super.context, {
    required this.classe,
    required this.subject,
  }) {
    FacilityManager.functionByFacility(
      trainingCenter: () {},
      lycee: () {
        prepareSubjecTypes();
      },
      college: () {
        prepareSubjecTypes();
      },
    );
    loadCourses();
  }

  bool isCourseExpanded(String courseId) {
    return expandedCourseId == courseId;
  }

  Future<void> loadCourses() async {
    await makeApiCall(
      displayLoading: false,
      displayError: false,
      apiCall: FacilityManager.functionByFacility(
        college: () => LessonCollegeServices().getLessonBySubjectAndClass(
          classId: classe.id,
          subjectId: subject.id,
          subjectType: selectedSubjectType?.type,
        ),
        lycee: () => LessonLyceeServices().getLessonBySubjectAndClass(
          classId: classe.id,
          subjectId: subject.id,
          subjectType: selectedSubjectType?.type,
        ),
        trainingCenter: () => LessonTcServices().getLessonBySubjectAndClass(
          classId: classe.id,
          subjectId: subject.id,
        ),
      ),
      onSuccess: (lessonList) {
        courses = lessonList;
        update();
      },
      onError: (error) {
        SnackBarUtils.showError(context, error);
      },
    );
  }

  void prepareSubjecTypes() {
    FacilityManager.functionByFacility(
      trainingCenter: () {},
      lycee: () {
        subjectTypes = (subject as SubjectLycee).subjectTypes ?? [];
        selectedSubjectType = subjectTypes.first;
      },
      college: () {
        subjectTypes = (subject as SubjectCollege).subjectTypes ?? [];
        selectedSubjectType = subjectTypes.first;
      },
    );
    update();
  }

  void selectSubjectType(String subjectTypeId) {
    if (selectedSubjectType?.id == subjectTypeId) {
      return;
    }

    final foundType = subjectTypes.firstWhere(
      (type) => type.id == subjectTypeId,
    );

    selectedSubjectType = foundType;
    loadCourses();
    update();
  }

  void toggleExpanded({required bool value, String? courseId}) {
    if (value) {
      expandedCourseId = courseId;
    } else if (expandedCourseId == courseId) {
      expandedCourseId = null;
    }
    update();
  }
}
