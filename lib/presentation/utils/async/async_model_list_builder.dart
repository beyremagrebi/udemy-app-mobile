import 'package:flutter/widgets.dart';

import '../../../models/base_model.dart';
import '../../../providers/base_view_model.dart';
import 'async_builder.dart';

class AsyncModelListBuilder<Model extends BaseModel,
    ViewModel extends BaseViewModel> extends StatelessWidget {
  final ViewModel viewModel;
  final List<Model>? models;
  final Widget? shimmer;
  final Widget Function(List<Model> models) builder;

  const AsyncModelListBuilder({
    required this.viewModel,
    required this.models,
    required this.builder,
    this.shimmer,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AsyncBuilder(
      apiStatus: viewModel.apiStatus,
      shimmer: shimmer,
      onSuccess: () => (models != null && models!.isNotEmpty)
          ? builder(models!)
          : const SizedBox.shrink(),
    );
  }
}
