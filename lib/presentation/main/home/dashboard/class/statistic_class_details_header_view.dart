import 'package:flutter/material.dart';

import '../../../../../core/constants/constant.dart';
import '../../../../../core/styles/dimensions.dart';
import '../../../../../widgets/common/statics_date.dart';

class StatisticClassDetailsHeaderView extends StatelessWidget {
  const StatisticClassDetailsHeaderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Padding(
        padding: Dimensions.paddingAllSmall,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            StatisticsDate(title: intl.members, value: '28'),
            StatisticsDate(title: intl.subjects, value: '12'),
            const StatisticsDate(title: 'Presence', value: '85%'),
            const StatisticsDate(title: 'Note', value: '4.8'),
          ],
        ),
      ),
    );
  }
}
