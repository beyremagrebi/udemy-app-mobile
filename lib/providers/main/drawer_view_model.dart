import 'package:erudaxis/core/constants/constant.dart';
import 'package:erudaxis/core/enum/drawer_item.dart';
import 'package:erudaxis/presentation/main/home/dashboard/class/classes_view.dart';
import 'package:erudaxis/presentation/main/home/home_view.dart';
import 'package:erudaxis/providers/base_view_model.dart';
import 'package:erudaxis/providers/global/session_manager_view_model.dart';
import 'package:erudaxis/providers/main/bottom_navigation_view_model.dart';
import 'package:erudaxis/widgets/common/empty_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DrawerViewModel extends BaseViewModel {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  bool isDrowerOpen = false;
  Widget selectedWidget = const HomeView();
  DrawerItem selectedItem = DrawerItem.home;

  final sessionviewModel = mainContext.read<SessionManager>();
  DrawerViewModel(super.context);
  void onTapItem(DrawerItem drawerItem) {
    final viewModel = mainContext.read<BottomNavigationViewModel>();
    selectedItem = drawerItem;

    switch (drawerItem) {
      case DrawerItem.home:
        viewModel.onSelectChange(0);
        selectedWidget = const HomeView();
        break;

      case DrawerItem.classes:
        viewModel.onSelectChange(0);
        selectedWidget = const ClassesView();
        break;

      case DrawerItem.subjects:
        viewModel.onSelectChange(1);
        break;

      case DrawerItem.exams:
        viewModel.onSelectChange(0);
        selectedWidget = const EmptyWidget();
        break;

      case DrawerItem.quizzes:
        viewModel.onSelectChange(0);
        selectedWidget = const EmptyWidget();
        break;

      case DrawerItem.library:
        viewModel.onSelectChange(0);
        selectedWidget = const EmptyWidget();
        break;

      case DrawerItem.documents:
        viewModel.onSelectChange(0);
        selectedWidget = const EmptyWidget();
        break;

      case DrawerItem.invoices:
        viewModel.onSelectChange(0);
        selectedWidget = const EmptyWidget();
        break;

      case DrawerItem.absences:
        viewModel.onSelectChange(0);
        selectedWidget = const EmptyWidget();
        break;

      case DrawerItem.schedule:
        viewModel.onSelectChange(3);
        break;

      case DrawerItem.calendar:
        viewModel.onSelectChange(0);
        selectedWidget = const EmptyWidget();
        break;

      case DrawerItem.videoConference:
        viewModel.onSelectChange(0);
        selectedWidget = const EmptyWidget();
        break;

      case DrawerItem.settings:
        viewModel.onSelectChange(4);
        break;

      case DrawerItem.logout:
        sessionviewModel.logout();
        break;
    }

    if (isDrowerOpen) {
      scaffoldKey.currentState?.closeDrawer();
    }
    update();
  }

  void toggleDrawer() {
    isDrowerOpen = !isDrowerOpen;
    update();
  }
}
