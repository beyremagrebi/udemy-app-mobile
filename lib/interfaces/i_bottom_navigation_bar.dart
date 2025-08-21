import 'package:flutter/material.dart';

import '../providers/main/drawer_view_model.dart';

/// Interface for handling bottom navigation bar behavior
abstract interface class IBottomNavigationBar {
  int get currentIndex;
  int get itemCount;
  void onSelectChange(int index);

  List<Widget> pages(DrawerViewModel drawerViewModel);
}
