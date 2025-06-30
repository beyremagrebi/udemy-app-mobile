import 'package:flutter/material.dart';

class IconBox extends StatelessWidget {
  final IconData icon;
  final Color iconBackgroundColor;
  final double size;
  final double borderRadius;
  final Alignment alignment;

  const IconBox({
    required this.icon,
    required this.iconBackgroundColor,
    super.key,
    this.size = 40,
    this.borderRadius = 8,
    this.alignment = Alignment.centerRight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Container(
        width: size,
        height: size,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            iconBackgroundColor,
            iconBackgroundColor.withOpacity(0.7)
          ]),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: size * 0.55,
        ),
      ),
    );
  }
}
