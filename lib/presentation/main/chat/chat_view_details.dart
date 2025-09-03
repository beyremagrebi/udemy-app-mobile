import 'package:erudaxis/core/config/media/api_image_widget.dart';
import 'package:erudaxis/core/config/media/asset_image_widget.dart';
import 'package:erudaxis/core/constants/assets.dart';
import 'package:erudaxis/core/constants/constant.dart';
import 'package:erudaxis/core/constants/env.dart';
import 'package:erudaxis/core/styles/dimensions.dart';
import 'package:erudaxis/models/base/base_chat.dart';
import 'package:erudaxis/presentation/main/chat/messages_view.dart';
import 'package:erudaxis/presentation/utils/app_bar_gradient.dart';
import 'package:erudaxis/presentation/utils/app_scaffold.dart';
import 'package:erudaxis/presentation/utils/session/facility_manager.dart';
import 'package:erudaxis/providers/main/chat/messages_view_model.dart';
import 'package:erudaxis/providers/main/chat/typing_listener_view_model.dart';
import 'package:erudaxis/providers/main/profile/language/language_view_model.dart';
import 'package:erudaxis/widgets/common/form/input_text.dart';
import 'package:erudaxis/widgets/common/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:provider/provider.dart';

import '../../../interfaces/language/i_screen_with_localization.dart';
import '../../../models/global/user.dart';
import '../../../widgets/main/chat/typing_indecator_widget.dart';
import '../../utils/session/token_manager.dart';

class ChatViewDetails extends IScreenWithLocalization {
  final BaseChat chatRoom;

  const ChatViewDetails({
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
    return AppScaffold(
      appBar: AppBarGradient(
        title: Row(
          children: [
            if (chatRoom.isGroupChat ?? false)
              const AssetsImageWidget(
                imageFileName: Assets.defaultMaleAvatar,
                height: 35,
                width: 35,
                isProfilePicture: true,
              )
            else
              ApiImageWidget(
                imageFileName: user?.image,
                imageNetworUrl:
                    '$baseURl/enterprise-${FacilityManager.facility.enterprise?.id}/images/',
                height: 35,
                width: 35,
                hasImageView: true,
                isMen: user?.isMen,
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
      body: ChangeNotifierProvider(
        create: (context) => MessagesViewModel(context, chatRoom: chatRoom),
        child: Consumer<MessagesViewModel>(
          builder: (context, messagesViewModel, child) => Column(
            children: [
              Expanded(
                child: Consumer<TypingListenerViewModel>(
                  builder: (context, viewModel, child) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: MessagesView(
                          chatRoom: chatRoom,
                          viewModel: messagesViewModel,
                        ),
                      ),
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        transitionBuilder: (child, animation) {
                          return SizeTransition(
                            sizeFactor: animation,
                            axisAlignment: -1,
                            child: FadeTransition(
                                opacity: animation, child: child),
                          );
                        },
                        child: viewModel.typingUsers
                                .containsKey(chatRoom.id.toString())
                            ? Card(
                                key: const ValueKey('typingCard'),
                                margin: const EdgeInsets.symmetric(
                                  horizontal: Dimensions.l,
                                  vertical: Dimensions.s,
                                ),
                                elevation: 0,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(16),
                                    topRight: Radius.circular(16),
                                    bottomRight: Radius.circular(16),
                                  ),
                                ),
                                child: Container(
                                  padding: Dimensions.paddingAllMedium,
                                  child: const TypingIndecatorWidget(),
                                ),
                              )
                            : const SizedBox.shrink(key: ValueKey('empty')),
                      ),
                    ],
                  ),
                ),
              ),
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
                      Expanded(
                        flex: 5,
                        child: InputText(
                          controller: messagesViewModel.controller,
                          hintText: 'Send message',
                          onSubmitted: (value) =>
                              messagesViewModel.sendMessage(),
                          onChanged: (value) {
                            messagesViewModel.typingMessage();
                          },
                        ),
                      ),
                      Dimensions.widthMedium,
                      Expanded(
                          child: GradientButton(
                        onPressed: messagesViewModel.sendMessage,
                      ))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
