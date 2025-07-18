import 'package:erudaxis/core/constants/constant.dart';
import 'package:erudaxis/core/styles/dimensions.dart';
import 'package:erudaxis/presentation/utils/app_bar_gradient.dart';
import 'package:erudaxis/presentation/utils/app_scaffold.dart';
import 'package:erudaxis/widgets/common/form/input_text.dart';
import 'package:erudaxis/widgets/common/gradient_app_bar_widget.dart';
import 'package:erudaxis/widgets/main/home/dashboard/actions/class_card.dart';
import 'package:flutter/material.dart';

class ClassesView extends StatelessWidget {
  const ClassesView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBarGradient(
        centerTitle: true,
        title: Text(intl.my_classes),
      ),
      body: Column(
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
                hintText: 'Recherche',
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => Dimensions.heightSmall,
              padding: Dimensions.paddingAllMedium,
              itemCount: 5,
              itemBuilder: (context, index) => const ClassCard(),
            ),
          )
        ],
      ),
    );
  }
}
