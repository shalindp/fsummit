import 'package:flutter/cupertino.dart';
import 'package:keyboard_height_plugin/keyboard_height_plugin.dart';
import 'package:signals/signals_flutter.dart';

class UiService {
  var appBarSignal = signal<PreferredSizeWidget?>(null);
  var bottomBarSignal = signal<Widget?>(null);
  var keyboardHeightSignal = signal<double>(0);

  // final KeyboardHeightPlugin _keyboardHeightPlugin = KeyboardHeightPlugin();

  bool _hasDimensionsInitialized = false;

  double maxHeight = 0;
  EdgeInsets safeArea = EdgeInsets.zero;
  bool isKeyboardVisible = false;
  bool wasKeyboardUp = false;


  // UiService(){
  //   print('INITS');
  //   _keyboardHeightPlugin.onKeyboardHeightChanged((double height) {
  //     print("@>>>>>>>>>>>>>>>> $height}");
  //   });
  //
  // }

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

  void setKeyboardHeight(BuildContext context) {
    keyboardHeightSignal.set(MediaQuery.of(context).viewInsets.bottom);
  }
}
