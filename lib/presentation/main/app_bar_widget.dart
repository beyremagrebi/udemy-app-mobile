import 'package:erudaxis/core/config/media/asset_image_widget.dart';
import 'package:erudaxis/core/constants/assets.dart';
import 'package:erudaxis/providers/main/profile/theme/theme_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/styles/dimensions.dart';
import '../../providers/main/drawer_view_model.dart';
import '../utils/app_gradient.dart';

class AppBarWidget extends StatelessWidget {
  final DrawerViewModel drawerViewModel;
  const AppBarWidget({required this.drawerViewModel, super.key});

  @override
  Widget build(BuildContext context) {
    final thmeViewModel = context.watch<ThemeViewModel>();
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
          AssetsImageWidget(
            imageFileName: Assets.logoAppLight,
            height: 16,
            gradient: AppGradients.loginLogoGradient(thmeViewModel),
            fit: BoxFit.contain,
          )
        ],
      ),
    );
  }
}
