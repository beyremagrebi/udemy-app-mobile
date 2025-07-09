import 'package:flutter/material.dart';

import '../../widgets/common/gradient_app_bar_widget.dart';

class AppBarGradient extends AppBar {
  final PreferredSizeWidget? originalAppBar;
  AppBarGradient({
    super.key,
    super.actions,
    super.actionsIconTheme,
    super.automaticallyImplyLeading,
    super.backgroundColor,
    super.bottom,
    super.bottomOpacity,
    super.centerTitle,
    super.clipBehavior,
    super.elevation,
    super.excludeHeaderSemantics,
    super.flexibleSpace,
    super.forceMaterialTransparency,
    super.foregroundColor,
    super.iconTheme,
    super.leading,
    super.leadingWidth,
    super.notificationPredicate,
    super.primary,
    super.scrolledUnderElevation,
    super.shadowColor,
    super.shape,
    super.surfaceTintColor,
    super.systemOverlayStyle,
    super.title,
    super.titleSpacing,
    super.titleTextStyle,
    super.toolbarHeight,
    super.toolbarOpacity,
    super.toolbarTextStyle,
    this.originalAppBar,
  });

  @override
  Color? get backgroundColor => Colors.transparent;
  @override
  Widget? get flexibleSpace => GradientAppBarWidget(child: originalAppBar);
}
