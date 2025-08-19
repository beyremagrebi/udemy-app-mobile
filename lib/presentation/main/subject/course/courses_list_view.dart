import 'package:erudaxis/core/styles/dimensions.dart';
import 'package:erudaxis/presentation/utils/limited_list_view.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/main/subject/course/course_card.dart';

class CoursesListView extends StatelessWidget {
  const CoursesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return const LimitedListView(
        separator: Dimensions.heightSmall,
        children: [
          CourseCard(),
          CourseCard(),
        ],
        itemHeight: 65,
        separatorHeight: Dimensions.s);
  }
}
