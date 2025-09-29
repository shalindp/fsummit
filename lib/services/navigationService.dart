import 'package:flutter/cupertino.dart';
import 'package:fsummit/naviagtion/RouterMap.dart';
import 'package:go_router/go_router.dart';
import 'package:signals/signals_flutter.dart';

class NavigationService {
  final activePathSignal = Signal<AppRoute?>(null);

  NavigationService() {
    // addRouteListener();
  }

  void setRoute(BuildContext context) {
    var uri = GoRouter.of(context).state.uri;
    activePathSignal.set(AppRoute.values.firstWhere((c) => c.path == uri.path));
  }
}
