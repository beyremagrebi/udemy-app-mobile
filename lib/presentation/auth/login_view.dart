import 'package:erudaxis/core/config/media/asset_image_widget.dart';
import 'package:erudaxis/core/constants/assets.dart';
import 'package:erudaxis/presentation/main/main_view.dart';
import 'package:erudaxis/presentation/utils/app_scaffold.dart';
import 'package:erudaxis/presentation/utils/navigator_utils.dart';
import 'package:erudaxis/providers/auth/login_view_model.dart';
import 'package:erudaxis/widgets/common/form/input_text.dart';
import 'package:erudaxis/widgets/common/gradient_button.dart';
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
                  height: 400,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 0.4),
                    borderRadius: Dimensions.smallBorderRadius,
                  ),
                  child: Card(
                      elevation: 0,
                      child: Padding(
                        padding: Dimensions.paddingAllMedium,
                        child: Column(
                          children: [
                            const AssetsImageWidget(
                              imageFileName: Assets.defaultMaleAvatar,
                            ),
                            Dimensions.heightMedium,
                            const Text(
                              'Content de vous revoir !',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const Text(
                              'Connectez-vous pour continuer',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white70,
                              ),
                            ),
                            Dimensions.heightMedium,
                            const InputText(
                              hintText: 'Enter email',
                              prefixIcon: Icon(
                                Icons.email_outlined,
                                color: Colors.grey,
                                size: 20,
                              ),
                            ),
                            Dimensions.heightMedium,
                            InputText(
                              hintText: 'Enter password',
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: viewModel.securePassword,
                              suffixIcon: IconButton(
                                onPressed: () {
                                  viewModel.toggleVisibility();
                                },
                                icon: const Icon(
                                  Icons.visibility_outlined,
                                  size: 20,
                                  color: Colors.grey,
                                ),
                              ),
                              prefixIcon: const Icon(
                                Icons.lock_outlined,
                                size: 20,
                                color: Colors.grey,
                              ),
                            ),
                            const Expanded(child: Dimensions.heightMedium),
                            GradientButton(
                              width: double.maxFinite,
                              text: 'Login',
                              onPressed: () {
                                navigateTo(context, const MainView());
                              },
                            )
                          ],
                        ),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
