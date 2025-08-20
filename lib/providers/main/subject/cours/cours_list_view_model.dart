import 'package:erudaxis/models/base/base_class.dart';
import 'package:erudaxis/models/base/base_lesson.dart';
import 'package:erudaxis/models/base/base_subject.dart';
import 'package:erudaxis/providers/base_view_model.dart';
import 'package:erudaxis/services/college/lesson_college_services.dart';
import 'package:erudaxis/services/lycee/lesson_lycee_services.dart';
import 'package:erudaxis/services/training_center/lesson_tc_services.dart';

import '../../../../presentation/utils/session/facility_manager.dart';
import '../../../../presentation/utils/snackbar_utils.dart';

class CoursListViewModel extends BaseViewModel {
  BaseClass classe;
  BaseSubject subject;
  List<BaseLesson>? courses;
  CoursListViewModel(
    super.context, {
    required this.classe,
    required this.subject,
  }) {
    loadCourses();
  }

  Future<void> loadCourses() async {
    await makeApiCall(
      displayLoading: false,
      displayError: false,
      apiCall: FacilityManager.functionByFacility(
        college: () => LessonCollegeServices().getLessonBySubjectAndClass(
          classId: classe.id,
          subjectId: subject.id,
          subjectType: 'Cours',
        ),
        lycee: () => LessonLyceeServices().getLessonBySubjectAndClass(
          classId: classe.id,
          subjectId: subject.id,
          subjectType: 'Cours',
        ),
        trainingCenter: () => LessonTcServices().getLessonBySubjectAndClass(
          classId: classe.id,
          subjectId: subject.id,
        ),
      ),
      onSuccess: (lessonList) {
        courses = lessonList;
      },
      onError: (error) {
        SnackBarUtils.showError(context, error);
      },
    );
  }
}
