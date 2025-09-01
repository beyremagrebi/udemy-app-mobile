import 'package:erudaxis/core/config/media/asset_image_widget.dart';
import 'package:erudaxis/core/constants/assets.dart';
import 'package:erudaxis/core/constants/constant.dart';
import 'package:erudaxis/core/styles/dimensions.dart';
import 'package:erudaxis/models/base/base_chat.dart';
import 'package:erudaxis/presentation/main/chat/messages_view.dart';
import 'package:erudaxis/presentation/utils/app_bar_gradient.dart';
import 'package:erudaxis/presentation/utils/app_scaffold.dart';
import 'package:erudaxis/widgets/common/form/input_text.dart';
import 'package:erudaxis/widgets/common/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

import '../../../models/global/user.dart';
import '../../utils/session/token_manager.dart';

class ChatViewDetails extends StatelessWidget {
  final BaseChat chatRoom;
  const ChatViewDetails({required this.chatRoom, super.key});

  @override
  Widget build(BuildContext context) {
    User? user;
    if (chatRoom.users != null && chatRoom.users!.isNotEmpty) {
      user = chatRoom.users!.firstWhere(
        (u) => u.id != TokenManager.extractIdFromToken(),
        orElse: () => chatRoom.users!.firstWhere(
          (u) => u.id == TokenManager.extractIdFromToken(),
        ),
      );
    }
    return AppScaffold(
      appBar: AppBarGradient(
        title: Row(
          children: [
            const AssetsImageWidget(
              imageFileName: Assets.defaultMaleAvatar,
              height: 35,
              width: 35,
              isProfilePicture: true,
            ),
            Dimensions.widthSmall,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  (chatRoom.isGroupChat ?? false)
                      ? chatRoom.name ?? ''
                      : '${user?.firstName ?? ''} ${user?.lastName ?? ''}',
                  style: textTheme.titleSmall,
                ),
                Text(
                  'En ligne',
                  style: textTheme.labelSmall?.copyWith(
                    color: Colors.white70,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: MessagesView(
            chatRoom: chatRoom,
          )),
          Card(
            elevation: 0,
            shape: const RoundedRectangleBorder(),
            child: Padding(
              padding: Dimensions.paddingAllxSmall,
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Symbols.attach_file_add_rounded)),
                  const Expanded(
                    flex: 5,
                    child: InputText(
                      hintText: 'Send message',
                    ),
                  ),
                  Dimensions.widthMedium,
                  const Expanded(child: GradientButton())
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
