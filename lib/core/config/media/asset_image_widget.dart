import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Add this import

import 'base_api_image.dart';

class AssetsImageWidget extends BaseApiImage {
  const AssetsImageWidget({
    required super.imageFileName,
    super.key,
    super.isProfilePicture,
    super.fit,
    super.hasImageView,
    super.height,
    super.width,
    super.color,
    super.borderRadius,
    super.border,
    super.boxShadow,
    super.padding,
    super.placeholderAssetPath,
  });

  bool get _isSvg => imageFileName?.toLowerCase().endsWith('.svg') ?? false;

  @override
  Widget build(BuildContext context) {
    if (_isSvg) {
      return InkWell(
        overlayColor: const WidgetStatePropertyAll(Colors.transparent),
        onTap: hasImageView ? () {} : null,
        child: Container(
          clipBehavior: Clip.hardEdge,
          padding: padding,
          decoration: BoxDecoration(
            color: color,
            border: border,
            boxShadow: boxShadow,
            borderRadius: isProfilePicture ? null : borderRadius,
            shape: isProfilePicture ? BoxShape.circle : BoxShape.rectangle,
          ),
          child: isProfilePicture
              ? ClipOval(
                  child: SvgPicture.asset(
                    imageFileName!,
                    fit: fit ?? BoxFit.cover,
                    colorFilter: const ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcIn,
                    ),
                    height: height,
                    width: width,
                  ),
                )
              : SvgPicture.asset(
                  imageFileName!,
                  fit: fit ?? BoxFit.cover,
                  colorFilter: const ColorFilter.mode(
                    Colors.white,
                    BlendMode.srcIn,
                  ),
                  height: height,
                  width: width,
                ),
        ),
      );
    } else {
      return buildImage(
        context,
        AssetImage(imageFileName!),
      );
    }
  }

  @override
  Widget placeHolderImage(BuildContext context, {bool isLoading = false}) {
    return Icon(
      Icons.photo,
      size: height,
    );
  }
}
