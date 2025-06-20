import 'package:erudaxis/core/config/media/asset_image_widget.dart';
import 'package:erudaxis/core/constants/assets.dart';
import 'package:erudaxis/presentation/utils/app_scaffold.dart';
import 'package:erudaxis/providers/auth/login_view_model.dart';
import 'package:erudaxis/widgets/auth/login_form.dart';
import 'package:erudaxis/widgets/auth/welcome_login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/styles/dimensions.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginViewModel(context),
      child: Consumer<LoginViewModel>(
        builder: (context, viewModel, child) => AppScaffold(
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: Dimensions.paddingAllMedium,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 0.4),
                    borderRadius: Dimensions.smallBorderRadius,
                  ),
                  child: Card(
                    elevation: 0,
                    child: Padding(
                      padding: Dimensions.paddingAllHuge,
                      child: Column(
                        children: [
                          const AssetsImageWidget(
                            imageFileName: Assets.defaultMaleAvatar,
                          ),
                          Dimensions.heightMedium,
                          const WelcomeLogin(),
                          Dimensions.heightMedium,
                          LoginForm(
                            viewModel: viewModel,
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
