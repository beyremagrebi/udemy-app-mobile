import 'package:erudaxis/core/enum/api_status.dart';
import 'package:erudaxis/presentation/utils/snackbar_utils.dart';
import 'package:erudaxis/presentation/utils/spin_loading.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../core/api/api_response.dart';
import '../core/constants/constant.dart';

abstract class BaseViewModel extends ChangeNotifier {
  BuildContext context;

  ApiStatus _apiStatus = ApiStatus.success;

  BaseViewModel(this.context);

  ApiStatus get apiStatus => _apiStatus;

  Future<void> makeApiCall<Model>({
    required Future<ApiResponse<Model>> apiCall,
    bool displayLoading = true,
    bool displayError = true,
    bool displayShimmer = true,
    bool displayOverlay = true,
    void Function(Model model)? onSuccess,
    void Function(String error)? onError,
  }) async {
    if (displayShimmer) {
      _setApiStatus(ApiStatus.loading);
    }
    if (displayOverlay) {
      mainContext.loaderOverlay.show(
        widgetBuilder: (progress) => Visibility(
          visible: displayLoading,
          child: const SpinLoading(),
        ),
      );
    }
    final jsonResponse = await apiCall;
    if (jsonResponse.isSuccess) {
      _setApiStatus(ApiStatus.success);
      if (context.mounted) {
        if (displayOverlay) {
          mainContext.loaderOverlay.hide();
        }
      }
      if (jsonResponse.data != null) {
        onSuccess?.call(jsonResponse.data as Model);
      }
    } else {
      _setApiStatus(ApiStatus.error);

      if (context.mounted) {
        if (displayOverlay) {
          mainContext.loaderOverlay.hide();
        }
        if (displayError) {
          SnackBarUtils.showError(
            mainContext,
            jsonResponse.errorMessage.toString(),
          );
        }
      }
      onError?.call(jsonResponse.errorMessage.toString());
    }
  }

  void update() {
    notifyListeners();
  }

  void _setApiStatus(ApiStatus status) {
    _apiStatus = status;
    notifyListeners();
  }
}
