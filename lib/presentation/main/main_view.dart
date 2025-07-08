import 'package:erudaxis/interfaces/language/i_screen_with_localization.dart';
import 'package:erudaxis/providers/global/session_manager_view_model.dart';
import 'package:erudaxis/providers/main/profile/language/language_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scroll_to_hide/scroll_to_hide.dart';

import '../../providers/main/bottom_navigation_view_model.dart';
import '../../widgets/main/app_bar_widget.dart';
import '../../widgets/main/transparent_navigation_bar_widget.dart';
import '../utils/app_bar_gradient.dart';
import '../utils/app_scaffold.dart';

class MainView extends IScreenWithLocalization {
  final String userId;
  const MainView({required this.userId, super.key});

  @override
  Widget buildLocalized(
      BuildContext context, LanguageViewModel languageViewModel) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: BottomNavigationViewModel.new,
        ),
        ChangeNotifierProvider(
          create: (context) => SessionManager(context, userId: userId),
        ),
      ],
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
            bottomNavigationBar: ScrollToHide(
              key: ValueKey(viewModel.slectedIndex),
              scrollController: viewModel.currentScrollController,
              height: 50,
              duration: const Duration(milliseconds: 250),
              hideDirection: Axis.vertical,
              child: buildTransparentBottomNav(
                context,
                viewModel,
              ),
            ),
          );
        },
      ),
    );
  }
}
