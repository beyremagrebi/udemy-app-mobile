import 'package:erudaxis/core/styles/dimensions.dart';
import 'package:erudaxis/models/base/base_lesson.dart';
import 'package:erudaxis/presentation/utils/colors_generator.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

import '../../../../core/constants/constant.dart';
import '../../../../presentation/utils/icon_box.dart';

class CourseCard extends StatelessWidget {
  final BaseLesson cours;
  const CourseCard({required this.cours, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Container(
        padding: Dimensions.paddingAllSmall,
        child: Row(
          children: [
            IconBox(
              icon: Symbols.book_5_rounded,
              iconBackgroundColor: getColorFromHash(cours.name.hashCode),
            ),
            Dimensions.widthSmall,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cours.name?.toUpperCase() ?? intl.error,
                    style: textTheme.titleSmall,
                  ),
                  Dimensions.widthSmall,
                  Text(
                    '${cours.instructor?.firstName} ${cours.instructor?.lastName} ',
                    style: textTheme.labelSmall,
                  ),
                ],
              ),
            ),
            if (cours.isLocked ?? false)
              const Icon(
                Icons.lock_outline_rounded,
                size: 20,
              ),
          ],
        ),
      ),
    );
  }
}
