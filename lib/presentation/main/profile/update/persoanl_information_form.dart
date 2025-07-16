import 'package:erudaxis/providers/main/profile/update/personal_information_validator.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/constant.dart';
import '../../../../core/styles/dimensions.dart';
import '../../../../widgets/common/form/input_text.dart';
import '../../../utils/statics_grid.dart';

class PersoanlInformationForm extends StatelessWidget {
  final PersonalInformationValidator validatorViewModel;

  const PersoanlInformationForm({
    required this.validatorViewModel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(
        intl.personal_info,
        style: textTheme.titleMedium?.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      Dimensions.heightMedium,
      StatisticsGrid(
        aspectRatio: 2.35,
        children: [
          InputText(
            controller: validatorViewModel.firstNameController,
            hintText: intl.first_name,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: validatorViewModel.firstNameValidator.validate,
            required: true,
            label: intl.first_name,
            showErrorText: false,
          ),
          InputText(
            controller: validatorViewModel.lastNameController,
            hintText: intl.last_name,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: validatorViewModel.lastNameValidator.validate,
            required: true,
            label: intl.last_name,
            showErrorText: false,
          ),
        ],
        screenWidth: Dimensions.screenWidth,
      ),
      InputText(
        controller: validatorViewModel.emailController,
        hintText: intl.email_address,
        keyboardType: TextInputType.emailAddress,
        validator: validatorViewModel.emailValidator.validate,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        required: true,
        label: intl.email_address,
      ),
      Dimensions.heightMedium,
      InputText(
        controller: validatorViewModel.phoneNumberController,
        label: intl.phone_number,
        hintText: '+cc xx xxx xxx',
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: TextInputType.phone,
        required: true,
      ),
      Dimensions.heightMedium,
      InputText(
        controller: validatorViewModel.birthdayController,
        hintText: 'dd/mm/yyyy',
        autovalidateMode: AutovalidateMode.onUserInteraction,
        required: true,
        label: intl.birth_date,
        suffixIcon: const Icon(
          Icons.date_range,
          color: Colors.white38,
        ),
      )
    ]);
  }
}
