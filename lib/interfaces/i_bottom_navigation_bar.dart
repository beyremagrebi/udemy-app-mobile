import 'package:flutter/material.dart';

/// Interface for handling bottom navigation bar behavior
abstract interface class IBottomNavigationBar {
  int get currentIndex;
  void onSelectChange(int index);
  List<Widget> pages();

  int get itemCount;
}
