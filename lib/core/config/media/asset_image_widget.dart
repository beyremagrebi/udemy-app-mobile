// Flutter imports:
import 'package:flutter/material.dart';

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
  });

  @override
  Widget build(BuildContext context) {
    return buildImage(
      context,
      AssetImage(imageFileName!),
    );
  }

  @override
  Widget placeHolderImage(BuildContext context, {bool isLoading = false}) {
    throw UnimplementedError();
  }
}
