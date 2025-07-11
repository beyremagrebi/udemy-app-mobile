import 'package:erudaxis/core/constants/constant.dart';
import 'package:erudaxis/presentation/auth/login_view.dart';
import 'package:erudaxis/presentation/utils/navigator_utils.dart';
import 'package:erudaxis/presentation/utils/session/facility_manager.dart';
import 'package:erudaxis/presentation/utils/session/token_manager.dart';
import 'package:erudaxis/providers/base_view_model.dart';
import 'package:erudaxis/services/auth/auth_service.dart';
import 'package:erudaxis/services/global/user_service.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

import '../../models/global/user.dart';

class SessionManager extends BaseViewModel {
  User? user;

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController birthdayController = TextEditingController();

  final TextEditingController facilityController = TextEditingController();

  String? imageFilePath;
  bool removeIcon = false;

  SessionManager(super.context);

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    phoneNumberController.dispose();
    emailController.dispose();
    birthdayController.dispose();
    super.dispose();
  }

  Future<void> loadUser() async {
    await makeApiCall(
      displayLoading: false,
      apiCall:
          UserService.shared.getUserById(TokenManager.extractIdFromToken()),
      onSuccess: (model) async {
        user = model;
        await FacilityManager.loadFacility(model.facility?.id);
        _setControllersFromUser(model);
        update();
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

  void onLongPress() {
    removeIcon = !removeIcon;
    update();
  }

  void removeImage() {
    user?.image = defualtIconAvatar;
    imageFilePath = null;
    removeIcon = false;
    update();
  }

  Future<void> selectImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    imageFilePath = image?.path;
    if (imageFilePath != null) {
      update();
    }
  }

  Future<void> updateUser() async {
    if (user == null) {
      return;
    }

    user!
      ..firstName = firstNameController.text.trim()
      ..lastName = lastNameController.text.trim()
      ..phoneNumber = phoneNumberController.text.trim()
      ..email = emailController.text.trim()
      ..birthday = birthdayController.text.trim();

    await makeApiCall(
      apiCall: UserService.shared.updateUser(user!, imageFilePath ?? ''),
      onSuccess: (userUpdated) {
        _setControllersFromUser(userUpdated);
        imageFilePath = null;
        user = userUpdated;
        update();
      },
    );
  }

  void _setControllersFromUser(User u) {
    firstNameController.text = u.firstName ?? '';
    lastNameController.text = u.lastName ?? '';
    emailController.text = u.email ?? '';
    phoneNumberController.text = u.phoneNumber ?? '';
    birthdayController.text = u.birthday ?? '';
    facilityController.text = FacilityManager.facility.name ?? '';
  }
}
