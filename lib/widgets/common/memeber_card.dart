import 'package:erudaxis/core/styles/dimensions.dart';
import 'package:erudaxis/models/global/user.dart';
import 'package:erudaxis/presentation/utils/session/facility_manager.dart';
import 'package:flutter/material.dart';

import '../../core/config/media/api_image_widget.dart';
import '../../core/constants/constant.dart';
import '../../core/constants/env.dart';

class MemberCard extends StatelessWidget {
  final User user;

  const MemberCard({
    required this.user,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: Dimensions.s),
      child: Container(
        padding: Dimensions.paddingAllSmall,
        child: Row(
          children: [
            ApiImageWidget(
              height: 35,
              width: 35,
              hasImageView: true,
              imageNetworUrl:
                  '$baseURl/enterprise-${FacilityManager.facility.enterprise?.id}/images',
              isMen: user.isMen,
              imageFileName: user.image,
              isProfilePicture: true,
            ),
            Dimensions.widthSmall,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${user.firstName} ${user.lastName}',
                    style: textTheme.titleSmall,
                  ),
                  Text(
                    user.role?.localizedName().toUpperCase() ?? intl.error,
                    style: textTheme.labelSmall?.copyWith(
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.more_vert_outlined,
              size: 16,
            )
          ],
        ),
      ),
    );
  }
}
