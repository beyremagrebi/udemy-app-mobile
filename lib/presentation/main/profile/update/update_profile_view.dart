import 'package:erudaxis/core/config/media/api_image_widget.dart';
import 'package:erudaxis/core/config/media/file_image_widget.dart';
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
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onLongPress: () {
                      viewModel.onLongPress();
                    },
                    onTap: () {
                      viewModel.removeIcon == true
                          ? viewModel.removeImage()
                          : viewModel.selectImage();
                    },
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        if (viewModel.imageFilePath == null)
                          Opacity(
                            opacity: viewModel.removeIcon == true ? 0.6 : 1,
                            child: ApiImageWidget(
                              height: 60,
                              width: 60,
                              imageFileName: viewModel.user?.image,
                              isMen: viewModel.user?.isMen,
                              border:
                                  Border.all(color: Colors.white, width: 1.2),
                              imageNetworUrl:
                                  '$baseURl/enterprise-${viewModel.user?.enterprise}/images',
                              isProfilePicture: true,
                            ),
                          ),
                        if (viewModel.imageFilePath != null)
                          Opacity(
                            opacity: viewModel.removeIcon == true ? 0.6 : 1,
                            child: FileImageWidget(
                              height: 60,
                              width: 60,
                              imageFileName: viewModel.imageFilePath,
                              fit: BoxFit.cover,
                              border:
                                  Border.all(color: Colors.white, width: 1.2),
                              isProfilePicture: true,
                            ),
                          ),
                        Container(
                          padding: Dimensions.paddingAllxSmall,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            viewModel.removeIcon == true
                                ? Icons.delete
                                : Icons.edit_square,
                            size: 14,
                            color: viewModel.removeIcon
                                ? Colors.red.shade300
                                : Colors.black,
                          ),
                        )
                      ],
                    ),
                  ),
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
                          controller: viewModel.firstNameController,
                          hintText: intl.first_name,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          required: true,
                          label: intl.first_name,
                        ),
                        InputText(
                          controller: viewModel.lastNameController,
                          hintText: intl.last_name,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          required: true,
                          label: intl.last_name,
                        ),
                      ],
                      screenWidth: Dimensions.screenWidth,
                    ),
                    Dimensions.heightMedium,
                    InputText(
                      controller: viewModel.emailController,
                      hintText: intl.email_address,
                      keyboardType: TextInputType.emailAddress,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      required: true,
                      label: intl.email_address,
                    ),
                    Dimensions.heightMedium,
                    InputText(
                      controller: viewModel.phoneNumberController,
                      label: intl.phone_number,
                      hintText: '+cc xx xxx xxx',
                      keyboardType: TextInputType.phone,
                      required: true,
                    ),
                    Dimensions.heightMedium,
                    InputText(
                      controller: viewModel.birthdayController,
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
                      controller: viewModel.facilityController,
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
