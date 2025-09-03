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
      builder: (messages) => ListView.builder(
        reverse: true,
        padding: Dimensions.paddingAllMedium,
        itemCount: messages.length,
        itemBuilder: (context, index) => MessageWidget(
          message: messages[index],
          isMe: messages[index].author?.id == TokenManager.extractIdFromToken(),
        ),
      ),
    );
  }
}
