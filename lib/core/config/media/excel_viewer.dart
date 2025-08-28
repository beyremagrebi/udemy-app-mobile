import 'package:erudaxis/core/constants/constant.dart';
import 'package:erudaxis/presentation/utils/app_scaffold.dart';
import 'package:erudaxis/presentation/utils/spin_loading.dart';
import 'package:erudaxis/widgets/common/empty_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/media/excel_viewer_view_model.dart';

class ExcelViewer extends StatelessWidget {
  final String excelUrl;
  final double aspectRatio;

  const ExcelViewer({
    required this.excelUrl,
    this.aspectRatio = 1 / 1.9,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ExcelViewerViewModel(context, url: excelUrl),
      child: Consumer<ExcelViewerViewModel>(
        builder: (context, viewModel, child) => AppScaffold(
          backgroundColor: Colors.black,
          body: SafeArea(
            child: InkWell(
              onTap: viewModel.onTapScreen,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  if (viewModel.isLoading)
                    const Center(child: SpinLoading())
                  else
                    viewModel.rows.isEmpty
                        ? const EmptyWidget()
                        : AspectRatio(
                            aspectRatio: aspectRatio,
                            child: SingleChildScrollView(
                              child: SingleChildScrollView(
                                scrollDirection:
                                    Axis.horizontal, // horizontal scrolling
                                child: DataTable(
                                  border: TableBorder.all(
                                      color: Colors.grey, width: 1.4),
                                  headingRowColor:
                                      WidgetStateProperty.all(Colors.grey[800]),
                                  dataRowColor: WidgetStateProperty.all(
                                      const Color.fromARGB(214, 252, 250, 250)),
                                  columnSpacing: 24,
                                  headingTextStyle: textTheme.titleSmall,
                                  dataTextStyle: textTheme.bodyMedium
                                      ?.copyWith(color: Colors.black),
                                  columns: viewModel.rows.first
                                      .map((header) =>
                                          DataColumn(label: Text(header)))
                                      .toList(),
                                  rows: viewModel.rows.skip(1).map((row) {
                                    return DataRow(
                                      cells: row
                                          .map((cell) => DataCell(Text(cell)))
                                          .toList(),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ),
                  // Overlay for close button
                  AnimatedOpacity(
                    opacity: viewModel.screenTaped ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    child: IgnorePointer(
                      ignoring: !viewModel.screenTaped,
                      child: ColoredBox(
                        color: Colors.black.withOpacity(0.5),
                        child: SafeArea(
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: IconButton(
                              onPressed: viewModel.closeViewer,
                              icon: const Icon(
                                Icons.close,
                                color: Colors.white,
                                size: 28,
                              ),
                            ),
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
