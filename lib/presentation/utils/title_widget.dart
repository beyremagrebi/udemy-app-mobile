import 'package:erudaxis/core/constants/constant.dart';
import 'package:erudaxis/core/styles/dimensions.dart';
import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  final String title;
  final Widget child;
  final VoidCallback? onTap;
  final IconData icon;
  final Widget? materialPage;
  final int? totalItem;
  final int? limitedList;
  const TitleWidget({
    required this.child,
    required this.title,
    required this.icon,
    this.materialPage,
    this.totalItem,
    this.limitedList = 5,
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  color: const Color.fromARGB(255, 227, 151, 247),
                ),
                Dimensions.widthSmall,
                Text(
                  title,
                  style: textTheme.bodyMedium?.copyWith(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (materialPage != null) ...[
                  if (totalItem != null) ...[],
                  const Icon(
                    Icons.navigate_next_outlined,
                    size: 15,
                  )
                ]
              ],
            ),
            Dimensions.heightSmall,
            child,
          ],
        ),
      ),
    );
  }
}
