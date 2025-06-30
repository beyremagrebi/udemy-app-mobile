import 'package:flutter/material.dart';

import '../../../../../widgets/main/home/dashboard/invoice/facture_en_attende_card.dart';
import '../../../../utils/limited_list_view.dart';

class FacturesEnAttenteView extends StatelessWidget {
  const FacturesEnAttenteView({super.key});

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

    if (factures.isEmpty) {
      final theme = Theme.of(context);
      return Padding(
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
      );
    }

    final items = factures.map((facture) {
      return FactureEnAttenteCard(
        title: facture['title']!,
        amount: facture['amount']!,
        due: facture['due']!,
      );
    }).toList();

    return LimitedListView(
      children: items,
      itemHeight: 75,
      separatorHeight: 12,
      separator: const SizedBox(height: 12),
    );
  }
}
