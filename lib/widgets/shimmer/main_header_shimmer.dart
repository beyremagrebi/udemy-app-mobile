import 'package:erudaxis/widgets/shimmer/base_shimmer.dart';
import 'package:flutter/material.dart';

import '../../core/styles/dimensions.dart';

class MainHeaderShimmer extends BaseShimmer {
  MainHeaderShimmer({super.key});

  @override
  Widget get child => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 35,
                height: 35,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
              Dimensions.widthMedium,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 18,
                      width: 200,
                      color: Colors.white,
                    ),
                    Dimensions.heightSmall,
                    Container(
                      height: 11,
                      width: 150,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Dimensions.heightSmall,
        ],
      );
}
