import 'package:erudaxis/models/base/base_lesson.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

import '../../../../core/constants/constant.dart';
import '../../../../core/styles/dimensions.dart';
import '../../../../presentation/utils/colors_generator.dart';
import '../../../../presentation/utils/icon_box.dart';

class CourseHeaderWidget extends StatelessWidget {
  final BaseLesson cours;

  const CourseHeaderWidget({required this.cours, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconBox(
          icon: Symbols.book_5_rounded,
          iconBackgroundColor: getColorFromHash(cours.name.hashCode),
        ),
        Dimensions.widthSmall,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cours.name?.toUpperCase() ?? intl.error,
              style: textTheme.titleSmall,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${cours.instructor?.firstName} ${cours.instructor?.lastName} (${cours.instructor?.role?.localizedName()}) ',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.labelSmall?.copyWith(color: Colors.white70),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
