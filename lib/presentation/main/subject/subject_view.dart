import 'package:erudaxis/core/constants/constant.dart';
import 'package:erudaxis/core/styles/dimensions.dart';
import 'package:erudaxis/interfaces/language/i_screen_with_localization.dart';
import 'package:erudaxis/presentation/utils/async/async_model_list_builder.dart';
import 'package:erudaxis/providers/main/profile/language/language_view_model.dart';
import 'package:erudaxis/providers/main/subject/subject_view_model.dart';
import 'package:erudaxis/widgets/common/app_filtre_chip.dart';
import 'package:erudaxis/widgets/common/form/input_text.dart';
import 'package:erudaxis/widgets/common/gradient_app_bar_widget.dart';
import 'package:erudaxis/widgets/shimmer/app_filter_shimmer.dart';
import 'package:erudaxis/widgets/shimmer/subject_card_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/main/profile/theme/theme_view_model.dart';
import '../../../widgets/main/subject/subject_card.dart';

class SubjectView extends IScreenWithLocalization {
  const SubjectView({super.key});

  @override
  Widget buildLocalized(
    BuildContext context,
    LanguageViewModel languageViewModel,
  ) {
    final viewModel = context.watch<ThemeViewModel>();
    return ChangeNotifierProvider(
      create: SubjectViewModel.new,
      child: Consumer<SubjectViewModel>(
        builder: (context, subjectViewModel, child) => Column(
          children: [
            GradientAppBarWidget(
              child: Padding(
                padding: Dimensions.horizontalPaddingMedium,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const InputText(
                      hintText: 'Recheche',
                      onTapOutside: false,
                    ),
                    Dimensions.heightSmall,
                    AsyncModelListBuilder(
                      viewModel: subjectViewModel,
                      models: subjectViewModel.classes,
                      onRefresh: subjectViewModel.loadClasses,
                      shimmer: const AppFilterChipShimmer(),
                      builder: (classes) => SizedBox(
                        height: 45,
                        width: double.maxFinite,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => AppFilterChip(
                            label: classes[index].name ?? intl.error,
                            selected: subjectViewModel.selectedClass?.id ==
                                classes[index].id,
                            onTap: () => subjectViewModel
                                .selectedClassIndex(classes[index].id),
                            viewModel: viewModel,
                          ),
                          separatorBuilder: (context, index) =>
                              Dimensions.widthSmall,
                          itemCount: classes.length,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: AsyncModelListBuilder(
                viewModel: subjectViewModel,
                models: subjectViewModel.subjects,
                shimmer: SubjectCardShimmer(),
                onRefresh: subjectViewModel.loadSubjects,
                builder: (subjects) => ListView.separated(
                  separatorBuilder: (context, index) => Dimensions.heightSmall,
                  padding: Dimensions.paddingAllMedium,
                  itemCount: subjects.length,
                  itemBuilder: (context, index) => SubjectCard(
                    classe: subjectViewModel.selectedClass!,
                    subject: subjects[index],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
