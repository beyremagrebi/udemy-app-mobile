import 'package:erudaxis/core/config/media/api_image_widget.dart';
import 'package:erudaxis/core/constants/constant.dart';
import 'package:erudaxis/core/constants/env.dart';
import 'package:erudaxis/core/styles/dimensions.dart';
import 'package:erudaxis/interfaces/language/i_screen_with_localization.dart';
import 'package:erudaxis/presentation/utils/app_bar_gradient.dart';
import 'package:erudaxis/presentation/utils/app_scaffold.dart';
import 'package:erudaxis/presentation/utils/statics_grid.dart';
import 'package:erudaxis/providers/global/session_manager_view_model.dart';
import 'package:erudaxis/providers/main/profile/language/language_view_model.dart';
import 'package:erudaxis/widgets/common/form/input_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UpdateProfileView extends IScreenWithLocalization {
  const UpdateProfileView({super.key});

  @override
  Widget buildLocalized(
      BuildContext context, LanguageViewModel languageViewModel) {
    return Consumer<SessionManager>(
      builder: (context, viewModel, child) => AppScaffold(
        appBar: AppBarGradient(
          title: Text(intl.update_profile),
          actions: [
            Opacity(
              opacity: 1,
              child: Card(
                clipBehavior: Clip.hardEdge,
                margin: Dimensions.horizontalPaddingxSmall,
                elevation: 0,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      viewModel.updateUser();
                    },
                    child: Container(
                      padding: Dimensions.paddingAllSmall,
                      child: Text(intl.save),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        body: ListView(
          padding: Dimensions.paddingAllMedium,
          children: [
            Column(
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    ApiImageWidget(
                      height: 60,
                      width: 60,
                      imageFileName: viewModel.user?.image,
                      isMen: viewModel.user?.isMen,
                      border: Border.all(color: Colors.white, width: 1.2),
                      imageNetworUrl: baseURl,
                      isProfilePicture: true,
                    ),
                    Container(
                      padding: Dimensions.paddingAllxSmall,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.edit_square,
                        size: 14,
                        color: Colors.black54,
                      ),
                    )
                  ],
                ),
                Text(intl.required)
              ],
            ),
            Dimensions.heightMedium,
            Card(
              elevation: 0,
              child: Container(
                padding: Dimensions.paddingAllSmall,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      intl.personal_info,
                      style: textTheme.titleMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Dimensions.heightMedium,
                    StatisticsGrid(
                      aspectRatio: 2.21,
                      children: [
                        InputText(
                          hintText: intl.first_name,
                          required: true,
                          label: intl.first_name,
                        ),
                        InputText(
                          hintText: intl.last_name,
                          required: true,
                          label: intl.last_name,
                        ),
                      ],
                      screenWidth: Dimensions.screenWidth,
                    ),
                    Dimensions.heightSmall,
                    InputText(
                      hintText: intl.email_address,
                      required: true,
                      label: intl.email_address,
                    ),
                    Dimensions.heightSmall,
                    InputText(
                      hintText: intl.phone_number,
                      required: true,
                      label: intl.phone_number,
                    ),
                    Dimensions.heightSmall,
                    InputText(
                      hintText: 'dd/mm/yyyy',
                      required: true,
                      label: intl.birth_date,
                      suffixIcon: const Icon(
                        Icons.date_range,
                        color: Colors.white38,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Dimensions.heightLarge,
            Card(
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
                      hintText: intl.institution,
                      label: intl.institution,
                      enabled: false,
                    ),
                    Dimensions.heightSmall,
                    InputText(
                      hintText: intl.classe,
                      label: intl.classe,
                      enabled: false,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
