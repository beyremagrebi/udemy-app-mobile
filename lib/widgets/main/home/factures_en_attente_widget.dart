import 'package:flutter/material.dart';

import '../../common/section_header.dart';

class FacturesEnAttenteWidget extends StatelessWidget {
  const FacturesEnAttenteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final factures = [
      {
        'title': 'Frais de scolarité - Juin',
        'amount': '75.00€',
        'due': '25 Juin',
      },
      {
        'title': 'Sortie scolaire - Musée',
        'amount': '30.00€',
        'due': '30 Juin',
      },
    ];

    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          icon: Icons.receipt_long,
          iconColor: Colors.amberAccent,
          title: 'Factures en attente',
          trailing: TextButton(
            onPressed: () {},
            child: Text(
              'Voir toutes',
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
          children: [
            // Factures list
            ...factures.map((facture) {
              final dueDate = DateTime.now().add(
                  Duration(days: int.parse(facture['due']!.split(' ')[0])));
              final daysLeft = dueDate.difference(DateTime.now()).inDays;
              final isOverdue = daysLeft < 0;
              final isNearDue = daysLeft <= 3 && daysLeft > 0;

              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: Colors.white.withOpacity(0.13)),
                    boxShadow: [
                      BoxShadow(
                        color: isOverdue
                            ? Colors.red.withOpacity(0.2)
                            : isNearDue
                                ? Colors.amber.withOpacity(0.2)
                                : Colors.white.withOpacity(0.1),
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 14),
                    child: Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: isOverdue
                                ? Colors.redAccent.withOpacity(0.2)
                                : isNearDue
                                    ? Colors.amberAccent.withOpacity(0.2)
                                    : Colors.redAccent.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.redAccent,
                              width: 2,
                            ),
                          ),
                          child: const Icon(
                            Icons.attach_money,
                            color: Colors.redAccent,
                            size: 20,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                facture['title']!,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13,
                                  decoration: isOverdue
                                      ? TextDecoration.lineThrough
                                      : null,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Row(
                                children: [
                                  Text(
                                    'Montant: ',
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      color: Colors.white.withOpacity(0.7),
                                    ),
                                  ),
                                  Text(
                                    facture['amount']!,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: theme.textTheme.bodyMedium?.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (isOverdue)
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Colors.redAccent.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: Colors.redAccent),
                                ),
                                child: Text(
                                  'En retard',
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    color: Colors.redAccent,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            Text(
                              'Échéance: ${facture['due']}',
                              textAlign: TextAlign.end,
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: isOverdue
                                    ? Colors.redAccent
                                    : Colors.white.withOpacity(0.7),
                                fontSize: 10,
                              ),
                            ),
                            const SizedBox(height: 4),
                            if (daysLeft > 0 && !isOverdue)
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 6, vertical: 2),
                                decoration: BoxDecoration(
                                  color: isNearDue
                                      ? Colors.amberAccent.withOpacity(0.2)
                                      : Colors.redAccent.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(
                                  daysLeft <= 3
                                      ? 'Bientôt dû'
                                      : '$daysLeft jours',
                                  style: TextStyle(
                                    color: isNearDue
                                        ? Colors.amberAccent
                                        : Colors.redAccent,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10,
                                    height: 1.5,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
            // Empty space indicator
            if (factures.isEmpty)
              Padding(
                padding: const EdgeInsets.all(16),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.check_circle_outline,
                          color: Colors.greenAccent, size: 50),
                      const SizedBox(height: 12),
                      Text(
                        'Aucune facture en attente',
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Toutes vos factures sont payées ou à jour',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: Colors.white.withOpacity(0.7),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
