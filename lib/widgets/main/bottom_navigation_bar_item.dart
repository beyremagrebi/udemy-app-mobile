import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

List<BottomNavigationBarItem> bottomNavigationBarItem(BuildContext context) {
  return [
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.home_outlined,
        size: 22,
      ),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Symbols.book_5_rounded,
        size: 22,
      ),
      label: 'Cours',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.chat_bubble_outline,
        size: 22,
      ),
      label: 'Chat',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Symbols.planner_review_rounded,
        size: 22,
      ),
      label: 'Planning',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.person_outline,
        size: 22,
      ),
      label: 'Profile',
    ),
  ];
}
