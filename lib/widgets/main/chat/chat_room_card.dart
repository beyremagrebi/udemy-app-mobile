import 'package:erudaxis/core/config/media/api_image_widget.dart';
import 'package:erudaxis/core/config/media/asset_image_widget.dart';
import 'package:erudaxis/core/constants/assets.dart';
import 'package:erudaxis/core/constants/constant.dart';
import 'package:erudaxis/core/constants/env.dart';
import 'package:erudaxis/core/styles/dimensions.dart';
import 'package:erudaxis/interfaces/language/i_screen_with_localization.dart';
import 'package:erudaxis/models/base/base_chat.dart';
import 'package:erudaxis/models/global/user.dart';
import 'package:erudaxis/presentation/main/chat/chat_view_details.dart';
import 'package:erudaxis/presentation/utils/navigator_utils.dart';
import 'package:erudaxis/presentation/utils/session/facility_manager.dart';
import 'package:erudaxis/presentation/utils/session/token_manager.dart';
import 'package:erudaxis/providers/global/notification_view_model.dart';
import 'package:erudaxis/providers/main/chat/typing_listener_view_model.dart';
import 'package:erudaxis/providers/main/profile/language/language_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'typing_indecator_widget.dart';

class ChatRoomCard extends IScreenWithLocalization {
  final BaseChat chatRoom;

  const ChatRoomCard({
    required this.chatRoom,
    super.key,
  });

  @override
  Widget buildLocalized(
      BuildContext context, LanguageViewModel languageViewModel) {
    User? user;
    if (chatRoom.users != null && chatRoom.users!.isNotEmpty) {
      user = chatRoom.users!.firstWhere(
        (u) => u.id != TokenManager.extractIdFromToken(),
        orElse: () => chatRoom.users!.firstWhere(
          (u) => u.id == TokenManager.extractIdFromToken(),
        ),
      );
    }

    return Card(
      clipBehavior: Clip.hardEdge,
      elevation: 0,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            navigateTo(
              context,
              ChatViewDetails(
                chatRoom: chatRoom,
              ),
            );
          },
          child: Container(
            padding: Dimensions.paddingAllSmall,
            child: Row(
              children: [
                if (chatRoom.isGroupChat ?? false)
                  AssetsImageWidget(
                    imageFileName: Assets.defaultMaleAvatar,
                    height: 45,
                    width: 45,
                    border: Border.all(color: Colors.white, width: 1.2),
                    isProfilePicture: true,
                  )
                else
                  ApiImageWidget(
                    imageFileName: user?.image,
                    height: 45,
                    hasImageView: true,
                    border: Border.all(color: Colors.white, width: 1.2),
                    width: 45,
                    imageNetworUrl:
                        '$baseURl/enterprise-${FacilityManager.facility.enterprise?.id}/images/',
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
                              (chatRoom.isGroupChat ?? false)
                                  ? chatRoom.name ?? ''
                                  : '${user?.firstName ?? ''} ${user?.lastName ?? ''}',
                              style: textTheme.titleSmall,
                            ),
                          ),
                          Text(
                            chatRoom.lastMessage != null &&
                                    chatRoom.lastMessage?.createdAt != null
                                ? timeago.format(
                                    chatRoom.lastMessage?.createdAt! is DateTime
                                        ? chatRoom.lastMessage!.createdAt!
                                        : DateTime.parse(chatRoom
                                            .lastMessage!.createdAt!
                                            .toString()),
                                    locale: languageViewModel.locale.toString(),
                                  )
                                : intl.error,
                            style: textTheme.labelSmall?.copyWith(
                              color: Colors.white70,
                            ),
                          ),
                          Dimensions.widthxSmall,
                          Consumer<NotificationViewModel>(
                            builder: (context, viewModel, child) => Visibility(
                              visible: viewModel.roomChatCounts[chatRoom.id] !=
                                      0 &&
                                  viewModel.roomChatCounts[chatRoom.id] != null,
                              child: Container(
                                padding: Dimensions.horizontalPaddingxSmall,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.red,
                                ),
                                child: Text(
                                  viewModel.roomChatCounts[chatRoom.id]
                                      .toString(),
                                  style: textTheme.labelSmall?.copyWith(
                                    color: Colors.white70,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Consumer2<TypingListenerViewModel,
                              NotificationViewModel>(
                            builder: (context, viewModel, notificationViewModel,
                                    child) =>
                                Expanded(
                              child: viewModel.typingUsers
                                      .containsKey(chatRoom.id.toString())
                                  ? Padding(
                                      padding: Dimensions.verticalPaddingxSmall,
                                      child: const TypingIndecatorWidget(),
                                    )
                                  : Text(
                                      notificationViewModel
                                              .roomChatLatestMessage[
                                                  chatRoom.id ?? '']
                                              ?.message ??
                                          (chatRoom.lastMessage?.message ??
                                              intl.error),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: textTheme.labelMedium?.copyWith(
                                          color: notificationViewModel.roomChatCounts[chatRoom.id ?? ''] != 0 &&
                                                  notificationViewModel.roomChatCounts[
                                                          chatRoom.id ?? ''] !=
                                                      null
                                              ? Colors.white
                                              : Colors.white70,
                                          fontWeight: notificationViewModel
                                                              .roomChatCounts[
                                                          chatRoom.id ?? ''] !=
                                                      0 &&
                                                  notificationViewModel
                                                          .roomChatCounts[chatRoom.id ?? ''] !=
                                                      null
                                              ? FontWeight.w900
                                              : null),
                                    ),
                            ),
                          ),
                          Dimensions.widthMedium,
                          if (chatRoom.isGroupChat ?? false) ...[
                            const Icon(
                              Icons.people_alt_outlined,
                              size: 18,
                              color: Colors.white70,
                            ),
                            Dimensions.widthxSmall,
                            Padding(
                              padding: Dimensions.horizontalPaddingxSmall,
                              child: Text(
                                '${chatRoom.users?.length ?? 0}',
                                style: textTheme.labelSmall?.copyWith(
                                  color: Colors.white70,
                                ),
                              ),
                            ),
                          ],
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
