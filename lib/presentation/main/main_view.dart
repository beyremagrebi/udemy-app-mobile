import 'package:erudaxis/interfaces/language/i_screen_with_localization.dart';
import 'package:erudaxis/presentation/global/notification_icon.dart';
import 'package:erudaxis/presentation/main/drawer/drawer_view.dart';
import 'package:erudaxis/providers/main/drawer_view_model.dart';
import 'package:erudaxis/providers/main/profile/language/language_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scroll_to_hide/scroll_to_hide.dart';

import '../../providers/global/session_manager_view_model.dart';
import '../../providers/main/bottom_navigation_view_model.dart';
import '../../widgets/main/transparent_navigation_bar_widget.dart';
import '../admin/facility_icon.dart';
import '../utils/app_bar_gradient.dart';
import '../utils/app_drawer.dart';
import '../utils/app_scaffold.dart';
import 'app_bar_widget.dart';

class MainView extends IScreenWithLocalization {
  const MainView({super.key});

  @override
  Widget buildLocalized(
      BuildContext context, LanguageViewModel languageViewModel) {
    return Consumer3<BottomNavigationViewModel, DrawerViewModel,
        SessionManager>(
      builder: (context, viewModel, drawerViewModel, sessionManager, child) {
        return AppScaffold(
          extendBody: true,
          appBar: AppBarGradient(
            titleSpacing: 0,
            title: AppBarWidget(
              drawerViewModel: drawerViewModel,
            ),
            actions: [
              ...[
                sessionManager.valueByRole<Widget?>(
                  superAdmin: FacilityIcon(
                    sessionManager: sessionManager,
                  ),
                  companyAdmin: FacilityIcon(
                    sessionManager: sessionManager,
                  ),
                  collaborator: null,
                  instructor: null,
                  student: null,
                  responsable: null,
                )
              ].whereType<Widget>(),
              const NotificationIcon(),
            ],
          ),
          body: Scaffold(
            key: drawerViewModel.scaffoldKey,
            onDrawerChanged: (isOpened) {
              drawerViewModel.toggleDrawer();
            },
            drawer: const AppDrawer(
              child: DrawerView(),
            ),
            backgroundColor: Colors.transparent,
            body: IndexedStack(
              index: viewModel.slectedIndex,
              children: viewModel.pages(drawerViewModel),
            ),
          ),
          bottomNavigationBar: Visibility(
            visible: !drawerViewModel.isDrowerOpen,
            child: ScrollToHide(
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
          ),
        );
      },
    );
  }
}
