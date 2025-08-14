import 'package:erudaxis/core/config/media/asset_image_widget.dart';
import 'package:erudaxis/core/constants/assets.dart';
import 'package:erudaxis/presentation/utils/app_gradient.dart';
import 'package:erudaxis/presentation/utils/app_scaffold.dart';
import 'package:erudaxis/providers/auth/login_view_model.dart';
import 'package:erudaxis/providers/auth/validator_view_model.dart';
import 'package:erudaxis/widgets/auth/login_form.dart';
import 'package:erudaxis/widgets/auth/welcome_login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/styles/dimensions.dart';
import '../../providers/main/profile/theme/theme_view_model.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final thmeViewModel = context.watch<ThemeViewModel>();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: LoginViewModel.new,
        ),
        ChangeNotifierProvider(
          create: ValidatorViewModel.new,
        ),
      ],
      child: Consumer2<LoginViewModel, ValidatorViewModel>(
        builder: (
          context,
          viewModel,
          validatorViewModel,
          child,
        ) =>
            AppScaffold(
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
                          AssetsImageWidget(
                            imageFileName: Assets.logoAppLight,
                            gradient:
                                AppGradients.loginLogoGradient(thmeViewModel),
                            height: 20,
                          ),
                          Dimensions.heightMedium,
                          const WelcomeLogin(),
                          Dimensions.heightExtraLarge,
                          LoginForm(
                            viewModel: viewModel,
                            validatorViewModel: validatorViewModel,
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
