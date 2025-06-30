import 'package:erudaxis/core/constants/constant.dart';
import 'package:erudaxis/core/styles/dimensions.dart';
import 'package:flutter/material.dart';

class RecentLibraryWidget extends StatelessWidget {
  final bool isAdd;
  final Color color;
  final Color iconColor;
  final String subjectName;
  final IconData icon;

  const RecentLibraryWidget(
      {required this.isAdd,
      required this.color,
      required this.subjectName,
      required this.icon,
      required this.iconColor,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      decoration: BoxDecoration(
        border: isAdd ? Border.all(color: Colors.white24, width: 2) : null,
        gradient: !isAdd
            ? LinearGradient(colors: [color, color.withOpacity(0.7)])
            : null,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(18),
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 36,
                  color: iconColor,
                ),
                Dimensions.heightMedium,
                Text(
                  subjectName,
                  textAlign: TextAlign.center,
                  style: textTheme.bodyMedium?.copyWith(
                    color: isAdd ? Colors.white54 : Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
