import 'package:erudaxis/core/styles/dimensions.dart';
import 'package:flutter/material.dart';

import 'base_shimmer.dart';

class SubjectCardShimmer extends BaseShimmer {
  SubjectCardShimmer({super.key});

  @override
  Widget get child => ListView.separated(
        padding: Dimensions.paddingAllMedium,
        itemCount: 5, // Number of shimmer cards
        separatorBuilder: (context, index) => Dimensions.heightSmall,
        itemBuilder: (context, index) => Card(
          clipBehavior: Clip.hardEdge,
          elevation: 0,
          child: Padding(
            padding: Dimensions.paddingAllSmall,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Icon placeholder
                Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: Dimensions.xsmallBorderRadius,
                  ),
                ),
                Dimensions.widthSmall,
                // Text placeholders
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title
                      Container(
                        height: 14,
                        width: double.infinity,
                        color: Colors.grey[300],
                      ),
                      Dimensions.heightxSmall,
                      // Subtitle
                      Container(
                        height: 12,
                        width: 150,
                        color: Colors.grey[300],
                      ),
                      Dimensions.heightSmall,
                      // Description
                      Container(
                        height: 10,
                        width: double.infinity,
                        color: Colors.grey[300],
                      ),
                      Dimensions.heightxSmall,
                      Container(
                        height: 10,
                        width: double.infinity,
                        color: Colors.grey[300],
                      ),
                    ],
                  ),
                ),
                Dimensions.widthSmall,
                // More icon placeholder
                Container(
                  height: 20,
                  width: 20,
                  color: Colors.grey[300],
                ),
              ],
            ),
          ),
        ),
      );
}
