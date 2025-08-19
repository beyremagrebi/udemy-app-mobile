import 'package:erudaxis/models/base/base_class.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../core/constants/constant.dart';
import '../../../../../core/styles/dimensions.dart';
import '../../../../../models/training_center/class_tc.dart';
import '../../../../../widgets/common/gradient_app_bar_widget.dart';
import '../../../../utils/colors_generator.dart';
import '../../../../utils/icon_box.dart';
import '../../../../utils/session/facility_manager.dart';
import 'statistic_class_details_header_view.dart';

class AppBarClassDetailsView extends StatelessWidget {
  final BaseClass? classe;
  const AppBarClassDetailsView({required this.classe, super.key});

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
                  icon: getIconFromName(classe?.name ?? ''),
                  size: 50,
                  iconBackgroundColor: getColorFromHash(
                      classe?.name.hashCode ?? intl.error.hashCode),
                ),
                Dimensions.widthSmall,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      classe?.name?.toUpperCase() ?? '',
                      style: textTheme.titleMedium?.copyWith(),
                    ),
                    Text(
                      'Sciences • Prof. Dubois',
                      style: textTheme.labelSmall?.copyWith(
                        color: Colors.white70,
                      ),
                    ),
                    if (classe?.isTtrainingCenter ?? false) ...[
                      Text(
                        '${DateFormat("d MMMM y", 'fr').format(DateTime.tryParse((classe as ClassTc).startDate ?? '') ?? DateTime.now())}  - ${DateFormat("d MMMM y", 'fr').format(DateTime.tryParse((classe as ClassTc).endDate ?? '') ?? DateTime.now())}',
                        style: textTheme.labelSmall?.copyWith(
                          color: Colors.white70,
                        ),
                      ),
                    ] else ...[
                      Text(
                        FacilityManager.facility.name?.toUpperCase() ?? '',
                        style: textTheme.labelSmall?.copyWith(
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ],
                )
              ],
            ),
            Dimensions.heightMedium,
            const StatisticClassDetailsHeaderView()
          ],
        ),
      ),
    );
  }
}
