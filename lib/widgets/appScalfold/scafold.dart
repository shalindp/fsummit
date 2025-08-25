import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:fsummit/naviagtion/router-map.dart';
import 'package:fsummit/services/navigationService.dart';
import 'package:fsummit/services/uiService.dart';
import 'package:get_it/get_it.dart';
import 'package:signals/signals_flutter.dart';

import '../bottomNavBar/bottom-nav-bar.dart';

final appBarWhitelist = [AppRoute.chat, AppRoute.conversations];
final bottomBarWhitelist = [AppRoute.chat];

class AppScaffold extends StatefulWidget {
  final Widget? body;
  final Widget? bottomNavigationBar;
  final Color? backgroundColor;

  const AppScaffold({super.key, this.body, this.bottomNavigationBar, this.backgroundColor});

  @override
  State<AppScaffold> createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> with SingleTickerProviderStateMixin {
  final _uiService = GetIt.I<UiService>();
  final _navService = GetIt.I<NavigationService>();

  late final AnimationController _animationController = AnimationController(vsync: this, duration: 0.milliseconds);

  final showBar = signal(true);

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
    _navService.setRoute(context);

    if (_navService.activePathSignal.peek() == AppRoute.chat) {
      _animationController.forward().whenComplete(() => showBar.set(false));
    }else if(_animationController.isCompleted){
      showBar.set(true);
      _animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: widget.body,
      backgroundColor: widget.backgroundColor,
      bottomNavigationBar: showBar.watch(context)
          ? widget.bottomNavigationBar!
                .animate(controller: _animationController, autoPlay: false)
                .moveY(begin: 0, end: AppBottomNavBar.height + _uiService.safeArea.bottom, duration: 200.milliseconds, curve: Curves.easeInSine)
                .fadeOut()
          : null,
    );
  }
}

abstract class AppBarProvider {
  PreferredSizeWidget? buildAppBar(BuildContext context);
}

class X extends Curve {}
