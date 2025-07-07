import 'package:erudaxis/core/styles/app_colors.dart';
import 'package:erudaxis/core/styles/dimensions.dart';
import 'package:erudaxis/presentation/utils/app/app_package_info.dart';
import 'package:erudaxis/presentation/utils/statics_grid.dart';
import 'package:erudaxis/presentation/utils/title_widget.dart';
import 'package:erudaxis/widgets/common/widgets.dart';
import 'package:erudaxis/widgets/main/profile/setting_card.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../../../widgets/main/profile/user_info_card.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        gradientAppBarWidget(const UserInfoCard()),
        Expanded(
          child: ListView(
            children: [
              Padding(
                padding: Dimensions.paddingAllMedium,
                child: TitleWidget(
                  title: 'Paramètre Rapide',
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
              ),
              Padding(
                padding: Dimensions.paddingAllMedium,
                child: TitleWidget(
                  title: 'Paramètre',
                  icon: Icons.settings_outlined,
                  child: Column(
                    children: [
                      const SettingCard(
                        title: 'Profil',
                        subTitle: 'Géere vos information personnel ',
                        icon: Icons.person_outline,
                        color: Colors.blue,
                      ),
                      Dimensions.heightSmall,
                      const SettingCard(
                        title: 'Notification',
                        subTitle: 'Paramètre des notifcations',
                        icon: Icons.notifications_none_outlined,
                        color: Colors.green,
                      ),
                      Dimensions.heightSmall,
                      const SettingCard(
                        title: 'Confidentialié',
                        subTitle: 'sécurité et confidentialité',
                        icon: Symbols.shield_rounded,
                        color: Colors.red,
                      ),
                      Dimensions.heightSmall,
                      const SettingCard(
                        title: 'Apparence',
                        subTitle: 'Theme et personalisé',
                        icon: Icons.palette_outlined,
                        color: AppColors.secondaryColor,
                      ),
                      Dimensions.heightSmall,
                      const SettingCard(
                        title: 'Language',
                        subTitle: 'Français',
                        icon: Symbols.globe_rounded,
                        color: Colors.orange,
                      ),
                      Dimensions.heightSmall,
                      const SettingCard(
                        title: 'Aide & Support',
                        subTitle: 'FAQ  & assistance',
                        icon: Icons.help_outline,
                        color: Colors.cyan,
                      ),
                      Dimensions.heightHuge,
                      SettingCard(
                        title: 'À propos',
                        subTitle: 'v${AppPackageInfo.appVersion}',
                        icon: Icons.info_outline,
                        canNavigate: false,
                        color: Colors.blue,
                      ),
                      Dimensions.heightSmall,
                      const SettingCard(
                        title: 'Se déconnecter',
                        subTitle: 'Fermer las session',
                        canNavigate: false,
                        icon: Icons.exit_to_app_outlined,
                        color: Colors.red,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
