import 'package:erudaxis/core/styles/dimensions.dart';
import 'package:erudaxis/providers/main/home/class/class_view_model.dart';
import 'package:erudaxis/widgets/common/form/input_text.dart';
import 'package:erudaxis/widgets/common/gradient_app_bar_widget.dart';
import 'package:erudaxis/widgets/main/home/dashboard/actions/class_card.dart';
import 'package:erudaxis/widgets/shimmer/class_card_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../utils/async/async_model_list_builder.dart';

class ClassesView extends StatelessWidget {
  const ClassesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GradientAppBarWidget(
          child: Container(
            margin: const EdgeInsets.only(bottom: Dimensions.s),
            padding: Dimensions.horizontalPaddingLarge,
            child: const InputText(
              prefixIcon: Icon(
                Icons.search,
                color: Colors.white30,
              ),
              onTapOutside: false,
              hintText: 'Recherche',
            ),
          ),
        ),
        ChangeNotifierProvider(
          create: ClassViewModel.new,
          child: Consumer<ClassViewModel>(
            builder: (context, viewModel, child) => Expanded(
                child: AsyncModelListBuilder(
              viewModel: viewModel,
              models: viewModel.classes,
              onRefresh: viewModel.loadClasses,
              shimmer: ClassCardShimmer(),
              builder: (classes) => ListView.separated(
                separatorBuilder: (context, index) => Dimensions.heightSmall,
                padding: Dimensions.paddingAllMedium,
                itemCount: classes.length,
                itemBuilder: (context, index) => ClassCard(
                  classe: classes[index],
                ),
              ),
            )),
          ),
        )
      ],
    );
  }
}
