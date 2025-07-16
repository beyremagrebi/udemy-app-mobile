import 'package:flutter/material.dart';

import '../../../../core/constants/constant.dart';
import '../../../../core/styles/dimensions.dart';
import '../../../../widgets/common/gradient_button.dart';

class ActivityConnction extends StatelessWidget {
  const ActivityConnction({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Container(
        width: double.maxFinite,
        padding: Dimensions.paddingAllMedium,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              intl.connection_activity,
              style: textTheme.titleMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              intl.connection_activity_description,
              style: textTheme.labelSmall?.copyWith(
                color: Colors.white54,
              ),
            ),
            Dimensions.heightExtraLarge,
            GradientButton(
              text: intl.view_connection_activity,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
