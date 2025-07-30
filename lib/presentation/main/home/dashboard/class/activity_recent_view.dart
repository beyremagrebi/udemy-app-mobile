import 'package:flutter/material.dart';

import '../../../../../core/constants/constant.dart';
import '../../../../../core/styles/dimensions.dart';
import '../../../../utils/colors_generator.dart';
import '../../../../utils/icon_box.dart';
import '../../../../utils/limited_list_view.dart';
import '../../../../utils/title_widget.dart';

class ActivityRecentView extends StatelessWidget {
  const ActivityRecentView({super.key});

  @override
  Widget build(BuildContext context) {
    return TitleWidget(
      child: LimitedListView(
        separator: Dimensions.heightSmall,
        children: [
          _buildActivityRecent(courseName: 'Math'),
          _buildActivityRecent(courseName: 'Physique'),
          _buildActivityRecent(courseName: 'science informatique '),
          _buildActivityRecent(courseName: 'Technique de comunication '),
          _buildActivityRecent(courseName: 'Anglais'),
        ],
        itemHeight: 55,
        separatorHeight: Dimensions.s,
      ),
      title: 'Activité récente',
      onTap: () {},
      materialPage: Container(),
      icon: Icons.assignment_outlined,
    );
  }

  Widget _buildActivityRecent({required String courseName}) {
    return Card(
      elevation: 0,
      child: Container(
        width: double.maxFinite,
        height: 55,
        padding: Dimensions.paddingAllSmall,
        child: Row(
          children: [
            IconBox(
              icon: getCourseIconFromName(courseName),
              iconBackgroundColor: Colors.green,
              size: 32,
            ),
            Dimensions.widthSmall,
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nouveau cours ajouté ($courseName)',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.titleSmall,
                  ),
                  Text(
                    'Il y a 2 heures',
                    style: textTheme.labelSmall?.copyWith(
                      color: Colors.white38,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
