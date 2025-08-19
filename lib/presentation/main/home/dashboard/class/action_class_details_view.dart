import 'package:erudaxis/models/base/base_class.dart';
import 'package:erudaxis/presentation/main/subject/subject_for_class_view.dart';
import 'package:erudaxis/presentation/utils/icon_box.dart';
import 'package:erudaxis/presentation/utils/navigator_utils.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

import '../../../../../core/constants/constant.dart';
import '../../../../../core/styles/dimensions.dart';
import '../../../../utils/statics_grid.dart';

class ActionClassDetailsView extends StatelessWidget {
  final BaseClass? classe;
  const ActionClassDetailsView({required this.classe, super.key});

  @override
  Widget build(BuildContext context) {
    return StatisticsGrid(
      aspectRatio: 3.8,
      children: [
        _buildActionClass(
          icon: Symbols.chat_info_rounded,
          color: Colors.purpleAccent,
          title: intl.chat,
          onTap: () {},
        ),
        _buildActionClass(
          icon: Symbols.people_outline_rounded,
          color: Colors.red,
          title: intl.attendance_call,
          onTap: () {},
        ),
        _buildActionClass(
          icon: Icons.calendar_today_outlined,
          color: Colors.blueAccent,
          title: intl.planning,
          onTap: () {},
        ),
        _buildActionClass(
          icon: Symbols.book_5_rounded,
          color: Colors.green,
          title: intl.subjects,
          onTap: () {
            navigateTo(context, SubjectForClassView(classe: classe));
          },
        ),
      ],
      screenWidth: Dimensions.screenWidth,
    );
  }

  Widget _buildActionClass({
    required IconData icon,
    required Color color,
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
          child: Padding(
            padding: Dimensions.paddingAllSmall,
            child: Row(
              children: [
                IconBox(
                  icon: icon,
                  iconBackgroundColor: color,
                  size: 28,
                ),
                Dimensions.widthSmall,
                Text(title, style: textTheme.titleSmall)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
