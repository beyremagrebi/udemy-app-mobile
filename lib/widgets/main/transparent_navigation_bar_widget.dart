import 'dart:ui';

import 'package:erudaxis/core/constants/constant.dart';
import 'package:erudaxis/core/styles/dimensions.dart';
import 'package:erudaxis/providers/main/bottom_navigation_view_model.dart';
import 'package:flutter/material.dart';

import 'bottom_navigation_bar_item.dart';

Widget buildTransparentBottomNav(
  BuildContext context,
  BottomNavigationViewModel viewModel,
) {
  return SizedBox(
    height: 65,
    child: ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: DecoratedBox(
          decoration: BoxDecoration(
            // Use the same gradient as your app background but with transparency
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white.withOpacity(0.15),
                Colors.white.withOpacity(0.1),
                Colors.white.withOpacity(0.05),
              ],
            ),

            border: Border(
              top: BorderSide(
                color: Colors.white.withOpacity(0.4),
                width: 0.5,
              ),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
              BoxShadow(
                color: Colors.white.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: _buildBottomNavigationBar(context, viewModel),
        ),
      ),
    ),
  );
}

Widget _buildBottomNavigationBar(
    BuildContext context, BottomNavigationViewModel viewModel) {
  final navItems = bottomNavigationBarItem(context);

  final List<Widget> navWidgets = [];

  for (int index = 0; index < navItems.length; index++) {
    final item = navItems[index];
    final bool isSelected = viewModel.slectedIndex == index;

    navWidgets.add(
      GestureDetector(
        onTap: () => viewModel.onSelectChange(index),
        behavior: HitTestBehavior.opaque,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color:
                isSelected ? Colors.white.withOpacity(0.2) : Colors.transparent,
            borderRadius: Dimensions.smallBorderRadius,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedScale(
                scale: isSelected ? 1.0 : 0.9,
                duration: const Duration(milliseconds: 300),
                child: item.icon,
              ),
              if (item.label?.isNotEmpty ?? false)
                Text(
                  item.label!,
                  style: textTheme.bodyMedium?.copyWith(
                    color: isSelected
                        ? Colors.white
                        : Colors.white.withOpacity(0.7),
                    fontSize: 10,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: navWidgets,
  );
}
