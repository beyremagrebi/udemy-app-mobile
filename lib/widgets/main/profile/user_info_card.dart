import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/config/media/api_image_widget.dart';
import '../../../core/constants/constant.dart';
import '../../../core/constants/env.dart';
import '../../../core/styles/dimensions.dart';
import '../../../providers/global/session_manager_view_model.dart';

class UserInfoCard extends StatelessWidget {
  const UserInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(
        right: Dimensions.m,
        left: Dimensions.m,
        bottom: Dimensions.m,
      ),
      child: Container(
        padding: Dimensions.paddingAllSmall,
        child: Consumer<SessionManager>(
          builder: (context, viewModel, child) {
            return Row(
              children: [
                ApiImageWidget(
                  height: 60,
                  width: 60,
                  imageFileName: viewModel.user?.image,
                  imageNetworUrl: baseURl,
                  isProfilePicture: true,
                ),
                Dimensions.widthMedium,
                Padding(
                  padding: Dimensions.verticalPaddingSmall,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${viewModel.user?.firstName} ${viewModel.user?.lastName}',
                        style: textTheme.bodyMedium?.copyWith(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '1c12',
                        style: textTheme.bodyMedium?.copyWith(
                          fontSize: 11,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Lycée Victor Hugo • Terminale S',
                        style: textTheme.bodyMedium?.copyWith(
                          fontSize: 11,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
