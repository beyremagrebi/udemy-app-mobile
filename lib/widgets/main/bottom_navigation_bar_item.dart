import 'package:flutter/material.dart';

List<BottomNavigationBarItem> bottomNavigationBarItem(BuildContext context) {
  return [
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.home_outlined,
        size: 26,
      ),
      label: 'home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.chat_bubble_outline,
        size: 26,
      ),
      label: 'Chat',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.padding_outlined,
        size: 26,
      ),
      label: 'Cours',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.person_outline,
        size: 26,
      ),
      label: 'Profile',
    ),
  ];
}
