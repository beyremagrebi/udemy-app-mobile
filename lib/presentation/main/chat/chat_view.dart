import 'package:erudaxis/core/constants/constant.dart';
import 'package:erudaxis/core/styles/dimensions.dart';
import 'package:erudaxis/presentation/utils/async/async_model_list_builder.dart';
import 'package:erudaxis/providers/main/chat/chat_view_model.dart';
import 'package:erudaxis/widgets/common/app_filtre_chip.dart';
import 'package:erudaxis/widgets/common/form/input_text.dart';
import 'package:erudaxis/widgets/common/gradient_app_bar_widget.dart';
import 'package:erudaxis/widgets/main/chat/chat_room_card.dart';
import 'package:erudaxis/widgets/shimmer/chat_room_card_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ChatViewModel.new,
      child: Consumer<ChatViewModel>(
        builder: (context, viewModel, child) => Column(
          children: [
            GradientAppBarWidget(
              child: Container(
                padding: Dimensions.horizontalPaddingMedium,
                margin: const EdgeInsets.only(bottom: Dimensions.s),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Messages',
                      style: textTheme.titleMedium,
                    ),
                    const InputText(
                      hintText: 'Recherche',
                      onTapOutside: false,
                    ),
                    Dimensions.heightSmall,
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          AppFilterChip(
                            label: 'Private',
                            selected: viewModel.privateScreen,
                            onTap: () {
                              viewModel.toggleScreen();
                            },
                          ),
                          AppFilterChip(
                            label: 'Groupe',
                            selected: !viewModel.privateScreen,
                            onTap: () {
                              viewModel.toggleScreen(isPrivate: false);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                child: AsyncModelListBuilder(
              viewModel: viewModel,
              models: viewModel.chatRooms,
              onRefresh: viewModel.loadChats,
              shimmer: ChatRoomShimmer(),
              builder: (rooms) => ListView.separated(
                padding: Dimensions.paddingAllMedium,
                itemBuilder: (context, index) => ChatRoomCard(
                  chatRoom: rooms[index],
                ),
                separatorBuilder: (context, index) => Dimensions.heightSmall,
                itemCount: rooms.length,
              ),
            )),
          ],
        ),
      ),
    );
  }
}
