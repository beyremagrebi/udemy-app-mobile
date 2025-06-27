import 'package:flutter/material.dart';

List<BottomNavigationBarItem> bottomNavigationBarItem(BuildContext context) {
  return [
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.home_outlined,
        size: 24,
      ),
      label: 'home',
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
        Icons.padding_outlined,
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
