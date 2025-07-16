import 'package:erudaxis/core/constants/constant.dart';
import 'package:erudaxis/core/styles/dimensions.dart';
import 'package:erudaxis/interfaces/language/i_screen_with_localization.dart';
import 'package:erudaxis/presentation/main/profile/update/persoanl_information_form.dart';
import 'package:erudaxis/presentation/main/profile/update/picture_update.dart';
import 'package:erudaxis/presentation/main/profile/update/school_information_form.dart';
import 'package:erudaxis/presentation/utils/app_bar_gradient.dart';
import 'package:erudaxis/presentation/utils/app_scaffold.dart';
import 'package:erudaxis/providers/main/profile/language/language_view_model.dart';
import 'package:erudaxis/providers/main/profile/update/personal_information_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'save_update_button.dart';

class UpdateProfileView extends IScreenWithLocalization {
  const UpdateProfileView({super.key});

  @override
  Widget buildLocalized(
    BuildContext context,
    LanguageViewModel languageViewModel,
  ) {
    return ChangeNotifierProvider(
      create: PersonalInformationValidator.new,
      child: Consumer<PersonalInformationValidator>(
        builder: (context, validatorViewModel, child) => AppScaffold(
          appBar: AppBarGradient(
            title: Text(intl.update_profile),
            actions: [
              SaveUpdateButton(
                viewModel: validatorViewModel,
              ),
            ],
          ),
          body: ListView(
            padding: Dimensions.paddingAllMedium,
            children: [
              PictureUpdate(viewModel: validatorViewModel),
              Dimensions.heightMedium,
              PersoanlInformationForm(
                validatorViewModel: validatorViewModel,
              ),
              Dimensions.heightLarge,
              SchoolInformationForm(viewModel: validatorViewModel)
            ],
          ),
        ),
      ),
    );
  }
}
