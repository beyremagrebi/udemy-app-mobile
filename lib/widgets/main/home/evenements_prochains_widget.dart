import 'dart:ui';
import 'package:flutter/material.dart';
import '../../common/section_header.dart';

class EvenementsProchainsWidget extends StatelessWidget {
  const EvenementsProchainsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          icon: Icons.event,
          iconColor: Colors.cyanAccent,
          title: 'Événements Prochains',
          trailing: TextButton(
            onPressed: () {},
            child: Text(
              'Voir plus',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: Colors.white.withOpacity(0.8),
                fontWeight: FontWeight.w600,
              ),
            ),
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              padding: EdgeInsets.zero,
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Column(
          children: evenements.map((evt) {
            return Container(
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white.withOpacity(0.13),
                    Colors.white.withOpacity(0.06),
                  ],
                ),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: Colors.white.withOpacity(0.13)),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 10),
                    child: Row(
                      children: [
                        Container(
                          width: 38,
                          height: 38,
                          decoration: BoxDecoration(
                            color: (evt['color'] as Color).withOpacity(0.9),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(evt['icon'] as IconData,
                              color: Colors.white, size: 22),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                evt['title'] as String,
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: Colors.white.withOpacity(0.9),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 3),
                              Text(
                                evt['subtitle'] as String,
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: Colors.white.withOpacity(0.75),
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              evt['date'] as String,
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: evt['color'] as Color,
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
