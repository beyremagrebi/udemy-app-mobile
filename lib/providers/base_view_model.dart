import 'package:erudaxis/core/constants/constant.dart';
import 'package:erudaxis/models/base_model.dart';
import 'package:erudaxis/presentation/utils/alert_dialog.dart';
import 'package:erudaxis/presentation/utils/spin_loading.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../core/api/api_response.dart';

abstract class BaseViewModel extends ChangeNotifier {
  BuildContext context;

  BaseViewModel(this.context);

  Future<void> makeApiCall<Data, Model extends BaseModel>({
    required Future<ApiResponse<Data>> apiCall,
    required Model Function(Data data) fromData,
    bool displayLoading = true,
    bool displayError = true,
    void Function(Model model)? onSuccess,
    void Function(String error)? onError,
  }) async {
    context.loaderOverlay.show(
      widgetBuilder: (progress) => Visibility(
        visible: displayLoading,
        child: const SpinLoading(),
      ),
    );
    if (context.loaderOverlay.visible) {
      final jsonResponse = await apiCall;

      if (jsonResponse.isSuccess) {
        if (context.mounted) {
          context.loaderOverlay.hide();
        }
        final model = fromData(jsonResponse.data as Data);
        onSuccess?.call(model);
      } else {
        onError?.call(jsonResponse.errorMessage.toString());
        if (displayError) {
          if (context.mounted) {
            context.loaderOverlay.hide();
            CustomAlertDialog.showErrorDialog(
              context: context,
              title: intl.error,
              message: jsonResponse.errorMessage.toString(),
            );
          }
        }
      }
    }
  }

  void update() {
    notifyListeners();
  }
}
