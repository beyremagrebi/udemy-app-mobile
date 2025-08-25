import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/config/media/api_image_widget.dart';
import '../../../core/constants/constant.dart';
import '../../../core/constants/env.dart';
import '../../../core/styles/dimensions.dart';
import '../../../presentation/main/profile/update/update_profile_view.dart';
import '../../../presentation/utils/async/async_model_builder.dart';
import '../../../presentation/utils/navigator_utils.dart';
import '../../../presentation/utils/session/facility_manager.dart';
import '../../../providers/global/session_manager_view_model.dart';

class DrawerHeaderWidget extends StatelessWidget {
  const DrawerHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          navigateTo(context, const UpdateProfileView());
        },
        child: Consumer<SessionManager>(
          builder: (context, viewModel, child) {
            return Card(
              elevation: 0,
              child: Container(
                padding: Dimensions.paddingAllSmall,
                child: Row(
                  children: [
                    ApiImageWidget(
                      height: 50,
                      width: 50,
                      imageFileName: viewModel.user?.image,
                      hasImageView: true,
                      isMen: viewModel.user?.isMen,
                      border: Border.all(color: Colors.white, width: 1.2),
                      imageNetworUrl:
                          '$baseURl/enterprise-${viewModel.user?.enterprise}/images',
                      isProfilePicture: true,
                    ),
                    Dimensions.widthMedium,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${viewModel.user?.firstName} ${viewModel.user?.lastName}',
                            style: textTheme.bodyMedium?.copyWith(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          AsyncModelBuilder(
                            viewModel: viewModel,
                            model: viewModel.facility,
                            shimmer: const SizedBox.shrink(),
                            builder: (model) => Text(
                              FacilityManager.facility.name?.toUpperCase() ??
                                  '',
                              style: textTheme.labelSmall?.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Icon(
                      Icons.navigate_next,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
