import 'package:erudaxis/core/styles/dimensions.dart';
import 'package:flutter/material.dart';

import '../../../../../widgets/main/home/dashboard/journal/suivi_journal_card.dart';
import '../../../../utils/limited_list_view.dart';

class SuiviJournalierView extends StatelessWidget {
  const SuiviJournalierView({super.key});

  @override
  Widget build(BuildContext context) {
    final suivis = [
      {
        'type': 'Absence',
        'desc': 'Philosophie (08:00 - 09:00)',
        'status': 'Justifiée',
        'icon': Icons.person_off,
        'color': Colors.orangeAccent,
        'badgeColor': Colors.greenAccent,
      },
      {
        'type': 'Retard',
        'desc': 'Chimie (15 min)',
        'status': 'Non justifiée',
        'icon': Icons.alarm,
        'color': Colors.pinkAccent,
        'badgeColor': Colors.redAccent,
      },
    ];

    final items = suivis.map((suivi) {
      return SuiviJournalierCard(
        type: suivi['type'] as String,
        desc: suivi['desc'] as String,
        status: suivi['status'] as String,
        icon: suivi['icon'] as IconData,
        color: suivi['color'] as Color,
        badgeColor: suivi['badgeColor'] as Color,
      );
    }).toList();

    return LimitedListView(
      children: items,
      itemHeight: 55,
      separatorHeight: Dimensions.s,
      separator: Dimensions.heightSmall,
    );
  }
}
