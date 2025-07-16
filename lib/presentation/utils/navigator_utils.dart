import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

Future<void> navigateTo(BuildContext context, Widget view) {
  return Navigator.of(context).push(
    PageTransition(
      type: PageTransitionType.fade,
      opaque: true,
      alignment: Alignment.center,
      child: view,
    ),
  );
}

Future<void> navigateToDeleteTree(BuildContext context, Widget view) {
  return Navigator.of(context).pushAndRemoveUntil(
    PageTransition(
      type: PageTransitionType.rightToLeftWithFade,
      alignment: Alignment.center,
      opaque: true,
      child: PopScope(canPop: false, child: view),
    ),
    (route) => false,
  );
}
