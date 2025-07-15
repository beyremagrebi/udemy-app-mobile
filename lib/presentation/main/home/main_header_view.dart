import 'package:erudaxis/core/config/media/api_image_widget.dart';
import 'package:erudaxis/core/constants/constant.dart';
import 'package:erudaxis/core/constants/env.dart';
import 'package:erudaxis/core/styles/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../interfaces/language/i_screen_with_localization.dart';
import '../../../providers/global/session_manager_view_model.dart';
import '../../../providers/main/profile/language/language_view_model.dart';

class MainHeaderView extends IScreenWithLocalization {
  const MainHeaderView({super.key});

  @override
  Widget buildLocalized(
      BuildContext context, LanguageViewModel languageViewModel) {
    return Consumer<SessionManager>(
      builder: (context, viewModel, child) {
        return Container(
          margin: Dimensions.horizontalPaddingLarge,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ApiImageWidget(
                    width: 38,
                    height: 38,
                    imageFileName: viewModel.user?.image,
                    imageNetworUrl:
                        '$baseURl/enterprise-${viewModel.user?.enterprise}/images',
                    border: Border.all(color: Colors.white, width: 1.2),
                    isProfilePicture: true,
                    isMen: viewModel.user?.isMen,
                  ),
                  Dimensions.widthMedium,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${intl.bonjour}, ${viewModel.user?.firstName?.toUpperCase()} 👋',
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
          ),
        );
      },
    );
  }
}
