import 'dart:io';

import 'package:flutter/material.dart';

import 'base_api_image.dart';

class FileImageWidget extends BaseApiImage {
  const FileImageWidget({
    required super.imageFileName,
    super.key,
    super.isProfilePicture,
    super.fit,
    super.hasImageView,
    super.height,
    super.width,
    super.borderRadius,
    super.border,
    super.boxShadow,
    super.padding,
    super.color,
    super.placeholderAssetPath,
  });

  @override
  Widget build(BuildContext context) {
    final file = File(imageFileName!);
    if (!file.existsSync()) {
      return placeHolderImage(context);
    }

    return buildImage(
      context,
      FileImage(file),
    );
  }

  @override
  Widget placeHolderImage(BuildContext context, {bool isLoading = false}) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: isProfilePicture ? null : borderRadius,
        shape: isProfilePicture ? BoxShape.circle : BoxShape.rectangle,
      ),
      child: Icon(
        Icons.image_not_supported,
        color: Colors.white70,
        size: width * 0.5,
      ),
    );
  }
}
