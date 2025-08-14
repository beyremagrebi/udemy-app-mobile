import 'package:erudaxis/widgets/common/empty_widget.dart';
import 'package:flutter/material.dart';

import '../../../models/base_model.dart';
import '../../../providers/base_view_model.dart';
import 'async_builder.dart';

class AsyncModelListBuilder<Model extends BaseModel,
    ViewModel extends BaseViewModel> extends StatelessWidget {
  final ViewModel viewModel;
  final List<Model>? models;
  final Widget? shimmer;
  final Widget Function(List<Model> models) builder;
  final Future<void> Function()? onRefresh;

  const AsyncModelListBuilder({
    required this.viewModel,
    required this.models,
    required this.builder,
    this.shimmer,
    this.onRefresh,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AsyncBuilder(
      apiStatus: viewModel.apiStatus,
      shimmer: shimmer,
      onSuccess: () {
        if (models != null && models!.isNotEmpty) {
          return onRefresh != null
              ? RefreshIndicator(
                  color: Colors.white,
                  backgroundColor: Colors.white.withOpacity(0.2),
                  strokeWidth: 1.5,
                  displacement: 25,
                  onRefresh: onRefresh!,
                  child: builder(models!),
                )
              : builder(models!);
        } else {
          return EmptyWidget(
            onRefresh: onRefresh,
          );
        }
      },
    );
  }
}
