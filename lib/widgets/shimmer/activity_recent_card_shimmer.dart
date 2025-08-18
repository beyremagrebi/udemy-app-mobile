import 'package:flutter/material.dart';

import '../../core/styles/dimensions.dart';
import 'base_shimmer.dart';

class ActivityRecentCardShimmer extends BaseShimmer {
  ActivityRecentCardShimmer({super.key});

  @override
  Widget get child => ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        separatorBuilder: (context, index) => Dimensions.heightSmall,
        itemCount: 3,
        itemBuilder: (context, index) => Card(
          elevation: 0,
          child: Container(
            padding: Dimensions.paddingAllSmall,
            child: Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                Dimensions.widthSmall,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 120,
                        height: 11,
                        color: Colors.white,
                      ),
                      Dimensions.heightxSmall,
                      Container(
                        width: 70,
                        height: 10,
                        color: Colors.white,
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
