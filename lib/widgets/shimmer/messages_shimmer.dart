import 'dart:math';

import 'package:erudaxis/core/styles/dimensions.dart';
import 'package:flutter/material.dart';

import 'base_shimmer.dart';

class MessageShimmer extends BaseShimmer {
  final Random _random = Random();

  MessageShimmer({super.key});

  @override
  Widget get child => ListView.builder(
        padding: Dimensions.paddingAllMedium,
        itemCount: 21,
        itemBuilder: (context, index) {
          bool isMe = index.isEven;
          if (index == 0 ||
              index == 1 ||
              index == 5 ||
              index == 11 ||
              index == 13 ||
              index == 7) {
            isMe = true;
          }

          return Align(
            alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
              constraints: const BoxConstraints(maxWidth: 250),
              padding: Dimensions.paddingAllMedium,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              width: 50 + _random.nextInt(120).toDouble(),
              height: 18,
            ),
          );
        },
      );
}
