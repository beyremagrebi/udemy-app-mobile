import 'package:erudaxis/core/config/media/asset_image_widget.dart';
import 'package:erudaxis/core/constants/assets.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/constant.dart';
import '../../../core/styles/dimensions.dart';
import '../../utils/limited_list_view.dart';

class InstructorsListView extends StatelessWidget {
  const InstructorsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return LimitedListView(
        separator: Dimensions.heightSmall,
        children: [
          _buildMemberCard(),
          _buildMemberCard(),
          _buildMemberCard(),
          _buildMemberCard(),
        ],
        itemHeight: 55,
        separatorHeight: Dimensions.s);
  }

  Widget _buildMemberCard() {
    return Card(
      elevation: 0,
      child: Container(
        padding: Dimensions.paddingAllSmall,
        child: Row(
          children: [
            const AssetsImageWidget(
              height: 35,
              width: 35,
              hasImageView: true,
              imageFileName: Assets.defaultMaleAvatar,
              isProfilePicture: true,
            ),
            Dimensions.widthSmall,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'beyrem agrebi',
                    style: textTheme.titleSmall,
                  ),
                  Text(
                    'instructor'.toUpperCase(),
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
