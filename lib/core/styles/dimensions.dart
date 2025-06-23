import 'package:flutter/material.dart';

import '../constants/constant.dart';

class Dimensions {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;

  static const double xs = 4;

  static const double s = 8;
  static const double m = 12;

  static const double l = 16;
  static const double xl = 20;
  static const double xxxl = 24;
  static const xsmallRadius = Radius.circular(xs);
  static const smallRadius = Radius.circular(s);

  static const mediumRadius = Radius.circular(m);

  static const largeRadius = Radius.circular(l);
  static const extraLargeRadius = Radius.circular(xl);
  static const hugeRadius = Radius.circular(xxxl);

  /// Border Radius
  static const BorderRadius xsmallBorderRadius = BorderRadius.all(
    xsmallRadius,
  );
  static const BorderRadius smallBorderRadius = BorderRadius.all(
    smallRadius,
  );
  static const BorderRadius mediumBorderRadius = BorderRadius.all(
    mediumRadius,
  );

  static const BorderRadius largeBorderRadius = BorderRadius.all(
    largeRadius,
  );
  static const BorderRadius extraLargeBorderRadius = BorderRadius.all(
    extraLargeRadius,
  );
  static const BorderRadius hugeBorderRadius = BorderRadius.all(
    hugeRadius,
  );

  /// Sized Box [ height ]
  static const heightxSmall = SizedBox(height: xs);
  static const heightSmall = SizedBox(height: s);
  static const heightMedium = SizedBox(height: m);

  static const heightLarge = SizedBox(height: l);
  static const heightExtraLarge = SizedBox(height: xl);
  static const heightHuge = SizedBox(height: xxxl);

  /// Sized Box [ width ]
  static const widthxSmall = SizedBox(width: xs);
  static const widthSmall = SizedBox(width: s);
  static const widthMedium = SizedBox(width: m);

  static const widthLarge = SizedBox(width: l);
  static const widthExtraLarge = SizedBox(width: xl);
  static const widthHuge = SizedBox(width: xxxl);
  static final dpr = MediaQuery.of(mainContext).devicePixelRatio;
  static double get height => screenHeight;

  static EdgeInsets get horizontalExtrrePaddingLarge =>
      const EdgeInsets.symmetric(horizontal: xl);
  static EdgeInsets get horizontalPaddingLarge =>
      const EdgeInsets.symmetric(horizontal: l);
  static EdgeInsets get horizontalPaddingMedium =>
      const EdgeInsets.symmetric(horizontal: m);
  static EdgeInsets get horizontalPaddingSmall =>
      const EdgeInsets.symmetric(horizontal: s);

  /// Padding [horizental]
  static EdgeInsets get horizontalPaddingxSmall =>
      const EdgeInsets.symmetric(horizontal: xs);

  static EdgeInsets get paddingAllExtraLarge => const EdgeInsets.all(xl);
  static EdgeInsets get paddingAllHuge => const EdgeInsets.all(xxxl);
  static EdgeInsets get paddingAllLarge => const EdgeInsets.all(l);
  static EdgeInsets get paddingAllMedium => const EdgeInsets.all(m);
  static EdgeInsets get paddingAllSmall => const EdgeInsets.all(s);

  /// Padding [all]
  static EdgeInsets get paddingAllxSmall => const EdgeInsets.all(xs);

  static EdgeInsets get verticalPaddingExtraLarge =>
      const EdgeInsets.symmetric(vertical: xl);
  static EdgeInsets get verticalPaddingLarge =>
      const EdgeInsets.symmetric(vertical: xl);
  static EdgeInsets get verticalPaddingMedium =>
      const EdgeInsets.symmetric(vertical: m);
  static EdgeInsets get verticalPaddingSmall =>
      const EdgeInsets.symmetric(vertical: s);

  /// Padding [vertical]
  static EdgeInsets get verticalPaddingxSmall =>
      const EdgeInsets.symmetric(vertical: xs);
  static double get width => screenWidth;

  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
  }
}
