import 'package:erudaxis/core/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

List<BottomNavigationBarItem> bottomNavigationBarItem(BuildContext context) {
  return [
    BottomNavigationBarItem(
      icon: const Icon(
        Icons.home_outlined,
        size: 22,
      ),
      label: intl.home,
    ),
    BottomNavigationBarItem(
      icon: const Icon(
        Symbols.book_5_rounded,
        size: 22,
      ),
      label: intl.subjects,
    ),
    BottomNavigationBarItem(
      icon: const Icon(
        Icons.chat_bubble_outline,
        size: 22,
      ),
      label: intl.chat,
    ),
    BottomNavigationBarItem(
      icon: const Icon(
        Symbols.planner_review_rounded,
        size: 22,
      ),
      label: intl.planning,
    ),
    BottomNavigationBarItem(
      icon: const Icon(
        Icons.person_outline,
        size: 22,
      ),
      label: intl.profile,
    ),
  ];
}
