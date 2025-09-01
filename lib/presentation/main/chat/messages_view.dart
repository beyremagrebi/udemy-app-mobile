import 'package:erudaxis/core/styles/dimensions.dart';
import 'package:flutter/widgets.dart';

import '../../../widgets/main/chat/message_widget.dart';

class MessagesView extends StatelessWidget {
  const MessagesView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: Dimensions.paddingAllMedium,
      children: const [
        MessageWidget(
          message: 'ahla bik',
          isMe: false,
        ),
        MessageWidget(
          message: 'cv',
          isMe: false,
        ),
        MessageWidget(
          message: 'hello world',
          isMe: true,
        ),
        MessageWidget(
          message: 'chniya lomour',
          isMe: true,
        ),
        MessageWidget(
          message: 'tout va bien',
          isMe: false,
        ),
      ],
    );
  }
}
