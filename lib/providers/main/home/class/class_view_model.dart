import 'package:erudaxis/models/base/base_class.dart';
import 'package:erudaxis/presentation/utils/session/facility_manager.dart';
import 'package:erudaxis/presentation/utils/snackbar_utils.dart';
import 'package:erudaxis/providers/base_view_model.dart';
import 'package:erudaxis/services/college/class_college_service.dart';
import 'package:erudaxis/services/lycee/class_lycee_service.dart';
import 'package:erudaxis/services/training_center/class_tc_services.dart';

class ClassViewModel extends BaseViewModel {
  List<BaseClass>? classes;
  ClassViewModel(super.context) {
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
      },
      onError: (error) {
        SnackBarUtils.showError(context, error);
      },
    );
  }
}
