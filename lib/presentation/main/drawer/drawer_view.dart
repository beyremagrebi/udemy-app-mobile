import 'package:erudaxis/core/styles/dimensions.dart';
import 'package:erudaxis/presentation/main/drawer/drawer_list_item.dart';
import 'package:erudaxis/widgets/common/gradient_app_bar_widget.dart';
import 'package:flutter/material.dart';

import '../../../widgets/main/drawer/drawer_header_widget.dart';

class DrawerView extends StatelessWidget {
  const DrawerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GradientAppBarWidget(
          child: SizedBox(
            height: 100,
            child: DrawerHeader(
              duration: Durations.short2,
              margin: EdgeInsets.zero,
              padding: Dimensions.paddingAllMedium,
              decoration: const BoxDecoration(border: Border()),
              child: const DrawerHeaderWidget(),
            ),
          ),
        ),
        Dimensions.heightMedium,
        const Expanded(child: DrawerListItem())
      ],
    );
  }
}
