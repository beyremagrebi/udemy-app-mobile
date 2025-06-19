import 'package:erudaxis/interfaces/i_bottom_navigation_bar.dart';
import 'package:erudaxis/providers/base_view_model.dart';
import 'package:flutter/material.dart';

class BottomNavigationViewModel extends BaseViewModel
    implements IBottomNavigationBar {
  BottomNavigationViewModel(super.context);

  int slectedIndex = 1;

  @override
  int get currentIndex => slectedIndex;

  @override
  int get itemCount => 4;

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
      const Center(child: Text('Page 1')),
      const Center(child: Text('Page 2')),
      const Center(child: Text('Page 3')),
      const Center(child: Text('Page 4')),
    ];
  }
}
