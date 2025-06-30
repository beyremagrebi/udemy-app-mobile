import 'package:erudaxis/core/styles/dimensions.dart';
import 'package:erudaxis/presentation/utils/limited_list_view.dart';
import 'package:flutter/material.dart';

import '../../../../../widgets/main/home/dashboard/next_session/next_session_card.dart';

class NextSessionView extends StatelessWidget {
  const NextSessionView({super.key});

  @override
  Widget build(BuildContext context) {
    final seances = [
      {
        'title': 'Mathématiques',
        'teacher': 'M. Dupont',
        'time': '10:00 - 11:00',
        'location': 'Salle 301',
        'type': 'Présentiel',
      },
      {
        'title': 'Physique (En ligne)',
        'teacher': 'Mme. Curie',
        'time': '11:30 - 12:30',
        'location': 'Google Meet',
        'type': 'En Ligne',
      },
      {
        'title': 'Histoire',
        'teacher': 'M. Martin',
        'time': '14:00 - 15:00',
        'location': 'Salle 102',
        'type': 'Présentiel',
      },
    ];

    return LimitedListView(
      children: List.generate(
        seances.length,
        (index) {
          final seance = seances[index];
          return NextSessionCard(
            title: seance['title']!,
            teacher: seance['teacher']!,
            time: seance['time']!,
            location: seance['location']!,
            type: seance['type']!,
          );
        },
      ),
      itemHeight: 65,
      separatorHeight: Dimensions.s,
      separator: Dimensions.heightSmall,
    );
  }
}
