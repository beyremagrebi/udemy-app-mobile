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
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          child: Container(
            padding: Dimensions.paddingAllSmall,
            child: Consumer<SessionManager>(
              builder: (context, viewModel, child) {
                return Row(
                  children: [
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        ApiImageWidget(
                          height: 60,
                          width: 60,
                          imageFileName: viewModel.user?.image,
                          isMen: viewModel.user?.isMen,
                          border: Border.all(color: Colors.white, width: 1.2),
                          imageNetworUrl: baseURl,
                          isProfilePicture: true,
                        ),
                        Container(
                          padding: Dimensions.paddingAllxSmall,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.edit_square,
                            size: 14,
                            color: Colors.black54,
                          ),
                        )
                      ],
                    ),
                    Dimensions.widthMedium,
                    Expanded(
                      child: Padding(
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
                      ),
                    ),
                    const Icon(
                      Icons.navigate_next,
                      color: Colors.white,
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
