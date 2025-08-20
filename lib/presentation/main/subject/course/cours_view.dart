import 'package:erudaxis/core/constants/constant.dart';
import 'package:erudaxis/core/styles/dimensions.dart';
import 'package:erudaxis/presentation/utils/app_bar_gradient.dart';
import 'package:erudaxis/presentation/utils/app_scaffold.dart';
import 'package:erudaxis/presentation/utils/async/async_model_list_builder.dart';
import 'package:erudaxis/presentation/utils/session/facility_manager.dart';
import 'package:erudaxis/providers/main/subject/cours/expansion_course_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../models/base/base_class.dart';
import '../../../../models/base/base_subject.dart';
import '../../../../widgets/common/app_filtre_chip.dart';
import '../../../../widgets/main/subject/course/expansion_course_card.dart';
import '../../../../widgets/shimmer/member_card_shimmer.dart';
import '../app_bar_subject_details_view.dart';

class CoursView extends StatelessWidget {
  final BaseClass classe;
  final BaseSubject subject;
  const CoursView({required this.classe, required this.subject, super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>
          ExpansionCourseViewModel(context, classe: classe, subject: subject),
      child: Consumer<ExpansionCourseViewModel>(
        builder: (context, viewModel, child) => AppScaffold(
          appBar: AppBarGradient(
            title: Text(intl.courses),
            centerTitle: true,
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBarSubjectDetailsView(
                subject: subject,
                child: FacilityManager.isTrainingCenter
                    ? const SizedBox.shrink()
                    : SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                            viewModel.subjectTypes.length,
                            (index) => AppFilterChip(
                              label: viewModel.subjectTypes[index].type ??
                                  intl.error,
                              selected: viewModel.subjectTypes[index].id ==
                                  viewModel.selectedSubjectType?.id,
                              onTap: () {
                                viewModel.selectSubjectType(
                                    viewModel.subjectTypes[index].id!);
                              },
                            ),
                          ),
                        ),
                      ),
              ),
              Expanded(
                child: AsyncModelListBuilder(
                  viewModel: viewModel,
                  models: viewModel.courses,
                  onRefresh: viewModel.loadCourses,
                  shimmer: Padding(
                    padding: Dimensions.paddingAllMedium,
                    child: MemberCardShimmer(
                      isCircular: false,
                    ),
                  ),
                  builder: (courses) => ListView.separated(
                    separatorBuilder: (context, index) =>
                        Dimensions.heightSmall,
                    itemCount: courses.length,
                    padding: Dimensions.paddingAllMedium,
                    itemBuilder: (context, index) => ExpansionCourseCard(
                      cours: courses[index],
                      viewModel: viewModel,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
