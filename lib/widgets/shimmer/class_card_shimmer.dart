import 'package:erudaxis/core/styles/dimensions.dart';
import 'package:flutter/material.dart';

import 'base_shimmer.dart';

class ClassCardShimmer extends BaseShimmer {
  ClassCardShimmer({super.key});

  @override
  Widget get child => ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        padding: Dimensions.paddingAllMedium,
        separatorBuilder: (context, index) => Dimensions.heightSmall,
        itemCount: 3,
        itemBuilder: (context, index) => Card(
          clipBehavior: Clip.hardEdge,
          elevation: 0,
          child: Padding(
            padding: Dimensions.paddingAllSmall,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 50,
                      width: 50,
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
                            height: 14,
                            width: 120,
                            color: Colors.white,
                          ),
                          Dimensions.heightxSmall,
                          Container(
                            height: 12,
                            width: 180,
                            color: Colors.white,
                          ),
                          Dimensions.heightxSmall,
                          Container(
                            height: 12,
                            width: 220,
                            color: Colors.white,
                          ),
                          Dimensions.heightSmall,
                          Row(
                            children: [
                              Container(
                                height: 12,
                                width: 12,
                                color: Colors.white,
                              ),
                              Dimensions.widthxSmall,
                              Container(
                                height: 12,
                                width: 20,
                                color: Colors.white,
                              ),
                              Dimensions.widthSmall,
                              Expanded(
                                child: Container(
                                  height: 12,
                                  width: double.infinity,
                                  color: Colors.white,
                                ),
                              ),
                              Dimensions.widthSmall,
                              Container(
                                height: 30,
                                width: 30,
                                color: Colors.white,
                              ),
                              Dimensions.widthSmall,
                              Container(
                                height: 30,
                                width: 30,
                                color: Colors.white,
                              ),
                            ],
                          ),
                          Dimensions.heightSmall,
                          Container(
                            padding: Dimensions.paddingAllSmall,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  height: 16,
                                  width: 16,
                                  color: Colors.white,
                                ),
                                Dimensions.widthxSmall,
                                Expanded(
                                  child: Container(
                                    height: 12,
                                    width: double.infinity,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Dimensions.widthSmall,
                    Container(
                      height: 24,
                      width: 24,
                      color: Colors.white,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      );
}
