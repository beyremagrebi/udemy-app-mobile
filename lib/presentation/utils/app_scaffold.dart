import 'package:flutter/material.dart';

import '../../widgets/common/gradient_surface_widget.dart';

class AppScaffold extends Scaffold {
  const AppScaffold({
    super.key,
    super.appBar,
    super.backgroundColor,
    super.body,
    super.bottomNavigationBar,
    super.bottomSheet,
    super.drawer,
    super.drawerDragStartBehavior,
    super.drawerEdgeDragWidth,
    super.drawerEnableOpenDragGesture,
    super.drawerScrimColor,
    super.endDrawer,
    super.endDrawerEnableOpenDragGesture,
    super.extendBody,
    super.extendBodyBehindAppBar,
    super.floatingActionButton,
    super.floatingActionButtonAnimator,
    super.floatingActionButtonLocation,
    super.onDrawerChanged,
    super.onEndDrawerChanged,
    super.persistentFooterAlignment,
    super.persistentFooterButtons,
    super.primary,
    super.resizeToAvoidBottomInset,
    super.restorationId,
  });

  @override
  Widget? get body => super.backgroundColor != null
      ? Container(
          width: double.maxFinite,
          height: double.maxFinite,
          color: Colors.black54,
          child: super.body,
        )
      : GradientSurfaceWidget(
          child: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            color: Colors.black54,
            child: super.body,
          ),
        );
}
