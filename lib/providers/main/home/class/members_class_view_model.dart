import 'package:erudaxis/models/global/user.dart';
import 'package:erudaxis/presentation/utils/snackbar_utils.dart';
import 'package:erudaxis/providers/base_view_model.dart';

import '../../../../presentation/utils/session/facility_manager.dart';
import '../../../../services/college/class_college_service.dart';
import '../../../../services/lycee/class_lycee_service.dart';
import '../../../../services/training_center/class_tc_services.dart';

class MembersClassViewModel extends BaseViewModel {
  List<User>? students;
  String? classId;
  MembersClassViewModel(super.context, {required this.classId}) {
    loadStudents();
  }

  Future<void> loadStudents() async {
    await makeApiCall(
      displayLoading: false,
      displayError: false,
      apiCall: FacilityManager.functionByFacility(
        college: () => ClassCollegeServices().getStudentsByClass(classId),
        lycee: () => ClassLyceeServices().getStudentsByClass(classId),
        trainingCenter: () => ClassTcServices().getStudentsByClass(classId),
      ),
      onSuccess: (users) {
        students = users;
      },
      onError: (error) {
        SnackBarUtils.showError(context, error);
      },
    );
  }
}
