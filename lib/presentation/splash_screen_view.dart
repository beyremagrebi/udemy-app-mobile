import 'package:erudaxis/core/styles/dimensions.dart';
import 'package:erudaxis/providers/splash_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/splash_screen_component.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: SplashScreenViewModel.new,
        child: Consumer<SplashScreenViewModel>(
          builder: (context, viewModel, child) {
            if (!viewModel.isInitialized) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                viewModel.initialize(this);
              });
            }

            if (viewModel.shouldNavigate) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                viewModel.onAnimationComplete(context);
              });
            }

            return Stack(
              children: [
                SplashComponents.buildBackground(context, viewModel: viewModel),
                SplashComponents.buildBackgroundEffects(context,
                    viewModel: viewModel),
                SafeArea(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Spacer(flex: 2),
                        SplashComponents.buildAnimatedLogo(context,
                            viewModel: viewModel),
                        Dimensions.heightHuge,
                        SplashComponents.buildAnimatedText(context,
                            viewModel: viewModel),
                        const Spacer(flex: 2),
                        SplashComponents.buildLoadingIndicator(context,
                            viewModel: viewModel),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
