import 'package:flutter/material.dart';
import 'package:fsummit/naviagtion/router-map.dart';
import 'package:fsummit/widgets/customPaints/base-icon.dart';
import 'package:fsummit/widgets/customPaints/chat-icon.dart';
import 'package:fsummit/widgets/customPaints/constants.dart';
import 'package:fsummit/widgets/customPaints/match-icon.dart';
import 'package:fsummit/widgets/customPaints/profile-icon.dart';
import 'package:go_router/go_router.dart';

import '../customPaints/discover-icon.dart';

part 'components/nav-bar-item.dart';

class AppBottomNavBar extends StatelessWidget {
  final void Function(int index) _onTap;

  const AppBottomNavBar({super.key, required void Function(int index) onTap}) : _onTap = onTap;

 bool _isActive(AppRoute route, BuildContext context) {
    final currentPath = GoRouterState.of(context).uri.path;

    bool isSubPath = route.subPaths.where((subPath) => currentPath.startsWith(subPath)).isNotEmpty;

    return currentPath == route.path || isSubPath;
  }

  @override
  Widget build(BuildContext context) {
    double bottomInset = MediaQuery.of(context).padding.bottom;

    return Container(
      color: Colors.grey[300],
      padding: EdgeInsets.only(bottom: bottomInset),
      child: SizedBox(
        height: 56,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _navItem(
              isActive: _isActive(AppRoute.discover, context),
              icon: DiscoverIcon(),
              onTap: () {
                _onTap(0);
              },
            ),
            _navItem(
              isActive: _isActive(AppRoute.match, context),
              icon: MatchIcon(),
              onTap: () {
                _onTap(1);
              },
            ),
            _navItem(
              isActive: _isActive(AppRoute.conversations, context),
              icon: ChatIcon(),
              onTap: () {
                _onTap(2);
              },
            ),
            _navItem(
              isActive: _isActive(AppRoute.profile, context),
              icon: ProfileIcon(),
              onTap: () {
                _onTap(3);
              },
            ),
          ],
        ),
      ),
    );
  }
}
