import 'package:flutter/material.dart';

import '../../../../../core/styles/dimensions.dart';
import '../../../../../widgets/main/home/dashboard/event/event_prochain_card.dart';
import '../../../../utils/limited_list_view.dart';

class EvenementsProchainsView extends StatelessWidget {
  const EvenementsProchainsView({super.key});

  @override
  Widget build(BuildContext context) {
    final evenements = [
      {
        'title': 'Réunion Parents-Professeurs',
        'subtitle': 'Événement • Salle Polyvalente',
        'date': '27 Juin',
        'icon': Icons.groups,
        'color': Colors.cyanAccent,
      },
      {
        'title': 'Examen de Mathématiques',
        'subtitle': 'Examen • Amphithéâtre A',
        'date': '02 Juil',
        'icon': Icons.assignment,
        'color': Colors.tealAccent,
      },
      {
        'title': "Fête de fin d'année",
        'subtitle': 'Événement • Cour du lycée',
        'date': '10 Juil',
        'icon': Icons.celebration,
        'color': Colors.lightBlueAccent,
      },
    ];

    final items = evenements.map((evt) {
      return EvenementProchainCard(
        title: evt['title'] as String,
        subtitle: evt['subtitle'] as String,
        date: evt['date'] as String,
        icon: evt['icon'] as IconData,
        color: evt['color'] as Color,
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
