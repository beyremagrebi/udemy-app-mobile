import 'package:erudaxis/presentation/utils/session/facility_manager.dart';
import 'package:erudaxis/providers/base_view_model.dart';
import 'package:erudaxis/providers/global/session_manager_view_model.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/constant.dart';
import '../../../../models/global/user.dart';
import '../../../../presentation/utils/form/validate_helper.dart';
import '../../../../services/global/user_service.dart';

class PersonalInformationValidator extends BaseViewModel {
  late final FieldValidator emailValidator;
  late final FieldValidator firstNameValidator;
  late final FieldValidator lastNameValidator;
  late final FieldValidator phoneNumberValidator;

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController birthdayController = TextEditingController();
  final TextEditingController facilityController = TextEditingController();
  final TextEditingController classController = TextEditingController();
  late User? user;
  late SessionManager viewModel;
  String? imageFilePath;
  bool removeIcon = false;
  PersonalInformationValidator(
    super.context,
  ) {
    viewModel = context.read<SessionManager>();
    user = viewModel.user;
    setFromUser(user!);
    emailValidator = CompositeValidator(
      [
        RequiredValidator(fieldName: intl.emailField),
        EmailValidator(),
      ],
    );

    firstNameValidator = RequiredValidator();
    lastNameValidator = RequiredValidator();
    phoneNumberValidator = PhoneNumberValidator();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    phoneNumberController.dispose();
    emailController.dispose();
    birthdayController.dispose();
    imageFilePath = null;
    super.dispose();
  }

  void onLongPress() {
    if (user?.image != defualtIconAvatar || imageFilePath != null) {
      removeIcon = !removeIcon;
    }

    update();
  }

  void removeImage() {
    if (imageFilePath == null) {
      user?.image = defualtIconAvatar;
    } else {
      imageFilePath = null;
    }

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

  void setFromUser(User user) {
    firstNameController.text = user.firstName ?? '';
    lastNameController.text = user.lastName ?? '';
    phoneNumberController.text = user.phoneNumber ?? '';
    emailController.text = user.email ?? '';
    birthdayController.text = user.birthday ?? '';
    facilityController.text =
        FacilityManager.facility.name?.toUpperCase() ?? '';
    classController.text = 'hello';
  }

  Future<void> updateUser() async {
    user!
      ..firstName = firstNameController.text.trim()
      ..lastName = lastNameController.text.trim()
      ..phoneNumber = phoneNumberController.text.trim()
      ..email = emailController.text.trim()
      ..birthday = birthdayController.text.trim();

    await makeApiCall(
      apiCall: UserService.shared.updateUser(user!, imageFilePath ?? ''),
      onSuccess: (userUpdated) {
        setFromUser(userUpdated);
        viewModel.updateUser(userUpdated);
      },
    );
  }
}
