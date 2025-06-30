import 'package:erudaxis/core/styles/dimensions.dart';
import 'package:erudaxis/presentation/utils/icon_box.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/constant.dart';

class ActionCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final IconData icon;
  final Color iconColor;
  final int? notifCount;
  const ActionCard({
    required this.icon,
    required this.title,
    required this.subTitle,
    required this.iconColor,
    this.notifCount,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Container(
        padding: Dimensions.paddingAllSmall,
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconBox(
                  icon: icon,
                  iconBackgroundColor: iconColor,
                  alignment: Alignment.topLeft,
                ),
                if (notifCount != null) ...[
                  const Expanded(child: Dimensions.widthSmall),
                  Container(
                    width: 25,
                    height: 25,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '4',
                      style: textTheme.bodyMedium?.copyWith(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ]
              ],
            ),
            Dimensions.heightMedium,
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: textTheme.titleMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  subTitle,
                  style: textTheme.bodySmall?.copyWith(
                    color: Theme.of(context)
                        .colorScheme
                        .onPrimary
                        .withOpacity(0.7),
                  ),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
