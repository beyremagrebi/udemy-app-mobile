import 'package:erudaxis/core/constants/constant.dart';
import 'package:erudaxis/interfaces/i_bottom_navigation_bar.dart';
import 'package:erudaxis/presentation/main/profile/profile_view.dart';
import 'package:erudaxis/providers/base_view_model.dart';
import 'package:erudaxis/providers/main/drawer_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavigationViewModel extends BaseViewModel
    implements IBottomNavigationBar {
  int slectedIndex = 0;

  BottomNavigationViewModel(super.context);
  @override
  int get currentIndex => slectedIndex;

  ScrollController get currentScrollController {
    switch (slectedIndex) {
      case 0:
        return homeScrollController;
      case 4:
        return profileScrollController;
      default:
        return ScrollController();
    }
  }

  @override
  int get itemCount => 5;
  @override
  void onSelectChange(int index) {
    if (index >= 0 && index < itemCount) {
      if (slectedIndex != index) {
        slectedIndex = index;
        update();
      }
    }
  }

  @override
  List<Widget> pages() {
    final drawerViewModel = mainContext.read<DrawerViewModel>();
    return [
      drawerViewModel.selectedWidget,
      const Center(child: Text('Cours view')),
      const Center(child: Text('Chat view')),
      const Center(child: Text('Planning view')),
      const ProfileView(),
    ];
  }
}
