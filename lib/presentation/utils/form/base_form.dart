import 'package:erudaxis/core/styles/dimensions.dart';
import 'package:erudaxis/providers/base_view_model.dart';
import 'package:flutter/material.dart';

abstract class BaseForm<T extends BaseViewModel> extends StatelessWidget {
  final T viewModel;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  BaseForm({required this.viewModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          ...buildFormFields(context),
          if (buildFooter(context) != null) ...[
            Dimensions.heightxSmall,
            buildFooter(context)!,
          ],
          Dimensions.heightxSmall,
          buildSubmitButton(context),
        ],
      ),
    );
  }

  Widget? buildFooter(BuildContext context) => null;

  List<Widget> buildFormFields(BuildContext context);

  Widget buildSubmitButton(BuildContext context);

  void onSubmit(BuildContext context);

  bool validateForm() {
    return formKey.currentState?.validate() ?? false;
  }
}
