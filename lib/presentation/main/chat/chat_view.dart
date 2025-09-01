import 'package:erudaxis/core/styles/dimensions.dart';
import 'package:erudaxis/widgets/common/app_filtre_chip.dart';
import 'package:erudaxis/widgets/common/form/input_text.dart';
import 'package:erudaxis/widgets/common/gradient_app_bar_widget.dart';
import 'package:erudaxis/widgets/main/chat/chat_room_card.dart';
import 'package:flutter/material.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GradientAppBarWidget(
          child: Container(
            padding: Dimensions.horizontalPaddingMedium,
            margin: const EdgeInsets.only(bottom: Dimensions.s),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Messages'),
                Dimensions.heightSmall,
                const InputText(
                  hintText: 'Recherche',
                ),
                Dimensions.heightSmall,
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      AppFilterChip(
                        label: 'Private',
                        selected: true,
                        onTap: () {},
                      ),
                      AppFilterChip(
                        label: 'Groupe',
                        selected: false,
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: ListView.separated(
            padding: Dimensions.paddingAllMedium,
            itemBuilder: (context, index) => const ChatRoomCard(),
            separatorBuilder: (context, index) => Dimensions.heightSmall,
            itemCount: 5,
          ),
        ),
      ],
    );
  }
}
