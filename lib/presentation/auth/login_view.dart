import 'package:erudaxis/core/constants/constant.dart';
import 'package:erudaxis/presentation/utils/app_scaffold.dart';
import 'package:erudaxis/providers/auth/login_view_model.dart';
import 'package:erudaxis/providers/auth/validator_view_model.dart';
import 'package:erudaxis/widgets/auth/login_form.dart';
import 'package:erudaxis/widgets/auth/welcome_login.dart';
import 'package:erudaxis/widgets/splash_screen_component.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/styles/dimensions.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.school_outlined,
                                size: 34,
                                color: Color.fromARGB(255, 227, 151, 247),
                              ),
                              Dimensions.widthSmall,
                              Text(
                                intl.appName,
                                style: textTheme.displayLarge?.copyWith(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 2,
                                  shadows: [
                                    Shadow(
                                      color: SplashComponents.darkPurple
                                          .withOpacity(0.5),
                                      offset: const Offset(0, 2),
                                      blurRadius: 4,
                                    ),
                                  ],
                                ),
                              ),
                            ],
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
