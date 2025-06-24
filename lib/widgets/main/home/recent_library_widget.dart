import 'package:flutter/material.dart';

class RecentLibraryWidget extends StatelessWidget {
  const RecentLibraryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final subjects = [
      {
        'label': 'Ajouter',
        'icon': Icons.add,
        'color': Colors.transparent,
        'border': Border.all(color: Colors.white24, width: 2),
        'iconColor': Colors.white,
        'background': Colors.transparent,
      },
      {
        'label': 'Math',
        'icon': Icons.square_foot,
        'color': const Color(0xFF3B82F6),
        'iconColor': Colors.yellow,
        'background': const Color(0xFF3B82F6),
      },
      {
        'label': 'Histoire',
        'icon': Icons.castle,
        'color': const Color(0xFFE94F37),
        'iconColor': Colors.white,
        'background': const Color(0xFFE94F37),
      },
      {
        'label': 'Physique',
        'icon': Icons.science,
        'color': const Color(0xFF10B981),
        'iconColor': Colors.white,
        'background': const Color(0xFF10B981),
      },
      {
        'label': 'Chimie',
        'icon': Icons.edit,
        'color': const Color(0xFFFF7043),
        'iconColor': Colors.white,
        'background': const Color(0xFFFF7043),
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Bibliothèque Récente',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 110,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: subjects.length,
            separatorBuilder: (context, index) => const SizedBox(width: 16),
            itemBuilder: (context, index) {
              final subject = subjects[index];
              final isAdd = subject['label'] == 'Ajouter';
              return Container(
                width: 80,
                decoration: BoxDecoration(
                  color: subject['background'] as Color,
                  borderRadius: BorderRadius.circular(18),
                  border: isAdd ? subject['border'] as Border : null,
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(18),
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            subject['icon'] as IconData,
                            size: 36,
                            color: subject['iconColor'] as Color,
                          ),
                          const SizedBox(height: 12),
                          Text(
                            subject['label'] as String,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: isAdd ? Colors.white54 : Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
