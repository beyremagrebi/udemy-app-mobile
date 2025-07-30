import 'package:erudaxis/presentation/utils/icon_box.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

import '../../../../../core/constants/constant.dart';
import '../../../../../core/styles/dimensions.dart';
import '../../../../utils/statics_grid.dart';

class ActionClassDetailsView extends StatelessWidget {
  const ActionClassDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return StatisticsGrid(
      aspectRatio: 3.8,
      children: [
        _buildActionClass(
          icon: Symbols.chat_info_rounded,
          color: Colors.purpleAccent,
          title: 'chat',
          onTap: () {},
        ),
        _buildActionClass(
          icon: Symbols.people_outline_rounded,
          color: Colors.red,
          title: 'Appel',
          onTap: () {},
        ),
        _buildActionClass(
          icon: Icons.calendar_today_outlined,
          color: Colors.blueAccent,
          title: 'Planning',
          onTap: () {},
        ),
        _buildActionClass(
          icon: Symbols.book_5_rounded,
          color: Colors.green,
          title: 'Cours',
          onTap: () {},
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
