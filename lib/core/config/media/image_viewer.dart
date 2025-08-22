import 'package:erudaxis/presentation/utils/app_scaffold.dart';
import 'package:erudaxis/presentation/utils/spin_loading.dart';
import 'package:erudaxis/providers/media/image_viwer_view_model.dart';
import 'package:erudaxis/widgets/common/error_widget.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:provider/provider.dart';

class ImageViewer extends StatelessWidget {
  final ImageProvider imageProvider;
  const ImageViewer({required this.imageProvider, super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ImageViwerViewModel.new,
      child: Consumer<ImageViwerViewModel>(
        builder: (context, viewModel, child) => AppScaffold(
          backgroundColor: Colors.black,
          body: SafeArea(
            child: InkWell(
              onTap: viewModel.onTapScreen,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  PhotoView(
                    imageProvider: imageProvider,
                    disableGestures: false,
                    enablePanAlways: false,
                    basePosition: Alignment.center,
                    wantKeepAlive: true,
                    tightMode: true,
                    gaplessPlayback: true,
                    loadingBuilder: (context, event) => const SpinLoading(),
                    backgroundDecoration:
                        const BoxDecoration(color: Colors.transparent),
                    errorBuilder: (context, error, stackTrace) =>
                        const ErrorMyWidget(),
                    minScale: PhotoViewComputedScale.contained,
                    maxScale: PhotoViewComputedScale.covered,
                  ),
                  AnimatedOpacity(
                    opacity: viewModel.screenTaped ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    child: IgnorePointer(
                      ignoring:
                          !viewModel.screenTaped, // disable taps when hidden
                      child: ColoredBox(
                        color: Colors.black.withOpacity(0.6),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: IconButton(
                            onPressed: viewModel.closePictureViewer,
                            icon: const Icon(Icons.close_outlined,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
