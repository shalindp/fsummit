import 'package:flutter/material.dart';
import 'package:fsummit/widgets/bottomNavBar/bottom-nav-bar.dart';
import 'package:go_router/src/route.dart';

class CoreTabLayout extends StatelessWidget {
  final StatefulNavigationShell _navigationShell;

  const CoreTabLayout(this._navigationShell, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _navigationShell,
      bottomNavigationBar: AppBottomNavBar(onTap: _navigationShell.goBranch,),
    );
  }
}
