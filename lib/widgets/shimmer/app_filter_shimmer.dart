import 'package:erudaxis/core/styles/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AppFilterChipShimmer extends StatelessWidget {
  const AppFilterChipShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Dimensions.paddingAllxSmall,
      child: SizedBox(
        height: 37,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) => Dimensions.widthSmall,
          itemBuilder: (context, index) => Card(
            elevation: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              width: 80,
              height: 32,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 0.5),
                borderRadius: Dimensions.xsmallBorderRadius,
              ),
              child: Shimmer.fromColors(
                baseColor: const Color.fromARGB(255, 211, 211, 211),
                highlightColor: const Color(0xFFF8FAFC),
                child: Row(
                  children: [
                    Container(
                      height: 15,
                      width: 40,
                      color: Colors.white,
                    ),
                    Dimensions.widthxSmall,
                    Container(
                      height: 15,
                      width: 15,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
