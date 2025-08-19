import 'package:erudaxis/models/base/base_subject.dart';
import 'package:erudaxis/models/global/user.dart';
import 'package:erudaxis/providers/base_view_model.dart';

import '../../../presentation/utils/session/facility_manager.dart';
import '../../../presentation/utils/snackbar_utils.dart';
import '../../../services/college/subject_college_services.dart';
import '../../../services/lycee/subject_lycee_services.dart';
import '../../../services/training_center/subject_tc_services.dart';

class InstructorsForSubjectViewModel extends BaseViewModel {
  final BaseSubject subject;
  List<User>? instructors;
  InstructorsForSubjectViewModel(super.context, {required this.subject}) {
    loadInstructors();
  }

  Future<void> loadInstructors() async {
    await makeApiCall(
      displayLoading: false,
      displayError: false,
      apiCall: FacilityManager.functionByFacility(
        college: () => SubjectCollegeServices().getInstructorsBysubject(
          subjectId: subject.id,
        ),
        lycee: () => SubjectLyceeServices().getInstructorsBysubject(
          subjectId: subject.id,
        ),
        trainingCenter: () => SubjectTcServices().getInstructorsBysubject(
          subjectId: subject.id,
        ),
      ),
      onSuccess: (instructorsList) {
        instructors = instructorsList;
      },
      onError: (error) {
        SnackBarUtils.showError(context, error);
      },
    );
  }
}
