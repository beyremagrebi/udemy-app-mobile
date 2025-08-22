import 'package:erudaxis/providers/base_view_model.dart';
import 'package:flutter/widgets.dart';

class ImageViwerViewModel extends BaseViewModel {
  bool screenTaped = false;

  ImageViwerViewModel(super.context);

  void closePictureViewer() {
    Navigator.of(context).pop();
  }

  void onTapScreen() {
    screenTaped = !screenTaped;
    update();
  }
}
