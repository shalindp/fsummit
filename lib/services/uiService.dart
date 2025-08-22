import 'package:flutter/cupertino.dart';
import 'package:signals/signals_flutter.dart';

class UiService {
  var appBarSignal = signal<PreferredSizeWidget?>(null);

  void updateAppBar(PreferredSizeWidget? appBar) {
    appBarSignal.set(appBar, force: true);
  }
}
