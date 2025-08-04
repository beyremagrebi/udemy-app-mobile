import 'package:erudaxis/core/constants/constant.dart';
import 'package:erudaxis/core/enum/role.dart';
import 'package:erudaxis/core/firebase/firebase_api.dart';
import 'package:erudaxis/presentation/auth/login_view.dart';
import 'package:erudaxis/presentation/utils/navigator_utils.dart';
import 'package:erudaxis/presentation/utils/session/facility_manager.dart';
import 'package:erudaxis/presentation/utils/session/token_manager.dart';
import 'package:erudaxis/providers/base_view_model.dart';
import 'package:erudaxis/providers/main/bottom_navigation_view_model.dart';
import 'package:erudaxis/services/auth/auth_service.dart';
import 'package:erudaxis/services/global/user_service.dart';
import 'package:provider/provider.dart';

import '../../models/global/facility.dart';
import '../../models/global/user.dart';
import '../../services/global/facility_services.dart';

class SessionManager extends BaseViewModel {
  User? user;
  Facility? facility;
  SessionManager(super.context);

  T? functionByRole<T>({
    required T Function() superAdmin,
    required T Function() companyAdmin,
    required T Function() collaborator,
    required T Function() instructor,
    required T Function() student,
    required T Function() responsable,
  }) {
    switch (user!.role!) {
      case Role.superAdmin:
        return superAdmin.call();
      case Role.companyAdmin:
        return companyAdmin.call();
      case Role.collaborator:
        return collaborator.call();
      case Role.instructor:
        return instructor.call();
      case Role.student:
        return student.call();
      case Role.responsable:
        return responsable.call();
    }
  }

  Future<void> loadFacility(String? id) async {
    await makeApiCall(
      apiCall: FacilityServices.shared.getFacilityById(id),
      onSuccess: (model) async {
        facility = model;
        user?.facility = model;
        update();
        await FacilityManager.initilizeFacility(model);
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
        await updateFcmToken(model.id);
      },
      onError: (_) {
        throw Exception('Could not initialize user');
      },
    );
  }

  Future<void> logout() async {
    await updateFcmToken(user?.id, froLogout: true);
    await makeApiCall(
      apiCall: AuthService.shared.logout(),
      onSuccess: (_) async {
        await TokenManager.shared.clear();
        if (context.mounted) {
          context.read<BottomNavigationViewModel>().onSelectChange(0);
          navigateToDeleteTree(mainContext, const LoginView());
        }
      },
    );
  }

  Future<void> updateFcmToken(String? id, {bool froLogout = false}) async {
    final fcmTken =
        froLogout == false ? await FirebaseApi.shared.getToken() : null;
    await makeApiCall(
      displayLoading: false,
      apiCall: UserService.shared.updateFcmTOken(id, fcmTken),
      onSuccess: (model) async {
        user?.fcmToken = model.fcmToken;
      },
      onError: (_) {
        throw Exception('Could not initialize user');
      },
    );
  }

  Future<void> updateUser(User updatedUser) async {
    user = updatedUser;
    update();
  }

  T? valueByRole<T>({
    required T superAdmin,
    required T companyAdmin,
    required T collaborator,
    required T instructor,
    required T student,
    required T responsable,
  }) {
    switch (user!.role!) {
      case Role.superAdmin:
        return superAdmin;
      case Role.companyAdmin:
        return companyAdmin;
      case Role.collaborator:
        return collaborator;
      case Role.instructor:
        return instructor;
      case Role.student:
        return student;
      case Role.responsable:
        return responsable;
    }
  }
}
