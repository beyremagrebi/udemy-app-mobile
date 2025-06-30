import 'package:erudaxis/core/styles/dimensions.dart';
import 'package:erudaxis/presentation/utils/statics_grid.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

import '../../../../../widgets/main/home/dashboard/statistcs/info_card.dart';

class StatisticsView extends StatelessWidget {
  const StatisticsView({super.key});

  @override
  Widget build(BuildContext context) {
    return StatisticsGrid(
      children: const [
        InfoCard(
          title: 'Cours cette semaine',
          value: '5',
          icon: Icons.book_outlined,
          iconBackgroundColor: Color(0xFF3B82F6),
        ),
        InfoCard(
          title: 'Messages non lus',
          value: '4',
          icon: Symbols.chat_info_rounded,
          iconBackgroundColor: Color(0xFF10B981),
        ),
        InfoCard(
          title: 'Devoirs à rendre',
          value: '2',
          icon: Icons.timer_outlined,
          iconBackgroundColor: Color(0xFFF59E0B),
        ),
        InfoCard(
          title: 'Moyenne générale',
          value: '3/28',
          icon: Icons.moving,
          iconBackgroundColor: Color.fromARGB(255, 225, 2, 255),
        ),
      ],
      screenWidth: Dimensions.screenWidth,
    );
  }
}
