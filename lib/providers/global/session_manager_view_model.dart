import 'package:erudaxis/core/constants/constant.dart';
import 'package:erudaxis/presentation/auth/login_view.dart';
import 'package:erudaxis/presentation/utils/navigator_utils.dart';
import 'package:erudaxis/presentation/utils/session/facility_manager.dart';
import 'package:erudaxis/presentation/utils/session/token_manager.dart';
import 'package:erudaxis/providers/base_view_model.dart';
import 'package:erudaxis/services/auth/auth_service.dart';
import 'package:erudaxis/services/global/user_service.dart';

import '../../models/global/facility.dart';
import '../../models/global/user.dart';
import '../../services/global/facility_services.dart';

class SessionManager extends BaseViewModel {
  User? user;
  Facility? facility;
  SessionManager(super.context);
  Future<void> loadFacility(String? id) async {
    await makeApiCall(
      apiCall: FacilityServices.shared.getFacilityById(id),
      onSuccess: (model) {
        facility = model;
        FacilityManager.initilizeFacility(model);
      },
    );
  }

  Future<void> loadUser() async {
    await makeApiCall(
      displayLoading: false,
      apiCall:
          UserService.shared.getUserById(TokenManager.extractIdFromToken()),
      onSuccess: (model) async {
        user = model;
        await loadFacility(model.facility?.id);
      },
      onError: (_) {
        throw Exception('Could not initialize user');
      },
    );
  }

  Future<void> logout() async {
    await makeApiCall(
      apiCall: AuthService.shared.logout(),
      onSuccess: (_) async {
        await TokenManager.shared.clear();
        if (context.mounted) {
          navigateToDeleteTree(mainContext, const LoginView());
        }
      },
    );
  }

  Future<void> updateUser(User updatedUser) async {
    user = updatedUser;
    update();
  }
}
