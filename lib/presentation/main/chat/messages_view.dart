import 'package:erudaxis/core/styles/dimensions.dart';
import 'package:erudaxis/presentation/utils/async/async_model_list_builder.dart';
import 'package:erudaxis/presentation/utils/session/token_manager.dart';
import 'package:erudaxis/providers/main/chat/messages_view_model.dart';
import 'package:erudaxis/widgets/shimmer/messages_shimmer.dart';
import 'package:flutter/widgets.dart';

import '../../../models/base/base_chat.dart';
import '../../../widgets/main/chat/message_widget.dart';

class MessagesView extends StatelessWidget {
  final BaseChat chatRoom;
  final MessagesViewModel viewModel;

  const MessagesView(
      {required this.chatRoom, required this.viewModel, super.key});

  @override
  Widget build(BuildContext context) {
    return AsyncModelListBuilder(
      viewModel: viewModel,
      models: viewModel.messages,
      onRefresh: viewModel.loadMessages,
      shimmer: MessageShimmer(),
      builder: (messages) => AnimatedList(
        key: viewModel.listKey, // attach key
        reverse: true,
        padding: Dimensions.paddingAllMedium,
        initialItemCount: messages.length,
        itemBuilder: (context, index, animation) {
          final message = messages[index];
          final nextMessage = index - 1 >= 0 ? messages[index - 1] : null;

          final showAvatar = nextMessage == null ||
              nextMessage.author?.id != message.author?.id;
          return SizeTransition(
            sizeFactor: animation,
            axisAlignment: -1,
            child: MessageWidget(
              message: message,
              isGroup: chatRoom.isGroupChat ?? false,
              isMe: message.author?.id == TokenManager.extractIdFromToken(),
              showAvatar: showAvatar,
            ),
          );
        },
      ),
    );
  }
}
