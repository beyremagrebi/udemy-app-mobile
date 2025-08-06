import 'package:flutter/material.dart';

import '../../core/styles/dimensions.dart';
import 'base_shimmer.dart';

class NotificationCardShimmer extends BaseShimmer {
  NotificationCardShimmer({super.key});

  @override
  Widget get child => ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        padding: Dimensions.paddingAllMedium,
        separatorBuilder: (context, index) => Dimensions.heightSmall,
        itemCount: 3,
        itemBuilder: (context, index) => Card(
          elevation: 0,
          child: Container(
            padding: Dimensions.paddingAllSmall,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 40,
                  height: 40,
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
                        width: double.infinity,
                        height: 16,
                        color: Colors.white,
                      ),
                      Dimensions.heightSmall,
                      Container(
                        width: double.infinity,
                        height: 12,
                        color: Colors.white,
                      ),
                      Dimensions.heightSmall,
                      Container(
                        width: 80,
                        height: 12,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                Dimensions.widthSmall,
                Container(
                  width: 15,
                  height: 15,
                  color: Colors.white,
                )
              ],
            ),
          ),
        ),
      );
}
