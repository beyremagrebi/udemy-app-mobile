import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../constants/assets.dart';
import '../../constants/env.dart';
import '../../styles/app_colors.dart';
import '../../styles/dimensions.dart';
import 'base_api_image.dart';

class ApiImageWidget extends BaseApiImage {
  final bool? isMen;
  const ApiImageWidget({
    required super.imageFileName,
    super.key,
    super.imageNetworUrl,
    super.isProfilePicture,
    super.borderRadius,
    this.isMen,
    super.border,
    super.fit = BoxFit.cover,
    super.boxShadow,
    super.color,
    super.width,
    super.height,
  });

  @override
  Widget build(BuildContext context) {
    return _buildCachedNetworkImage(context);
  }

  @override
  Widget placeHolderImage(BuildContext context, {bool isLoading = false}) {
    final String finalPlaceholderPath =
        placeholderAssetPath ?? _getDefaultPlaceholderPath();

    return InkWell(
      onTap: () => showImageViewer(context),
      child: isLoading
          ? Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                shape: isProfilePicture ? BoxShape.circle : BoxShape.rectangle,
              ),
              child: const SpinKitSpinningLines(
                color: AppColors.primaryColor,
              ),
            )
          : buildImage(context, AssetImage(finalPlaceholderPath)),
    );
  }

  Widget _buildCachedNetworkImage(BuildContext context) {
    final imageUrl = '${imageNetworUrl ?? fileUrl}/$imageFileName';

    final memCacheHeight = (width * Dimensions.dpr).round();
    final memCacheWidth = (height * Dimensions.dpr).round();
    return CachedNetworkImage(
      key: Key(imageUrl),
      cacheKey: imageUrl,
      imageUrl: imageUrl,
      memCacheHeight: memCacheHeight,
      memCacheWidth: memCacheWidth,
      imageBuilder: buildImage,
      progressIndicatorBuilder: (context, url, progress) => placeHolderImage(
        context,
        isLoading: true,
      ),
      errorWidget: (context, url, error) => placeHolderImage(context),
    );
  }

  String _getDefaultPlaceholderPath() {
    if (isMen ?? false) {
      return Assets.defaultMaleAvatar;
    } else {
      return Assets.defaultFemaleAvatar;
    }
  }
}
