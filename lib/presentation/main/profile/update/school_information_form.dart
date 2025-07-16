import 'package:erudaxis/core/styles/dimensions.dart';
import 'package:erudaxis/providers/main/profile/update/personal_information_validator.dart';
import 'package:erudaxis/widgets/common/form/input_text.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/constant.dart';

class SchoolInformationForm extends StatelessWidget {
  final PersonalInformationValidator viewModel;

  const SchoolInformationForm({required this.viewModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Container(
        padding: Dimensions.paddingAllSmall,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              intl.school_info,
              style: textTheme.titleMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Dimensions.heightSmall,
            InputText(
              controller: viewModel.facilityController,
              prefixIcon: const Icon(
                Icons.factory_outlined,
                color: Colors.white54,
              ),
              hintText: intl.institution,
              label: intl.institution,
              enabled: false,
            ),
            Dimensions.heightSmall,
            InputText(
              controller: viewModel.classController,
              hintText: intl.classe,
              label: intl.classe,
              prefixIcon: const Icon(
                Icons.school_outlined,
                color: Colors.white54,
              ),
              enabled: false,
            ),
          ],
        ),
      ),
    );
  }
}
