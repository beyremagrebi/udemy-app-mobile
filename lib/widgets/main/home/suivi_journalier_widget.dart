import 'package:flutter/material.dart';

import '../../common/section_header.dart';

class SuiviJournalierWidget extends StatelessWidget {
  const SuiviJournalierWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          icon: Icons.assignment_ind,
          iconColor: Colors.deepPurpleAccent,
          title: 'Suivi Journalier',
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
        const SizedBox(height: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...suivis.map((suivi) => Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.01),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: Colors.white.withOpacity(0.13)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 10),
                    child: Row(
                      children: [
                        Container(
                          width: 38,
                          height: 38,
                          decoration: BoxDecoration(
                            color: (suivi['color'] as Color).withOpacity(0.9),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(suivi['icon'] as IconData,
                              color: Colors.white, size: 22),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${suivi['type']}: ${suivi['desc']}',
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: Colors.white.withOpacity(0.9),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 3),
                              Text(
                                suivi['status'] as String,
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: suivi['badgeColor'] as Color,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
          ],
        ),
      ],
    );
  }
}
