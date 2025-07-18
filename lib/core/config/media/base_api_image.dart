import 'package:flutter/material.dart';

import '../../../interfaces/i_show_image_viewer.dart';
import '../../../presentation/utils/navigator_utils.dart';
import 'image_viewer.dart';

abstract class BaseApiImage extends StatelessWidget
    implements IShowImageViewer {
  final String? imageFileName;
  final String? imageNetworUrl;
  final BoxFit? fit;
  final double width;
  final double height;
  final bool isProfilePicture;
  final BorderRadius? borderRadius;
  final bool hasImageView;
  final Color? color;
  final String? placeholderAssetPath;
  final EdgeInsets? padding;

  final Border? border;
  final List<BoxShadow>? boxShadow;
  const BaseApiImage({
    required this.imageFileName,
    super.key,
    this.isProfilePicture = false,
    this.imageNetworUrl,
    this.fit,
    this.height = 80.0,
    this.width = 80.0,
    this.hasImageView = false,
    this.borderRadius,
    this.border,
    this.boxShadow,
    this.padding,
    this.color,
    this.placeholderAssetPath,
  });

  @override
  Widget build(BuildContext context);

  Widget buildImage(
    BuildContext context,
    ImageProvider imageProvider,
  ) {
    return InkWell(
      overlayColor: const WidgetStatePropertyAll(Colors.transparent),
      onTap: hasImageView
          ? () => imageViewer(
                context,
                imageProvider: imageProvider,
              )
          : null,
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
                child: Image(
                  image: imageProvider,
                  fit: fit,
                  height: height,
                  width: width,
                ),
              )
            : Image(
                image: imageProvider,
                fit: fit,
                height: height,
                width: width,
              ),
      ),
    );
  }

  @override
  void imageViewer(
    BuildContext context, {
    required ImageProvider<Object> imageProvider,
  }) {
    navigateTo(
      context,
      ImageViewer(
        imageProvider: imageProvider,
      ),
    );
  }

  Widget placeHolderImage(BuildContext context, {bool isLoading = false});
}
