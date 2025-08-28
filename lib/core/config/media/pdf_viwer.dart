import 'package:erudaxis/presentation/utils/app_scaffold.dart';
import 'package:erudaxis/providers/media/image_viwer_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:provider/provider.dart';

class PdfViewer extends StatelessWidget {
  final String pdfUrl;
  final double aspectRatio;

  const PdfViewer({
    required this.pdfUrl,
    this.aspectRatio = 1 / 1.41,
    super.key,
  });

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
                  AspectRatio(
                    aspectRatio: aspectRatio,
                    child: const PDF().cachedFromUrl(pdfUrl),
                  ),
                  AnimatedOpacity(
                    opacity: viewModel.screenTaped ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    child: IgnorePointer(
                      ignoring: !viewModel.screenTaped,
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
