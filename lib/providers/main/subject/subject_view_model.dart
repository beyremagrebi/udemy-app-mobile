import 'package:erudaxis/models/base/base_class.dart';
import 'package:erudaxis/models/base/base_subject.dart';
import 'package:erudaxis/presentation/utils/session/token_manager.dart';
import 'package:erudaxis/providers/base_view_model.dart';
import 'package:erudaxis/services/college/subject_college_services.dart';
import 'package:erudaxis/services/lycee/subject_lycee_services.dart';
import 'package:erudaxis/services/training_center/subject_tc_services.dart';

import '../../../presentation/utils/session/facility_manager.dart';
import '../../../presentation/utils/snackbar_utils.dart';
import '../../../services/college/class_college_service.dart';
import '../../../services/lycee/class_lycee_service.dart';
import '../../../services/training_center/class_tc_services.dart';

class SubjectViewModel extends BaseViewModel {
  List<BaseClass>? classes;
  List<BaseSubject>? subjects;
  BaseClass? selectedClass;
  SubjectViewModel(super.context) {
    loadClasses();
  }

  Future<void> loadClasses() async {
    await makeApiCall(
      displayLoading: false,
      displayError: false,
      apiCall: FacilityManager.functionByFacility(
        college: () => ClassCollegeServices().getClasses(),
        lycee: () => ClassLyceeServices().getClasses(),
        trainingCenter: () => ClassTcServices().getClasses(),
      ),
      onSuccess: (classesList) {
        classes = classesList;
        if (classes != null && classes!.isNotEmpty) {
          selectedClass = classes!.first;
          loadSubjects();
        }
      },
      onError: (error) {
        SnackBarUtils.showError(context, error);
      },
    );
  }

  Future<void> loadSubjects() async {
    await makeApiCall(
      displayLoading: false,
      displayError: false,
      apiCall: FacilityManager.functionByFacility(
        college: () => SubjectCollegeServices().getSubjectsByClassAndRole(
          classId: selectedClass?.id,
          userId: TokenManager.extractIdFromToken(),
        ),
        lycee: () => SubjectLyceeServices().getSubjectsByClassAndRole(
          classId: selectedClass?.id,
          userId: TokenManager.extractIdFromToken(),
        ),
        trainingCenter: () => SubjectTcServices().getSubjectsByClassAndRole(
          classId: selectedClass?.id,
          userId: TokenManager.extractIdFromToken(),
        ),
      ),
      onSuccess: (subjectList) {
        subjects = subjectList;
      },
      onError: (error) {
        SnackBarUtils.showError(context, error);
      },
    );
  }

  void selectedClassIndex(String? classId) {
    if (classes == null || classId == null) {
      return;
    }
    if (selectedClass?.id == classId) {
      return;
    }
    final foundClass = classes!.firstWhere((c) => c.id == classId);
    selectedClass = foundClass;
    loadSubjects();
    update();
  }
}
