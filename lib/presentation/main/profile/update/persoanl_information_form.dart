import 'package:erudaxis/providers/main/profile/update/personal_information_validator.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/constant.dart';
import '../../../../core/styles/dimensions.dart';
import '../../../../widgets/common/form/input_text.dart';

class PersoanlInformationForm extends StatelessWidget {
  final PersonalInformationValidator validatorViewModel;

  const PersoanlInformationForm({
    required this.validatorViewModel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Container(
        width: double.maxFinite,
        padding: Dimensions.paddingAllSmall,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            intl.personal_info,
            style: textTheme.titleMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Dimensions.heightMedium,
          Row(
            children: [
              Expanded(
                child: InputText(
                  controller: validatorViewModel.firstNameController,
                  hintText: intl.first_name,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: validatorViewModel.firstNameValidator.validate,
                  required: true,
                  label: intl.first_name,
                  showErrorText: false,
                ),
              ),
              Dimensions.widthSmall,
              Expanded(
                child: InputText(
                  controller: validatorViewModel.lastNameController,
                  hintText: intl.last_name,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: validatorViewModel.lastNameValidator.validate,
                  required: true,
                  label: intl.last_name,
                  showErrorText: false,
                ),
              ),
            ],
          ),
          Dimensions.heightMedium,
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
            validator: validatorViewModel.phoneNumberValidator.validate,
            keyboardType: TextInputType.phone,
            required: true,
          ),
          Dimensions.heightMedium,
          InkWell(
            onTap: validatorViewModel.showDatePicker,
            child: InputText(
              controller: validatorViewModel.birthdayController,
              hintText: 'yyyy/mm/dd',
              autovalidateMode: AutovalidateMode.onUserInteraction,
              required: true,
              label: intl.birth_date,
              suffixIcon: const Icon(
                Icons.date_range,
                color: Colors.white38,
              ),
            ),
          )
        ]),
      ),
    );
  }
}
