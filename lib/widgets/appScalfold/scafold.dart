import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fsummit/naviagtion/router-map.dart';
import 'package:fsummit/services/navigationService.dart';
import 'package:fsummit/services/uiService.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:signals/signals_flutter.dart';

final appBarWhitelist = [AppRoute.chat, AppRoute.conversations];
final bottomBarWhitelist = [AppRoute.chat];

class AppScaffold extends StatefulWidget {
  final Widget? body;
  final Widget? bottomNavigationBar;
  final Color? backgroundColor;

  final _uiService = GetIt.I<UiService>();
  final _navService = GetIt.I<NavigationService>();

  AppScaffold({super.key, this.body, this.bottomNavigationBar, this.backgroundColor});

  @override
  State<AppScaffold> createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant AppScaffold oldWidget) {
    super.didUpdateWidget(oldWidget);
    widget._navService.setRoute(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: widget.body,
      backgroundColor: widget.backgroundColor,
      bottomNavigationBar: widget._uiService.appBarVisibilityComputedSignal.watch(context) ? widget.bottomNavigationBar : null,
    );
  }
}

abstract class AppBarProvider {
  PreferredSizeWidget? buildAppBar(BuildContext context);
}
