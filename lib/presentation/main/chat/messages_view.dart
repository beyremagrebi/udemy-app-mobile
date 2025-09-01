import 'package:erudaxis/core/styles/dimensions.dart';
import 'package:erudaxis/presentation/utils/async/async_model_list_builder.dart';
import 'package:erudaxis/presentation/utils/session/token_manager.dart';
import 'package:erudaxis/providers/main/chat/messages_view_model.dart';
import 'package:erudaxis/widgets/shimmer/messages_shimmer.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../../models/base/base_chat.dart';
import '../../../widgets/main/chat/message_widget.dart';

class MessagesView extends StatelessWidget {
  final BaseChat chatRoom;
  const MessagesView({required this.chatRoom, super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MessagesViewModel(context, chatRoom: chatRoom),
      child: Consumer<MessagesViewModel>(
          builder: (context, viewModel, child) => AsyncModelListBuilder(
                viewModel: viewModel,
                models: viewModel.messages,
                onRefresh: viewModel.loadMessages,
                shimmer: MessageShimmer(),
                builder: (messages) => ListView.builder(
                  padding: Dimensions.paddingAllMedium,
                  itemCount: messages.length,
                  itemBuilder: (context, index) => MessageWidget(
                    message: messages[index],
                    isMe: messages[index].author?.id ==
                        TokenManager.extractIdFromToken(),
                  ),
                ),
              )),
    );
  }
}
