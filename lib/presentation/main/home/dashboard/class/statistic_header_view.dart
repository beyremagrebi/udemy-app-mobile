import 'package:flutter/material.dart';

import '../../../../../core/constants/constant.dart';
import '../../../../../core/styles/dimensions.dart';

class StatisticHeaderView extends StatelessWidget {
  const StatisticHeaderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Padding(
        padding: Dimensions.paddingAllSmall,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildStaticsDate(title: 'Membres', value: '28'),
            _buildStaticsDate(title: 'Cours', value: '12'),
            _buildStaticsDate(title: 'Presence', value: '85%'),
            _buildStaticsDate(title: 'Note', value: '4.8'),
          ],
        ),
      ),
    );
  }

  Widget _buildStaticsDate({required String title, required String value}) {
    return Column(
      children: [
        Text(
          value,
          style: textTheme.titleSmall?.copyWith(
            color: Colors.white,
          ),
        ),
        Text(
          title,
          style: textTheme.labelSmall?.copyWith(
            color: Colors.white70,
          ),
        )
      ],
    );
  }
}
