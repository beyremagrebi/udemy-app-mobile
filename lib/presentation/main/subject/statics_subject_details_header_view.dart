import 'package:flutter/material.dart';

import '../../../../../core/constants/constant.dart';
import '../../../../../core/styles/dimensions.dart';
import '../../../../../widgets/common/statics_date.dart';

class StaticsSubjectDetailsHeaderView extends StatelessWidget {
  const StaticsSubjectDetailsHeaderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Padding(
        padding: Dimensions.paddingAllSmall,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const StatisticsDate(title: 'instructors', value: '5'),
            StatisticsDate(title: intl.courses, value: '11'),
            StatisticsDate(title: intl.quizzes, value: '2'),
            const StatisticsDate(title: 'Homework', value: '4'),
          ],
        ),
      ),
    );
  }
}
