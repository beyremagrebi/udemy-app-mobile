import 'package:erudaxis/core/constants/constant.dart';
import 'package:erudaxis/core/styles/dimensions.dart';
import 'package:erudaxis/models/base/base_class.dart';
import 'package:erudaxis/models/base/base_subject.dart';
import 'package:erudaxis/presentation/main/subject/app_bar_subject_details_view.dart';
import 'package:erudaxis/presentation/main/subject/course/courses_list_view.dart';
import 'package:erudaxis/presentation/main/subject/instructors_list_view.dart';
import 'package:erudaxis/presentation/utils/app_bar_gradient.dart';
import 'package:erudaxis/presentation/utils/app_scaffold.dart';
import 'package:erudaxis/presentation/utils/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

class SubjectDetailsView extends StatelessWidget {
  final BaseSubject subject;
  final BaseClass classe;
  const SubjectDetailsView(
      {required this.classe, required this.subject, super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBarGradient(),
      body: Column(
        children: [
          AppBarSubjectDetailsView(
            subject: subject,
          ),
          Expanded(
              child: ListView(
            padding: Dimensions.paddingAllMedium,
            children: [
              TitleWidget(
                child: CoursesListView(
                  classe: classe,
                  subject: subject,
                ),
                title: intl.courses,
                icon: Symbols.book_5_rounded,
                onTap: () {},
                materialPage: Container(),
              ),
              Dimensions.heightSmall,
              TitleWidget(
                child: const InstructorsListView(),
                title: 'instructors',
                icon: Icons.people_rounded,
                onTap: () {},
                materialPage: Container(),
              )
            ],
          ))
        ],
      ),
    );
  }
}
