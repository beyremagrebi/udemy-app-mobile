import 'package:erudaxis/core/config/media/api_image_widget.dart';
import 'package:erudaxis/core/constants/constant.dart';
import 'package:erudaxis/core/constants/env.dart';
import 'package:erudaxis/core/styles/dimensions.dart';
import 'package:erudaxis/presentation/utils/async/async_model_builder.dart';
import 'package:erudaxis/widgets/shimmer/main_header_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/global/session_manager_view_model.dart';

class MainHeaderView extends StatelessWidget {
  const MainHeaderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SessionManager>(
      builder: (context, viewModel, child) => Container(
        margin: Dimensions.horizontalPaddingLarge,
        child: AsyncModelBuilder(
          model: viewModel.user,
          viewModel: viewModel,
          shimmer: MainHeaderShimmer(),
          builder: (user) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    ApiImageWidget(
                      width: 38,
                      height: 38,
                      imageFileName: user.image,
                      imageNetworUrl: baseURl,
                      border: Border.all(color: Colors.amber, width: 1.4),
                      isProfilePicture: true,
                      isMen: true,
                      fit: BoxFit.cover,
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
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Dimensions.heightSmall,
              ],
            );
          },
        ),
      ),
    );
  }
}
