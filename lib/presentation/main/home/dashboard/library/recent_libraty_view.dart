import 'package:flutter/material.dart';

import '../../../../../core/styles/dimensions.dart';
import '../../../../../widgets/main/home/dashboard/library/recent_library_widget.dart';

class RecentLibratyView extends StatelessWidget {
  const RecentLibratyView({super.key});

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

    return SizedBox(
      height: 110,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: subjects.length,
        separatorBuilder: (context, index) => Dimensions.widthLarge,
        itemBuilder: (context, index) {
          final subject = subjects[index];
          final isAdd = subject['label'] == 'Ajouter';
          final color = subject['background'] as Color;
          return RecentLibraryWidget(
            isAdd: isAdd,
            color: color,
            subjectName: subject['label'].toString(),
            icon: subject['icon'] as IconData,
            iconColor: subject['iconColor'] as Color,
          );
        },
      ),
    );
  }
}
