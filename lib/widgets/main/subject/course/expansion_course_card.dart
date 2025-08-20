import 'package:erudaxis/core/constants/constant.dart';
import 'package:erudaxis/core/styles/dimensions.dart';
import 'package:erudaxis/models/base/base_lesson.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

import '../../../../presentation/utils/colors_generator.dart';
import '../../../../presentation/utils/icon_box.dart';
import '../../../../providers/main/subject/cours/expansion_course_view_model.dart';

class ExpansionCourseCard extends StatelessWidget {
  final BaseLesson cours;
  final ExpansionCourseViewModel viewModel;

  const ExpansionCourseCard({
    required this.cours,
    required this.viewModel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: AnimatedBuilder(
        animation: viewModel,
        builder: (context, _) => ExpansionTile(
          tilePadding: Dimensions.horizontalPaddingSmall,
          title: Row(
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
                        style: textTheme.labelSmall
                            ?.copyWith(color: Colors.white70),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          trailing: Padding(
            padding: const EdgeInsets.only(right: Dimensions.s),
            child: (cours.isLocked ?? false)
                ? const Icon(
                    Icons.lock_outline_rounded,
                    size: 18,
                  )
                : AnimatedRotation(
                    turns: viewModel.isCourseExpanded(cours.id!) ? 0.5 : 0.0,
                    duration: const Duration(milliseconds: 200),
                    child: const Icon(Icons.expand_more),
                  ),
          ),
          onExpansionChanged: (cours.isLocked ?? false)
              ? null
              : (value) => viewModel.toggleExpanded(
                    value: value,
                    courseId: cours.id,
                  ),
          children: [
            Dimensions.heightMedium,
            Padding(
              padding: Dimensions.horizontalPaddingMedium,
              // Wrap with Align to ensure left alignment
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  cours.description ?? intl.error,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.bodySmall?.copyWith(color: Colors.white70),
                ),
              ),
            ),
            Padding(
              padding: Dimensions.horizontalPaddingMedium,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${cours.studyMaterials?.length ?? 0} Contenu de cours',
                    style: textTheme.titleSmall?.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_forward_rounded, size: 18),
                    label: Text(intl.seeMore),
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.blueAccent,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
