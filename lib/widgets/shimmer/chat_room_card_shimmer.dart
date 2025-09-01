import 'package:erudaxis/core/styles/dimensions.dart';
import 'package:flutter/material.dart';

import 'base_shimmer.dart';

class ChatRoomShimmer extends BaseShimmer {
  ChatRoomShimmer({super.key});
  @override
  Widget get child => ListView.separated(
        padding: Dimensions.paddingAllMedium,
        itemCount: 3,
        separatorBuilder: (context, index) => Dimensions.heightSmall,
        itemBuilder: (context, index) => Card(
          clipBehavior: Clip.hardEdge,
          elevation: 0,
          child: Container(
            padding: Dimensions.paddingAllSmall,
            child: Row(
              children: [
                Container(
                  height: 45,
                  width: 45,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
                Dimensions.widthSmall,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 14,
                        width: 120,
                        color: Colors.white,
                        margin: const EdgeInsets.only(bottom: 6),
                      ),
                      // Second row: last message + group info
                      Container(
                        height: 12,
                        width: 200,
                        color: Colors.white,
                        margin: const EdgeInsets.only(top: 4),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
