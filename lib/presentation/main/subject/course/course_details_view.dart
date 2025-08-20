import 'package:erudaxis/core/styles/dimensions.dart';
import 'package:erudaxis/models/base/base_lesson.dart';
import 'package:erudaxis/presentation/utils/app_bar_gradient.dart';
import 'package:erudaxis/presentation/utils/app_scaffold.dart';
import 'package:erudaxis/presentation/utils/title_widget.dart';
import 'package:erudaxis/widgets/common/gradient_app_bar_widget.dart';
import 'package:erudaxis/widgets/main/subject/course/course_header_widget.dart';
import 'package:erudaxis/widgets/main/subject/course/study_material_item.dart';
import 'package:flutter/material.dart';

class CourseDetailsView extends StatelessWidget {
  final BaseLesson cours;
  const CourseDetailsView({required this.cours, super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBarGradient(),
      body: Column(
        children: [
          GradientAppBarWidget(
            child: Container(
              padding: Dimensions.horizontalPaddingMedium,
              margin: const EdgeInsets.only(bottom: Dimensions.s),
              child: CourseHeaderWidget(
                cours: cours,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: Dimensions.paddingAllMedium,
              child: TitleWidget(
                child: Expanded(
                  child: ListView.builder(
                    itemCount: cours.studyMaterials?.length,
                    itemBuilder: (context, index) => StudyMaterialItem(
                      studyMaterial: cours.studyMaterials![index],
                    ),
                  ),
                ),
                title: 'Contenu de cours',
                icon: Icons.book_online_outlined,
              ),
            ),
          )
        ],
      ),
    );
  }
}
