import 'package:erudaxis/providers/global/session_manager_view_model.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

import '../utils/navigator_utils.dart';
import 'facility_view.dart';

class FacilityIcon extends StatelessWidget {
  final SessionManager sessionManager;
  const FacilityIcon({required this.sessionManager, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navigateTo(
          context,
          FacilityView(sessionManager: sessionManager),
        );
      },
      child: const Material(
        color: Colors.transparent,
        clipBehavior: Clip.hardEdge,
        child: Icon(Symbols.assured_workload_rounded),
      ),
    );
  }
}
