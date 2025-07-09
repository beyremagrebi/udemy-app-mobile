import 'package:erudaxis/core/constants/constant.dart';
import 'package:erudaxis/core/styles/dimensions.dart';
import 'package:erudaxis/interfaces/language/i_screen_with_localization.dart';
import 'package:erudaxis/presentation/utils/app_bar_gradient.dart';
import 'package:erudaxis/presentation/utils/app_scaffold.dart';
import 'package:erudaxis/providers/main/profile/language/language_view_model.dart';
import 'package:erudaxis/widgets/common/form/input_text.dart';
import 'package:erudaxis/widgets/common/gradient_button.dart';
import 'package:flutter/material.dart';

class PrivacyView extends IScreenWithLocalization {
  const PrivacyView({super.key});

  @override
  Widget buildLocalized(
      BuildContext context, LanguageViewModel languageViewModel) {
    return AppScaffold(
      appBar: AppBarGradient(
        centerTitle: true,
        title: Text(
          intl.privacy_subtitle,
        ),
      ),
      body: Padding(
        padding: Dimensions.paddingAllMedium,
        child: ListView(
          children: [
            Card(
              elevation: 0,
              child: Container(
                width: double.maxFinite,
                padding: Dimensions.paddingAllMedium,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      intl.change_password,
                      style: textTheme.titleMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Dimensions.heightMedium,
                    InputText(
                      hintText: intl.current_password,
                      label: intl.current_password,
                      obscureText: true,
                      suffixIcon: const Icon(
                        Icons.visibility,
                        color: Colors.white,
                      ),
                    ),
                    Dimensions.heightMedium,
                    InputText(
                      hintText: intl.new_password,
                      label: intl.new_password,
                      obscureText: true,
                      suffixIcon: const Icon(
                        Icons.visibility,
                        color: Colors.white,
                      ),
                    ),
                    Dimensions.heightMedium,
                    InputText(
                      hintText: intl.confirm_new_password,
                      label: intl.confirm_new_password,
                      obscureText: true,
                      suffixIcon: const Icon(
                        Icons.visibility,
                        color: Colors.white,
                      ),
                    ),
                    Dimensions.heightExtraLarge,
                    GradientButton(
                      text: intl.change_password,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
            Dimensions.heightMedium,
            Card(
              elevation: 0,
              child: Container(
                width: double.maxFinite,
                padding: Dimensions.paddingAllMedium,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      intl.connection_activity,
                      style: textTheme.titleMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      intl.connection_activity_description,
                      style: textTheme.labelSmall?.copyWith(
                        color: Colors.white54,
                      ),
                    ),
                    Dimensions.heightExtraLarge,
                    GradientButton(
                      text: intl.view_connection_activity,
                      onPressed: () {},
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
