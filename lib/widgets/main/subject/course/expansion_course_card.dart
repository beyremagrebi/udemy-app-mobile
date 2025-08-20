import 'package:erudaxis/core/constants/constant.dart';
import 'package:erudaxis/core/styles/dimensions.dart';
import 'package:erudaxis/models/base/base_lesson.dart';
import 'package:erudaxis/presentation/main/subject/course/course_details_view.dart';
import 'package:erudaxis/presentation/utils/navigator_utils.dart';
import 'package:erudaxis/providers/main/profile/theme/theme_view_model.dart';
import 'package:erudaxis/widgets/main/subject/course/course_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    final themeViewModel = context.watch<ThemeViewModel>();
    return Card(
      elevation: 0,
      child: AnimatedBuilder(
        animation: viewModel,
        builder: (context, _) => ExpansionTile(
          tilePadding: Dimensions.horizontalPaddingSmall,
          title: CourseHeaderWidget(
            cours: cours,
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
                    onPressed: () {
                      navigateTo(
                          context,
                          CourseDetailsView(
                            cours: cours,
                          ));
                    },
                    icon: const Icon(Icons.arrow_forward_rounded, size: 18),
                    label: Text(intl.seeMore),
                    style: TextButton.styleFrom(
                      foregroundColor:
                          themeViewModel.currentTheme.secondary.withGreen(200),
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
