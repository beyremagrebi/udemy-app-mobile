import 'package:erudaxis/core/config/media/api_image_widget.dart';
import 'package:erudaxis/core/constants/env.dart';
import 'package:erudaxis/core/styles/dimensions.dart';
import 'package:erudaxis/presentation/utils/async/async_model_builder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/global/session_manager_view_model.dart';

class MainHeaderWidget extends StatelessWidget {
  const MainHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Consumer<SessionManager>(
      builder: (context, viewModel, child) => Container(
        margin: Dimensions.horizontalPaddingLarge,
        child: AsyncModelBuilder(
          model: viewModel.user,
          viewModel: viewModel,
          builder: (user) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    ApiImageWidget(
                      width: 45,
                      height: 45,
                      imageFileName: user.image,
                      imageNetworUrl: baseURl,
                      isProfilePicture: true,
                      isMen: true,
                      fit: BoxFit.contain,
                    ),
                    Dimensions.widthMedium,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Bonjour, ${user.firstName?.toUpperCase()} 👋',
                            style: textTheme.titleLarge?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Dimensions.widthSmall,
                          Text(
                            'Lycée Victor Hugo • Terminale S',
                            style: textTheme.bodyMedium?.copyWith(
                              color: Colors.white.withOpacity(0.92),
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Dimensions.heightMedium,
              ],
            );
          },
        ),
      ),
    );
  }
}
