import 'package:erudaxis/presentation/utils/session/facility_manager.dart';
import 'package:erudaxis/providers/base_view_model.dart';
import 'package:erudaxis/providers/global/session_manager_view_model.dart';
import 'package:erudaxis/providers/main/profile/theme/theme_view_model.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
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
    final themeViewModel = context.read<ThemeViewModel>();
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      final CroppedFile? croppedFile = await ImageCropper().cropImage(
        sourcePath: image.path,
        aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: 'Edit Profile Picture',
            cropStyle: CropStyle.circle,
            toolbarColor: themeViewModel.currentTheme.primary,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: true,
            activeControlsWidgetColor: themeViewModel.currentTheme.secondary,
            // backgroundColor: themeViewModel.currentTheme.primary,
            statusBarColor: themeViewModel.currentTheme.primary,
            // dimmedLayerColor:
            //     themeViewModel.currentTheme.primary.withOpacity(0.7),
            cropFrameStrokeWidth: 2,
            cropFrameColor: Colors.white.withOpacity(0.5),
            cropGridColor: Colors.white.withOpacity(0.3),
            hideBottomControls: false,
          ),
          IOSUiSettings(
            title: 'Edit Profile Picture',
            doneButtonTitle: 'Done',
            cancelButtonTitle: 'Cancel',
            aspectRatioLockEnabled: true,
          ),
        ],
      );

      if (croppedFile != null) {
        imageFilePath = croppedFile.path;
        update();
      }
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

  Future<void> showDatePickerH() async {
    final themViewModel = context.read<ThemeViewModel>();
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: themViewModel.currentTheme.secondary,
              onSurface: Colors.white,
              surface: themViewModel.currentTheme.primary,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
            ),
            dialogBackgroundColor: themViewModel.currentTheme.primary,
            dividerColor: Colors.white,
            dividerTheme: const DividerThemeData(color: Colors.white),
            dialogTheme: const DialogTheme(
              surfaceTintColor: Colors.transparent,
            ),
          ),
          child: child!,
        );
      },
    );
    if (pickedDate != null) {
      birthdayController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
    }
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
      onSuccess: (userUpdated) async {
        setFromUser(userUpdated);
        await viewModel.updateUser(userUpdated);
        if (context.mounted) {
          Navigator.of(context).pop();
        }
      },
    );
  }
}
