import 'package:erudaxis/models/base_model.dart';
import 'package:erudaxis/presentation/utils/async/async_builder.dart';
import 'package:erudaxis/providers/base_view_model.dart';
import 'package:flutter/material.dart';

class AsyncModelBuilder<Model extends BaseModel,
    ViewModel extends BaseViewModel> extends StatelessWidget {
  final ViewModel viewModel;
  final Model? model;
  final Widget Function(Model model) builder;
  const AsyncModelBuilder({
    required this.viewModel,
    required this.model,
    required this.builder,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AsyncBuilder(
      apiStatus: viewModel.apiStatus,
      onSuccess: () => builder(model!),
    );
  }
}
