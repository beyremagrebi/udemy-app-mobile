import 'package:erudaxis/core/constants/constant.dart';
import 'package:erudaxis/core/styles/dimensions.dart';
import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  final String title;
  final Widget child;
  final VoidCallback? onTap;
  final IconData icon;
  const TitleWidget({
    required this.child,
    required this.title,
    required this.icon,
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
            ],
          ),
          Dimensions.heightSmall,
          child,
        ],
      ),
    );
  }
}
