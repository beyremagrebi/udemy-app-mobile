import 'package:erudaxis/core/styles/dimensions.dart';
import 'package:flutter/material.dart';

import '../../widgets/common/gradient_surface_widget.dart';

class AppDrawer extends Drawer {
  const AppDrawer({
    super.key,
    super.backgroundColor,
    super.child,
    super.clipBehavior,
    super.elevation,
    super.width,
    super.semanticLabel,
    super.shadowColor,
    super.shape,
    super.surfaceTintColor,
  });
  @override
  Widget? get child => GradientSurfaceWidget(
        forDrawer: true,
        child: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          color: Colors.black45,
          child: super.child,
        ),
      );
  @override
  ShapeBorder? get shape =>
      super.shape ??
      const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        bottomRight: Dimensions.mediumRadius,
      ));
}
