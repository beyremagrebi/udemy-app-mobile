import 'package:erudaxis/core/constants/constant.dart';
import 'package:erudaxis/core/styles/dimensions.dart';
import 'package:erudaxis/interfaces/language/i_screen_with_localization.dart';
import 'package:erudaxis/presentation/main/profile/security/activity_connction.dart';
import 'package:erudaxis/presentation/main/profile/security/change_password_form.dart';
import 'package:erudaxis/presentation/utils/app_bar_gradient.dart';
import 'package:erudaxis/presentation/utils/app_scaffold.dart';
import 'package:erudaxis/providers/main/profile/language/language_view_model.dart';
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
          children: const [
            ChangePasswordForm(),
            Dimensions.heightMedium,
            ActivityConnction()
          ],
        ),
      ),
    );
  }
}
