import 'package:erudaxis/core/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/styles/dimensions.dart';
import '../../providers/main/drawer_view_model.dart';

class AppBarWidget extends StatelessWidget {
  final DrawerViewModel drawerViewModel;
  const AppBarWidget({required this.drawerViewModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Dimensions.horizontalPaddingMedium,
      child: Row(
        children: [
          Material(
            color: Colors.transparent,
            child: IconButton(
              onPressed: () {
                drawerViewModel.isDrowerOpen
                    ? drawerViewModel.scaffoldKey.currentState?.closeDrawer()
                    : drawerViewModel.scaffoldKey.currentState?.openDrawer();
              },
              icon: Icon(
                drawerViewModel.isDrowerOpen
                    ? Icons.menu_open_outlined
                    : Icons.menu_outlined,
              ),
            ),
          ),
          const Icon(Icons.school_outlined),
          Dimensions.widthSmall,
          Text(
            intl.appName,
            style: GoogleFonts.leagueSpartan(),
          ),
        ],
      ),
    );
  }
}
