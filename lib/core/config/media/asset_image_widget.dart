import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'base_api_image.dart';

class AssetsImageWidget extends BaseApiImage {
  final Gradient? gradient; // New property for gradient

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
    this.gradient,
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
            border: border,
            boxShadow: boxShadow,
            borderRadius: isProfilePicture ? null : borderRadius,
            shape: isProfilePicture ? BoxShape.circle : BoxShape.rectangle,
          ),
          child: isProfilePicture ? ClipOval(child: _buildSvg()) : _buildSvg(),
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

  Widget _buildSvg() {
    Widget svg = SvgPicture.asset(
      imageFileName!,
      fit: fit ?? BoxFit.cover,
      height: height,
      width: width,
      colorFilter: (gradient == null && color != null)
          ? ColorFilter.mode(color!, BlendMode.srcIn)
          : null,
    );

    // Apply gradient if provided
    if (gradient != null) {
      svg = ShaderMask(
        shaderCallback: (bounds) => gradient!.createShader(bounds),
        blendMode: BlendMode.srcIn,
        child: svg,
      );
    }

    return svg;
  }
}
