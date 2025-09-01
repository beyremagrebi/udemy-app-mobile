import 'package:erudaxis/core/config/media/asset_image_widget.dart';
import 'package:erudaxis/core/constants/assets.dart';
import 'package:erudaxis/core/constants/constant.dart';
import 'package:erudaxis/core/styles/dimensions.dart';
import 'package:erudaxis/presentation/main/chat/chat_view_details.dart';
import 'package:erudaxis/presentation/utils/navigator_utils.dart';
import 'package:flutter/material.dart';

class ChatRoomCard extends StatelessWidget {
  const ChatRoomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      elevation: 0,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            navigateTo(context, const ChatViewDetails());
          },
          child: Container(
            padding: Dimensions.paddingAllSmall,
            child: Row(
              children: [
                const AssetsImageWidget(
                  imageFileName: Assets.defaultMaleAvatar,
                  height: 45,
                  width: 45,
                  isProfilePicture: true,
                ),
                Dimensions.widthSmall,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Beyrem agrbei',
                              style: textTheme.titleSmall,
                            ),
                          ),
                          Text(
                            '14:00',
                            style: textTheme.labelSmall?.copyWith(
                              color: Colors.white70,
                            ),
                          ),
                          Dimensions.widthxSmall,
                          Container(
                            padding: Dimensions.horizontalPaddingxSmall,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.red,
                            ),
                            child: Text(
                              '2',
                              style: textTheme.labelSmall?.copyWith(
                                color: Colors.white70,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'ahla bik cv ahla bik cv ahla bik cv ahla bik cv ahla bik cv ahla bik cv ahla bik cv',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: textTheme.labelMedium
                                  ?.copyWith(color: Colors.white70),
                            ),
                          ),
                          Dimensions.widthMedium,
                          const Icon(
                            Icons.people_alt_outlined,
                            size: 18,
                            color: Colors.white70,
                          ),
                          Dimensions.widthxSmall,
                          Padding(
                            padding: Dimensions.horizontalPaddingxSmall,
                            child: Text(
                              '4',
                              style: textTheme.labelSmall?.copyWith(
                                color: Colors.white70,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
