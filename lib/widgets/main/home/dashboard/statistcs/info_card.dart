import 'package:erudaxis/core/styles/dimensions.dart';
import 'package:erudaxis/presentation/utils/icon_box.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/constant.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color iconBackgroundColor;

  const InfoCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.iconBackgroundColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Padding(
        padding: Dimensions.paddingAllSmall,
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.bodyMedium?.copyWith(
                    color: Colors.white.withOpacity(0.9),
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                  ),
                ),
                Text(
                  value,
                  style: textTheme.headlineSmall?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
            Expanded(
              child: IconBox(
                icon: icon,
                iconBackgroundColor: iconBackgroundColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
