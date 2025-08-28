import 'package:erudaxis/core/constants/constant.dart';
import 'package:erudaxis/core/styles/dimensions.dart';
import 'package:erudaxis/models/global/user.dart';
import 'package:erudaxis/presentation/utils/app_bar_gradient.dart';
import 'package:erudaxis/presentation/utils/app_scaffold.dart';
import 'package:erudaxis/presentation/utils/spin_loading.dart';
import 'package:erudaxis/presentation/utils/title_widget.dart';
import 'package:erudaxis/widgets/common/empty_widget.dart';
import 'package:erudaxis/widgets/common/gradient_app_bar_widget.dart';
import 'package:erudaxis/widgets/common/icon_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/media/zip_viewer_view_model.dart';
import '../../../widgets/common/file_item.dart';

class ZipEntryList extends StatelessWidget {
  final List<ZipEntry> entries;
  final User? creator;
  final ZipViewerViewModel? viewModel;

  const ZipEntryList(
      {required this.entries, this.viewModel, this.creator, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: entries.map((entry) {
        if (entry.isFile) {
          return ProfessionalFileItem(
            fileName: entry.name,
            creator: creator,
            onTap: () => viewModel?.openFile(entry),
          );
        } else {
          return ExpansionTile(
            leading: const Icon(Icons.folder, color: Colors.amber),
            title: Text(entry.name),
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: entry.children.isNotEmpty
                    ? ZipEntryList(
                        entries: entry.children,
                        creator: creator,
                        viewModel: viewModel,
                      )
                    : const SizedBox(),
              ),
            ],
          );
        }
      }).toList(),
    );
  }
}

class ZipViewer extends StatelessWidget {
  final String zipUrl;
  final String? diplayName;
  final User? creator;
  final double aspectRatio;

  const ZipViewer({
    required this.zipUrl,
    this.creator,
    this.diplayName,
    this.aspectRatio = 1 / 1.9,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ZipViewerViewModel(context, url: zipUrl),
      child: Consumer<ZipViewerViewModel>(
        builder: (context, viewModel, child) => AppScaffold(
          appBar: AppBarGradient(),
          body: Column(
            children: [
              GradientAppBarWidget(
                child: Container(
                  padding: Dimensions.horizontalPaddingMedium,
                  margin: const EdgeInsets.only(bottom: Dimensions.s),
                  child: IconHeaderWidget(
                    icon: const Icon(Icons.archive_rounded),
                    title: diplayName ?? intl.error,
                    creator: creator,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: Dimensions.paddingAllMedium,
                  child: SingleChildScrollView(
                    child: TitleWidget(
                      title: 'Extracted Zip',
                      icon: Icons.archive_outlined,
                      child: viewModel.isLoading
                          ? Padding(
                              padding: Dimensions.paddingAllMedium,
                              child: const SpinLoading(),
                            )
                          : viewModel.files.isEmpty
                              ? const EmptyWidget()
                              : ZipEntryList(
                                  entries: viewModel.files,
                                  creator: creator,
                                  viewModel: viewModel,
                                ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
