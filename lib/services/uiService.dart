import 'package:flutter/cupertino.dart';
import 'package:signals/signals_flutter.dart';

class UiService {
  var appBarSignal = signal<PreferredSizeWidget?>(null);
  var bottomBarSignal = signal<Widget?>(null);

  bool _hasDimensionsInitialized = false;

  double maxHeight = 0;
  EdgeInsets safeArea = EdgeInsets.zero;

  void updateAppBar(PreferredSizeWidget? appBar) {
    appBarSignal.set(appBar);
  }

  void updateBottomBar(Widget? bottomBar) {
    bottomBarSignal.set(bottomBar);
  }

  void setDimensions(EdgeInsets padding, double height) {
    if (!_hasDimensionsInitialized) {
      safeArea = padding;
      maxHeight = height;
      _hasDimensionsInitialized = true;
    }
  }
}
