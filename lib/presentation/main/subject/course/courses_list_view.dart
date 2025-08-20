import 'package:erudaxis/core/styles/dimensions.dart';
import 'package:erudaxis/models/base/base_class.dart';
import 'package:erudaxis/models/base/base_subject.dart';
import 'package:erudaxis/presentation/utils/async/async_model_list_builder.dart';
import 'package:erudaxis/presentation/utils/limited_list_view.dart';
import 'package:erudaxis/providers/main/subject/cours/cours_list_view_model.dart';
import 'package:erudaxis/widgets/main/subject/course/course_card.dart';
import 'package:erudaxis/widgets/shimmer/member_card_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CoursesListView extends StatelessWidget {
  final BaseClass classe;
  final BaseSubject subject;
  const CoursesListView(
      {required this.classe, required this.subject, super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>
          CoursListViewModel(context, classe: classe, subject: subject),
      child: Consumer<CoursListViewModel>(
        builder: (context, viewModel, child) => AsyncModelListBuilder(
          viewModel: viewModel,
          models: viewModel.courses,
          onRefresh: viewModel.loadCourses,
          shimmer: MemberCardShimmer(
            isCircular: false,
          ),
          builder: (courses) => LimitedListView(
            separator: Dimensions.heightSmall,
            children: List.generate(
              courses.length,
              (index) => CourseCard(
                cours: courses[index],
              ),
            ),
            itemHeight: 55,
            separatorHeight: Dimensions.s,
          ),
        ),
      ),
    );
  }
}
