import 'package:erudaxis/models/base/base_class.dart';
import 'package:erudaxis/presentation/utils/app_bar_gradient.dart';
import 'package:erudaxis/presentation/utils/app_scaffold.dart';
import 'package:erudaxis/providers/main/subject/subject_for_class_view_model.dart';
import 'package:erudaxis/widgets/common/gradient_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/styles/dimensions.dart';
import '../../../widgets/main/subject/subject_card.dart';
import '../../../widgets/shimmer/subject_card_shimmer.dart';
import '../../utils/async/async_model_list_builder.dart';
import '../home/dashboard/class/app_bar_class_details_view.dart';

class SubjectForClassView extends StatelessWidget {
  final BaseClass classe;
  const SubjectForClassView({required this.classe, super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBarGradient(),
      body: Column(
        children: [
          GradientAppBarWidget(
            child: AppBarClassDetailsView(classe: classe),
          ),
          ChangeNotifierProvider(
            create: (context) =>
                SubjectForClassViewModel(context, classe: classe),
            child: Consumer<SubjectForClassViewModel>(
              builder: (context, viewModel, child) => Expanded(
                child: AsyncModelListBuilder(
                  viewModel: viewModel,
                  models: viewModel.subjects,
                  shimmer: SubjectCardShimmer(),
                  onRefresh: viewModel.loadSubjects,
                  builder: (subjects) => ListView.separated(
                    separatorBuilder: (context, index) =>
                        Dimensions.heightSmall,
                    padding: Dimensions.paddingAllMedium,
                    itemCount: subjects.length,
                    itemBuilder: (context, index) => SubjectCard(
                      subject: subjects[index],
                      classe: classe,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
