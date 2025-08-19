import 'package:erudaxis/core/styles/dimensions.dart';
import 'package:erudaxis/widgets/shimmer/base_shimmer.dart';
import 'package:flutter/material.dart';

class MemberCardShimmer extends BaseShimmer {
  MemberCardShimmer({super.key});

  @override
  Widget get child => SizedBox(
        height: 55 * 3 + (Dimensions.s * 2),
        child: ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) => Dimensions.heightSmall,
          itemCount: 3,
          itemBuilder: (context, index) => Card(
            elevation: 0,
            child: Padding(
              padding: Dimensions.paddingAllSmall,
              child: Row(
                children: [
                  Container(
                    height: 35,
                    width: 35,
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
                          height: 10,
                          width: 100,
                          color: Colors.white,
                        ),
                        Dimensions.heightxSmall,
                        Container(
                          height: 8,
                          width: 60,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  Dimensions.widthSmall,
                  Container(
                    width: 20,
                    height: 20,
                    color: Colors.grey,
                  )
                ],
              ),
            ),
          ),
        ),
      );
}
