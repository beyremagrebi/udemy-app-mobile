import 'dart:ui';

import 'package:flutter/material.dart';

import '../../common/section_header.dart';

class ProchainSeanceWidget extends StatelessWidget {
  const ProchainSeanceWidget({super.key});

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

    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          icon: Icons.schedule,
          iconColor: Colors.blueAccent,
          title: 'Prochaine Séance',
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: seances.map((seance) {
            final isOnline = seance['type'] == 'En Ligne';
            final iconData = seance['title']!.toLowerCase().contains('math')
                ? Icons.menu_book
                : seance['title']!.toLowerCase().contains('physique')
                    ? Icons.laptop_mac
                    : Icons.auto_stories;
            final iconColor =
                isOnline ? Colors.blueAccent : Colors.deepPurpleAccent;
            final badgeColor = isOnline ? Colors.blue : Colors.green;
            final badgeBg = isOnline
                ? Colors.blue.withOpacity(0.08)
                : Colors.green.withOpacity(0.08);

            return Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: DecoratedBox(
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
                              color: iconColor.withOpacity(0.9),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child:
                                Icon(iconData, color: Colors.white, size: 22),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  seance['title']!,
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    color: Colors.white.withOpacity(0.9),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(height: 3),
                                Text(
                                  '${seance['teacher']} · ${seance['time']}',
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
                                seance['location']!,
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: Colors.white.withOpacity(0.85),
                                  fontSize: 12,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 4),
                                decoration: BoxDecoration(
                                  color: badgeBg,
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(
                                      color: badgeColor.withOpacity(0.5)),
                                ),
                                child: Text(
                                  seance['type']!,
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    color: badgeColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 11,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
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
