import 'package:erudaxis/presentation/utils/app_bar_gradient.dart';
import 'package:erudaxis/presentation/utils/app_scaffold.dart';
import 'package:erudaxis/presentation/utils/spin_loading.dart';
import 'package:erudaxis/widgets/common/error_widget.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ImageViewer extends StatelessWidget {
  final ImageProvider imageProvider;
  const ImageViewer({required this.imageProvider, super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBarGradient(),
      body: PhotoView(
        imageProvider: imageProvider,
        disableGestures: false,
        enablePanAlways: false,
        basePosition: Alignment.center,
        wantKeepAlive: true,
        tightMode: true,
        gaplessPlayback: true,
        loadingBuilder: (context, event) => const SpinLoading(),
        backgroundDecoration: const BoxDecoration(color: Colors.transparent),
        errorBuilder: (context, error, stackTrace) => const ErrorMyWidget(),
        minScale: PhotoViewComputedScale.contained,
        maxScale: PhotoViewComputedScale.covered,
      ),
    );
  }
}
