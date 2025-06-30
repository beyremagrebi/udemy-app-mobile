import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

List<BottomNavigationBarItem> bottomNavigationBarItem(BuildContext context) {
  return [
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.home_outlined,
        size: 24,
      ),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.chat_bubble_outline,
        size: 24,
      ),
      label: 'Chat',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Symbols.book_5_rounded,
        size: 24,
      ),
      label: 'Cours',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.person_outline,
        size: 24,
      ),
      label: 'Profile',
    ),
  ];
}
