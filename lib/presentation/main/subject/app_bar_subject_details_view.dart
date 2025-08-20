import 'package:erudaxis/models/base/base_subject.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/constant.dart';
import '../../../core/styles/dimensions.dart';
import '../../../widgets/common/gradient_app_bar_widget.dart';
import '../../utils/colors_generator.dart';
import '../../utils/icon_box.dart';
import '../../utils/session/facility_manager.dart';

class AppBarSubjectDetailsView extends StatelessWidget {
  final BaseSubject subject;
  final Widget child;
  const AppBarSubjectDetailsView(
      {required this.child, required this.subject, super.key});

  @override
  Widget build(BuildContext context) {
    return GradientAppBarWidget(
      child: Container(
        margin: const EdgeInsets.only(bottom: Dimensions.s),
        padding: Dimensions.horizontalExtrrePaddingLarge,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconBox(
                  icon: getIconFromName(subject.name ?? ''),
                  size: 35,
                  iconBackgroundColor: getColorFromHash(subject.name.hashCode),
                ),
                Dimensions.widthSmall,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      subject.name?.toUpperCase() ?? '',
                      style: textTheme.titleMedium?.copyWith(),
                    ),
                    Text(
                      FacilityManager.facility.name?.toUpperCase() ?? '',
                      style: textTheme.labelSmall?.copyWith(
                        color: Colors.white70,
                      ),
                    ),
                  ],
                )
              ],
            ),
            Dimensions.heightMedium,
            child,
          ],
        ),
      ),
    );
  }
}
