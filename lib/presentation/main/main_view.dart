import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/main/bottom_navigation_view_model.dart';
import '../../widgets/main/app_bar_widget.dart';
import '../../widgets/main/transparent_navigation_bar_widget.dart';
import '../utils/app_bar_gradient.dart';
import '../utils/app_scaffold.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: BottomNavigationViewModel.new,
      child: Consumer<BottomNavigationViewModel>(
        builder: (context, viewModel, child) {
          return AppScaffold(
            extendBody: true,
            appBar: AppBarGradient(
              titleSpacing: 0,
              title: appBarWidget(context),
            ),
            drawer: const Drawer(),
            body: IndexedStack(
              index: viewModel.slectedIndex,
              children: viewModel.pages(),
            ),
            bottomNavigationBar: buildTransparentBottomNav(
              context,
              viewModel,
            ),
          );
        },
      ),
    );
  }
}
