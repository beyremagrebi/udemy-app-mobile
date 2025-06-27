import 'package:flutter/widgets.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../../core/api/api_response.dart';
import '../../core/constants/constant.dart';
import '../../models/base_model.dart';
import '../../presentation/utils/alert_dialog.dart';
import '../../presentation/utils/spin_loading.dart';

Future<void> globalApiCall<Model extends BaseModel>({
  required Future<ApiResponse<Model>> apiCall,
  bool displayLoading = true,
  bool displayError = false,
  void Function(Model model)? onSuccess,
  void Function(String error)? onError,
}) async {
  mainContext.loaderOverlay.show(
    widgetBuilder: (progress) => Visibility(
      visible: displayLoading,
      child: const SpinLoading(),
    ),
  );
  if (mainContext.loaderOverlay.visible) {
    final jsonResponse = await apiCall;

    if (jsonResponse.isSuccess) {
      if (mainContext.mounted) {
        mainContext.loaderOverlay.hide();
      }
      if (jsonResponse.data != null) {
        final model = jsonResponse.data as Model;
        onSuccess?.call(model);
      }
    } else {
      onError?.call(jsonResponse.errorMessage.toString());
      if (displayError) {
        if (mainContext.mounted) {
          mainContext.loaderOverlay.hide();
          CustomAlertDialog.showErrorDialog(
            context: mainContext,
            title: intl.error,
            message: jsonResponse.errorMessage.toString(),
          );
        }
      }
    }
  }
}
