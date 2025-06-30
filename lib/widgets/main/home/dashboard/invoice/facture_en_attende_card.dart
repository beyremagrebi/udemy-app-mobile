import 'package:erudaxis/core/styles/dimensions.dart';
import 'package:flutter/material.dart';

class FactureEnAttenteCard extends StatelessWidget {
  final String title;
  final String amount;
  final String due;

  const FactureEnAttenteCard({
    required this.title,
    required this.amount,
    required this.due,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final dueDay = int.tryParse(due.split(' ')[0]) ?? 0;
    final now = DateTime.now();
    final dueDate = DateTime(now.year, now.month, dueDay);
    final daysLeft = dueDate.difference(now).inDays;
    final isOverdue = daysLeft < 0;
    final isNearDue = daysLeft <= 3 && daysLeft > 0;

    return Card(
      elevation: 0,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: Dimensions.smallBorderRadius,
          boxShadow: [
            BoxShadow(
              color: isOverdue
                  ? Colors.red.withOpacity(0.2)
                  : isNearDue
                      ? Colors.amber.withOpacity(0.2)
                      : Colors.transparent,
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
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
                  border: Border.all(color: Colors.redAccent, width: 2),
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
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: isOverdue ? Colors.grey.shade400 : Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                        decorationColor: Colors.white,
                        decorationThickness: 3,
                        decoration:
                            isOverdue ? TextDecoration.lineThrough : null,
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
                          amount,
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
                  if (isOverdue) ...[
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.redAccent.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                        border:
                            Border.all(color: Colors.white.withOpacity(0.2)),
                      ),
                      child: Text(
                        'En retard',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                        ),
                      ),
                    ),
                    Dimensions.heightSmall,
                  ],
                  Text(
                    'Échéance: $due',
                    textAlign: TextAlign.end,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: Colors.white.withOpacity(0.7),
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
                        daysLeft <= 3 ? 'Bientôt dû' : '$daysLeft jours',
                        style: TextStyle(
                          color:
                              isNearDue ? Colors.amberAccent : Colors.redAccent,
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
  }
}
