import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:fsummit/services/appModule.dart';
import 'package:fsummit/services/navigationService.dart';
import 'package:fsummit/services/uiService.dart';
import 'package:fsummit/theme/theme.dart';
import 'package:signals/signals.dart';
import 'naviagtion/router-map.dart';

void main() {
  SignalsObserver.instance = null;
  Animate.restartOnHotReload = true;
  registerDiContainer();
  runApp(App());
}

class App extends StatelessWidget {
  final _uiService = locator.get<UiService>();

  // appBarSignal.set(appBar, force: true);
  App({super.key});

  @override
  Widget build(BuildContext context) {
    _uiService.setDimensions(MediaQuery.of(context).padding, MediaQuery.of(context).size.height);
    _uiService.setKeyboardHeight(context);

    return MaterialApp.router(title: "Flutter App", routerConfig: appRouterMap, theme: AppTheme.lightTheme, darkTheme: AppTheme.darkTheme);
  }
}
