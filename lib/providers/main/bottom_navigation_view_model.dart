import 'package:erudaxis/interfaces/i_bottom_navigation_bar.dart';
import 'package:erudaxis/presentation/main/home/home_view.dart';
import 'package:erudaxis/presentation/main/profile/profile_view.dart';
import 'package:erudaxis/providers/base_view_model.dart';
import 'package:flutter/material.dart';

class BottomNavigationViewModel extends BaseViewModel
    implements IBottomNavigationBar {
  int slectedIndex = 0;

  ScrollController scrollController = ScrollController();

  BottomNavigationViewModel(super.context);

  @override
  int get currentIndex => slectedIndex;

  @override
  int get itemCount => 5;

  @override
  void onSelectChange(int index) {
    if (index >= 0 && index < itemCount) {
      slectedIndex = index;
      update();
    }
  }

  @override
  List<Widget> pages() {
    return [
      HomeView(
        scrollController: scrollController,
      ),
      const Center(child: Text('Cours view')),
      const Center(child: Text('Chat view')),
      const Center(child: Text('Planning view')),
      const ProfileView(),
    ];
  }
}
