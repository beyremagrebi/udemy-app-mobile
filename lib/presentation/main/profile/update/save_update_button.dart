import 'package:flutter/material.dart';

import '../../../../core/constants/constant.dart';
import '../../../../core/styles/dimensions.dart';
import '../../../../providers/main/profile/update/personal_information_validator.dart';

class SaveUpdateButton extends StatelessWidget {
  final PersonalInformationValidator viewModel;
  const SaveUpdateButton({required this.viewModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 1,
      child: Card(
        clipBehavior: Clip.hardEdge,
        margin: Dimensions.horizontalPaddingxSmall,
        elevation: 0,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: viewModel.updateUser,
            child: Container(
              padding: Dimensions.paddingAllSmall,
              child: Text(intl.save),
            ),
          ),
        ),
      ),
    );
  }
}
