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
    super.key,
    required super.imageFileName,
    super.imageNetworUrl,
    super.borderRadius,
    this.isMen,
    super.border,
    super.fit,
    super.boxShadow,
    super.color,
    super.width,
    super.height,
  });

  @override
  Widget build(BuildContext context) {
    return _buildCachedNetworkImage(context);
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
      // httpHeaders: {
      //   'Authorization': 'Bearer ${TokenManager.accessToken}',
      // },
      imageBuilder: (context, imageProvider) => buildImage(
        context,
        imageProvider,
        // ResizeImage(imageProvider,
        //     height: memCacheHeight, width: memCacheWidth),
      ),
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

  @override
  Widget placeHolderImage(BuildContext context, {bool isLoading = false}) {
    String finalPlaceholderPath =
        placeholderAssetPath ?? _getDefaultPlaceholderPath();

    final memCacheHeight = (width * Dimensions.dpr).round();
    final memCacheWidth = (height * Dimensions.dpr).round();
    return InkWell(
      onTap: () => showImageViewer(context),
      child: Container(
        height: height,
        width: width,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: color,
          borderRadius: isProfilePicture ? null : borderRadius,
          boxShadow: boxShadow,
          border: border,
          shape: isProfilePicture ? BoxShape.circle : BoxShape.rectangle,
        ),
        child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          children: [
            isProfilePicture
                ? Image.asset(
                    finalPlaceholderPath,
                    fit: fit,
                    cacheHeight: memCacheHeight,
                    cacheWidth: memCacheWidth,
                  )
                : isLoading
                    ? const SpinKitSpinningLines(color: AppColors.primaryColor)
                    : Image.asset(
                        finalPlaceholderPath,
                        fit: fit,
                        cacheHeight: memCacheHeight,
                        cacheWidth: memCacheWidth,
                      ),
            if (isLoading && isProfilePicture)
              CircularProgressIndicator(
                backgroundColor: Colors.grey.shade300,
              ),
          ],
        ),
      ),
    );
  }
}
