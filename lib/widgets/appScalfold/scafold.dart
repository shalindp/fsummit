import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fsummit/naviagtion/router-map.dart';
import 'package:fsummit/services/appModule.dart';
import 'package:fsummit/services/uiService.dart';
import 'package:go_router/go_router.dart';
import 'package:signals/signals_flutter.dart';

import '../../services/navigationService.dart';

final appBarWhitelist = [AppRoute.chat];

class AppScaffold extends StatelessWidget {
  final Widget? body;
  final Widget? bottomNavigationBar;
  final Color? backgroundColor;

  AppScaffold({super.key, this.body, this.bottomNavigationBar, this.backgroundColor}) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarBrightness: Brightness.dark));
  }

  // final computedAppBarSignal = computed(() {
  //   var uiService = locator.get<UiService>();
  //
  //   var canDisplayAppBar = appBarWhitelist.where((c) => c == navigationService.activePageDetailsSignal.value).isNotEmpty;
  //   if (canDisplayAppBar && uiService.appBarSignal.value != null) {
  //     return uiService.appBarSignal.value;
  //   } else {
  //     return null;
  //   }
  // });

  dynamic _getAppBar(BuildContext context) {
    var uiService = locator.get<UiService>();
    var x = GoRouter.of(context);
    var canDisplayAppBar = appBarWhitelist.where((c) => c.path == x.state.uri.path).isNotEmpty;

    return canDisplayAppBar ? uiService.appBarSignal.watch(context) : null;
  }

  @override
  Widget build(BuildContext context) {
    var uiService = locator.get<UiService>();

    var x = GoRouter.of(context);
    var canDisplayAppBar = appBarWhitelist.where((c) => c.path == x.state.uri.path).isNotEmpty;

    print("object@> ${x.state.path} ${x.state.uri.path}");
    return Scaffold(appBar: _getAppBar(context), body: body, backgroundColor: backgroundColor, bottomNavigationBar: bottomNavigationBar);
  }
}

abstract class AppBarProvider {
  PreferredSizeWidget? buildAppBar(BuildContext context);
}
