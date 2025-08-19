import 'package:erudaxis/models/base/base_class.dart';
import 'package:erudaxis/models/base/base_subject.dart';
import 'package:erudaxis/presentation/utils/session/token_manager.dart';
import 'package:erudaxis/providers/base_view_model.dart';
import 'package:erudaxis/services/college/subject_college_services.dart';
import 'package:erudaxis/services/lycee/subject_lycee_services.dart';
import 'package:erudaxis/services/training_center/subject_tc_services.dart';

import '../../../presentation/utils/session/facility_manager.dart';
import '../../../presentation/utils/snackbar_utils.dart';

class SubjectForClassViewModel extends BaseViewModel {
  List<BaseSubject>? subjects;
  BaseClass? classe;
  SubjectForClassViewModel(super.context, {required this.classe}) {
    loadSubjects();
  }

  Future<void> loadSubjects() async {
    await makeApiCall(
      displayLoading: false,
      displayError: false,
      apiCall: FacilityManager.functionByFacility(
        college: () => SubjectCollegeServices().getSubjectsByClassAndRole(
          classId: classe?.id,
          userId: TokenManager.extractIdFromToken(),
        ),
        lycee: () => SubjectLyceeServices().getSubjectsByClassAndRole(
          classId: classe?.id,
          userId: TokenManager.extractIdFromToken(),
        ),
        trainingCenter: () => SubjectTcServices().getSubjectsByClassAndRole(
          classId: classe?.id,
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
}
