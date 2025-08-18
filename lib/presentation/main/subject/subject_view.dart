import 'package:erudaxis/core/styles/dimensions.dart';
import 'package:erudaxis/widgets/common/app_filtre_chip.dart';
import 'package:erudaxis/widgets/common/form/input_text.dart';
import 'package:erudaxis/widgets/common/gradient_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/main/profile/theme/theme_view_model.dart';

class SubjectView extends StatelessWidget {
  const SubjectView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ThemeViewModel>();
    return Column(
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
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      AppFilterChip(
                        label: 'Class-1',
                        selected: true,
                        onTap: () {},
                        viewModel: viewModel,
                      ),
                      AppFilterChip(
                        label: 'Class-2',
                        selected: false,
                        onTap: () {},
                        viewModel: viewModel,
                      ),
                      AppFilterChip(
                        label: 'Class-3',
                        selected: false,
                        onTap: () {},
                        viewModel: viewModel,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
