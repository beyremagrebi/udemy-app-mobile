import 'package:erudaxis/providers/base_view_model.dart';
import 'package:erudaxis/services/base/class_services.dart';

class ClassViewModel extends BaseViewModel {
  ClassViewModel(super.context) {
    loadClasses();
  }

  Future<void> loadClasses() async {
    await makeApiCall(
      apiCall: ClassServices.tc.getClasses(),
      onSuccess: (model) {},
    );
  }
}
