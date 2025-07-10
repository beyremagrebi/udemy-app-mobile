import 'package:erudaxis/interfaces/language/i_screen_with_localization.dart';
import 'package:erudaxis/presentation/main/profile/security/privacy_view.dart';
import 'package:erudaxis/presentation/main/profile/theme/theme_view.dart';
import 'package:erudaxis/presentation/main/profile/update/update_profile_view.dart';
import 'package:erudaxis/providers/global/session_manager_view_model.dart';
import 'package:erudaxis/providers/main/profile/language/language_view_model.dart';
import 'package:erudaxis/widgets/common/gradient_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/constant.dart';
import '../../../core/styles/app_colors.dart';
import '../../../core/styles/dimensions.dart';
import '../../../widgets/main/profile/setting_card.dart';
import '../../../widgets/main/profile/user_info_card.dart';
import '../../utils/app/app_package_info.dart';
import '../../utils/statics_grid.dart';
import '../../utils/title_widget.dart';
import 'language/language_view.dart';

class ProfileView extends IScreenWithLocalization {
  const ProfileView({super.key});

  @override
  Widget buildLocalized(
      BuildContext context, LanguageViewModel languageViewModel) {
    return Column(
      children: [
        const GradientAppBarWidget(child: UserInfoCard()),
        Expanded(
          child: ListView(
            padding: Dimensions.paddingAllMedium,
            controller: profileScrollController,
            children: [
              TitleWidget(
                title: intl.quick_settings_title,
                icon: Icons.settings_outlined,
                child: StatisticsGrid(
                  children: const [
                    Card(
                      elevation: 0,
                    ),
                    Card(
                      elevation: 0,
                    )
                  ],
                  screenWidth: Dimensions.screenWidth,
                ),
              ),
              TitleWidget(
                title: intl.settings_title,
                icon: Icons.settings_outlined,
                child: Column(
                  children: [
                    SettingCard(
                      title: intl.profile_title,
                      subTitle: intl.profile_subtitle,
                      icon: Icons.person_outline,
                      color: Colors.blue,
                      materialPage: const UpdateProfileView(),
                    ),
                    Dimensions.heightSmall,
                    SettingCard(
                      title: intl.notification_title,
                      subTitle: intl.notification_subtitle,
                      icon: Icons.notifications_none_outlined,
                      color: Colors.green,
                    ),
                    Dimensions.heightSmall,
                    SettingCard(
                      title: intl.privacy_title,
                      subTitle: intl.privacy_subtitle,
                      icon: Symbols.shield_rounded,
                      materialPage: const PrivacyView(),
                      color: Colors.red,
                    ),
                    Dimensions.heightSmall,
                    SettingCard(
                      title: intl.appearance_title,
                      subTitle: intl.appearance_subtitle,
                      icon: Icons.palette_outlined,
                      color: AppColors.secondaryColor,
                      materialPage: const ThemeView(),
                    ),
                    Dimensions.heightSmall,
                    SettingCard(
                      title: intl.language_title,
                      subTitle: languageViewModel.currentLanguage.displayName,
                      icon: Symbols.globe_rounded,
                      materialPage: const LanguageView(),
                      color: Colors.orange,
                    ),
                    Dimensions.heightSmall,
                    SettingCard(
                      title: intl.support_title,
                      subTitle: intl.support_subtitle,
                      icon: Icons.help_outline,
                      color: Colors.cyan,
                    ),
                    Dimensions.heightHuge,
                    SettingCard(
                      title: intl.about_title,
                      subTitle: 'v${AppPackageInfo.appVersion}',
                      icon: Icons.info_outline,
                      canNavigate: false,
                      color: Colors.blue,
                    ),
                    Dimensions.heightSmall,
                    Consumer<SessionManager>(
                      builder: (context, viewModel, child) => InkWell(
                        child: SettingCard(
                          onTap: () async {
                            await viewModel.logout();
                          },
                          title: intl.logout_title,
                          subTitle: intl.logout_subtitle,
                          canNavigate: false,
                          icon: Icons.exit_to_app_outlined,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
