import 'package:flutter/cupertino.dart';
import 'package:fsummit/naviagtion/RouterMap.dart';
import 'package:get_it/get_it.dart';
import 'package:keyboard_height_plugin/keyboard_height_plugin.dart';
import 'package:signals/signals_flutter.dart';

import 'navigationService.dart';

class UiService {
  final _navService = GetIt.I<NavigationService>();

  var appBarSignal = signal<PreferredSizeWidget?>(null);
  var appBottomNavBarVisibleSignal = signal<bool>(true);

  var keyboardHeightSignal = signal<double>(0);

  // final KeyboardHeightPlugin _keyboardHeightPlugin = KeyboardHeightPlugin();

  bool _hasDimensionsInitialized = false;
  double maxHeight = 0;
  EdgeInsets safeArea = EdgeInsets.zero;
  bool isKeyboardVisible = false;
  bool wasKeyboardUp = false;


  late var appBarVisibilityComputedSignal = computed((){
    if(_navService.activePathSignal.value == AppRoute.chat){
      return false;
    }
    return true;
  });


  void updateAppBar(PreferredSizeWidget? appBar) {
    appBarSignal.set(appBar);
  }

  // void updateBottomBar(Widget? bottomBar) {
  //   bottomBarSignal.set(bottomBar);
  // }

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
