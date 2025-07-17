import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/constants/constant.dart';
import '../../core/styles/dimensions.dart';

class AppLogoWidget extends StatelessWidget {
  final double fontSize;
  final double iconSize;
  final Color? iconColor;
  final Color? textColor;

  const AppLogoWidget({
    super.key,
    this.fontSize = 20.0,
    this.iconSize = 24.0,
    this.iconColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.school_outlined,
          size: iconSize,
          color: iconColor ?? Colors.white,
        ),
        Dimensions.widthSmall,
        Text(
          intl.appName,
          style: GoogleFonts.leagueSpartan(
            fontWeight: FontWeight.bold,
            fontSize: fontSize,
            color: textColor ?? Colors.white,
          ),
        ),
      ],
    );
  }
}
