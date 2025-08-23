import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fsummit/naviagtion/router-map.dart';
import 'package:fsummit/services/appModule.dart';
import 'package:fsummit/services/navigationService.dart';
import 'package:fsummit/services/uiService.dart';
import 'package:go_router/go_router.dart';
import 'package:signals/signals_flutter.dart';

final appBarWhitelist = [AppRoute.chat, AppRoute.conversations];
final bottomBarWhitelist = [AppRoute.chat];

class AppScaffold extends StatelessWidget {
  final Widget? body;
  final Widget? bottomNavigationBar;
  final Color? backgroundColor;

  final _uiService = locator.get<UiService>();
  final _navService = locator.get<NavigationService>();

  AppScaffold({super.key, this.body, this.bottomNavigationBar, this.backgroundColor}) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarBrightness: Brightness.dark));
  }


  dynamic _getAppBar(BuildContext context) {
    var router = GoRouter.of(context);
    var canDisplayAppBar = appBarWhitelist.where((c) => c.path == router.state.uri.path).isNotEmpty;
    return canDisplayAppBar ? _uiService.appBarSignal.watch(context) : null;
  }

  dynamic _getBottomBar(BuildContext context) {
    var router = GoRouter.of(context);
    var canDisplayAppBar = bottomBarWhitelist.where((c) => c.path == router.state.uri.path).isNotEmpty;
    return canDisplayAppBar ? _uiService.bottomBarSignal.watch(context) : bottomNavigationBar;
  }

  @override
  Widget build(BuildContext context) {
    var router = GoRouter.of(context);
    _navService.activeRouter = AppRoute.values.firstWhere((c) => c.path == router.state.uri.path);

    return Scaffold(
      appBar: _getAppBar(context), body: body, backgroundColor: backgroundColor, bottomNavigationBar: _getBottomBar(context),);
  }
}

abstract class AppBarProvider {
  PreferredSizeWidget? buildAppBar(BuildContext context);
}
