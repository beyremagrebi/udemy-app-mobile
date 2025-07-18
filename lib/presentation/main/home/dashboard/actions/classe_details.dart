import 'package:erudaxis/core/config/media/asset_image_widget.dart';
import 'package:erudaxis/core/constants/assets.dart';
import 'package:erudaxis/core/enum/role.dart';
import 'package:erudaxis/presentation/utils/app_bar_gradient.dart';
import 'package:erudaxis/presentation/utils/app_scaffold.dart';
import 'package:erudaxis/presentation/utils/limited_list_view.dart';
import 'package:erudaxis/presentation/utils/statics_grid.dart';
import 'package:erudaxis/presentation/utils/title_widget.dart';
import 'package:erudaxis/widgets/common/gradient_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

import '../../../../../core/constants/constant.dart';
import '../../../../../core/styles/dimensions.dart';
import '../../../../utils/icon_box.dart';

class ClasseDetails extends StatelessWidget {
  const ClasseDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBarGradient(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.settings_outlined,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          GradientAppBarWidget(
            child: Container(
              margin: const EdgeInsets.only(bottom: Dimensions.s),
              padding: Dimensions.horizontalExtrrePaddingLarge,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const IconBox(
                        icon: Icons.square_foot_outlined,
                        size: 50,
                        iconBackgroundColor: Colors.blueAccent,
                      ),
                      Dimensions.widthSmall,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Terminale S - Groupe A',
                            style: textTheme.titleMedium?.copyWith(),
                          ),
                          Text(
                            'Sciences • Prof. Dubois',
                            style: textTheme.labelSmall?.copyWith(
                              color: Colors.white70,
                            ),
                          ),
                          Text(
                            'Classe de Terminale Scientifique - Section A',
                            style: textTheme.labelSmall?.copyWith(
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Dimensions.heightMedium,
                  Card(
                    elevation: 0,
                    child: Padding(
                      padding: Dimensions.paddingAllSmall,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildStaticsDate(title: 'Membres', value: '28'),
                          _buildStaticsDate(title: 'Cours', value: '12'),
                          _buildStaticsDate(title: 'Presence', value: '85%'),
                          _buildStaticsDate(title: 'Note', value: '4.8'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: Dimensions.paddingAllMedium,
              children: [
                StatisticsGrid(
                  aspectRatio: 4.2,
                  children: [
                    _buildActionClass(
                      icon: Symbols.chat_info_rounded,
                      title: 'chat',
                      onTap: () {},
                    ),
                    _buildActionClass(
                      icon: Symbols.people_outline_rounded,
                      title: 'Appel',
                      onTap: () {},
                    ),
                    _buildActionClass(
                      icon: Icons.calendar_today_outlined,
                      title: 'Planning',
                      onTap: () {},
                    ),
                    _buildActionClass(
                      icon: Icons.book_outlined,
                      title: 'Cours',
                      onTap: () {},
                    ),
                  ],
                  screenWidth: Dimensions.screenWidth,
                ),
                Dimensions.heightMedium,
                TitleWidget(
                  child: LimitedListView(
                    children: [
                      _buildMemberCard(
                          role: Role.student, fullName: 'beyrem agrebi'),
                      _buildMemberCard(
                          role: Role.superAdmin, fullName: 'ramy hamza'),
                      _buildMemberCard(
                          role: Role.instructor, fullName: 'hassen ghanmi'),
                    ],
                    itemHeight: 55,
                    separatorHeight: Dimensions.s,
                  ),
                  title: 'Memebers',
                  materialPage: Container(),
                  onTap: () {},
                  icon: Icons.people_alt_outlined,
                ),
                TitleWidget(
                  child: Container(),
                  title: 'Activité récente',
                  onTap: () {},
                  materialPage: Container(),
                  icon: Icons.assignment_outlined,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionClass({
    required IconData icon,
    required String title,
    VoidCallback? onTap,
  }) {
    return Card(
      clipBehavior: Clip.hardEdge,
      elevation: 0,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 18,
                ),
              ),
              Expanded(
                child: Text(
                  title,
                  style: textTheme.titleSmall?.copyWith(
                    color: Colors.white70,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMemberCard({
    required Role role,
    required String fullName,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: Dimensions.s),
      child: Container(
        padding: Dimensions.paddingAllSmall,
        child: Row(
          children: [
            const AssetsImageWidget(
              height: 35,
              width: 35,
              hasImageView: true,
              imageFileName: Assets.defaultMaleAvatar,
              isProfilePicture: true,
            ),
            Dimensions.widthSmall,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    fullName,
                    style: textTheme.titleSmall,
                  ),
                  Text(
                    role.name,
                    style: textTheme.labelSmall?.copyWith(
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.more_vert_outlined,
              size: 16,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildStaticsDate({required String title, required String value}) {
    return Column(
      children: [
        Text(
          value,
          style: textTheme.titleSmall?.copyWith(
            color: Colors.white,
          ),
        ),
        Text(
          title,
          style: textTheme.labelSmall?.copyWith(
            color: Colors.white70,
          ),
        )
      ],
    );
  }
}
