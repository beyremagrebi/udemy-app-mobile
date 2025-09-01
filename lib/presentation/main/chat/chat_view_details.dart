import 'package:erudaxis/core/config/media/asset_image_widget.dart';
import 'package:erudaxis/core/constants/assets.dart';
import 'package:erudaxis/core/constants/constant.dart';
import 'package:erudaxis/core/styles/dimensions.dart';
import 'package:erudaxis/presentation/main/chat/messages_view.dart';
import 'package:erudaxis/presentation/utils/app_bar_gradient.dart';
import 'package:erudaxis/presentation/utils/app_scaffold.dart';
import 'package:erudaxis/widgets/common/form/input_text.dart';
import 'package:erudaxis/widgets/common/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

class ChatViewDetails extends StatelessWidget {
  const ChatViewDetails({super.key});

  @override
  Widget build(BuildContext context) {
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
                  'Beyrem agrbei',
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
          const Expanded(child: MessagesView()),
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
