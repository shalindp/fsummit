import 'package:flutter/cupertino.dart';
import 'package:fsummit/naviagtion/router-map.dart';
import 'package:go_router/go_router.dart';
import 'package:signals/signals_flutter.dart';

class NavigationService {
  NavigationService() {
    // addRouteListener();
  }

  AppRoute? activeRouter;

  final activePageDetailsSignal = signal<AppRoute?>(null);

  void setActivePage(AppRoute route) {
    activePageDetailsSignal.value = route;
  }

  // void listenToRouteChanges(BuildContext context) {
  //   var router = GoRouter.of(context);
  //   var currentRoute = AppRoute.values.firstWhere((c) => router.state.fullPath == c.path);
  // }
  //
  //   void addRouteListener() {
  //     appRouterMap.routeInformationProvider.addListener(() {
  //       WidgetsBinding.instance.addPostFrameCallback((_) {
  //         final location = appRouterMap.state.fullPath;
  //         print("@> Route changed: $location");
  //       });
  //       activePageDetailsSignal.value = AppRoute.values.firstWhere((c) => appRouterMap.routeInformationProvider.value.uri.path == c.path);
  //     });
  //   }
}
