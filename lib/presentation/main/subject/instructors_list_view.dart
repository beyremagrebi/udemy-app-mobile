import 'package:erudaxis/models/base/base_class.dart';
import 'package:erudaxis/models/base/base_subject.dart';
import 'package:erudaxis/presentation/utils/async/async_model_list_builder.dart';
import 'package:erudaxis/providers/main/subject/instructors_for_subject_view_model.dart';
import 'package:erudaxis/widgets/common/memeber_card.dart';
import 'package:erudaxis/widgets/shimmer/member_card_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/styles/dimensions.dart';
import '../../utils/limited_list_view.dart';

class InstructorsListView extends StatelessWidget {
  final BaseSubject subject;
  final BaseClass classe;
  const InstructorsListView(
      {required this.subject, required this.classe, super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => InstructorsForSubjectViewModel(context,
          subject: subject, classe: classe),
      child: Consumer<InstructorsForSubjectViewModel>(
        builder: (context, viewModel, child) => AsyncModelListBuilder(
          viewModel: viewModel,
          models: viewModel.instructors,
          onRefresh: viewModel.loadInstructors,
          shimmer: MemberCardShimmer(),
          builder: (insturctors) => LimitedListView(
            separator: Dimensions.heightSmall,
            children: List.generate(
              insturctors.length,
              (index) => MemberCard(
                user: insturctors[index],
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
