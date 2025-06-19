import 'package:flutter/material.dart';

import '../styles/dimensions.dart';

class AppCardTheme {
  static CardTheme get cardTheme => CardTheme(
        color: Colors.white.withOpacity(0.2),
        elevation: 10,
        shape: const RoundedRectangleBorder(
          borderRadius: Dimensions.smallBorderRadius,
        ),
        margin: EdgeInsets.zero,
      );
}
