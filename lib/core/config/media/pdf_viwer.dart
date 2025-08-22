import 'package:erudaxis/presentation/utils/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

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
    return AppScaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: AspectRatio(
          aspectRatio: aspectRatio,
          child: const PDF().cachedFromUrl(pdfUrl),
        ),
      ),
    );
  }
}
