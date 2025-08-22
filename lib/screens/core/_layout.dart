import 'package:flutter/material.dart';
import 'package:fsummit/widgets/bottomNavBar/bottom-nav-bar.dart';
import 'package:go_router/src/route.dart';

import '../../theme/theme.dart';
import '../../widgets/appScalfold/scafold.dart';

class CoreTabLayout extends StatelessWidget {
  final StatefulNavigationShell _navigationShell;

  const CoreTabLayout(this._navigationShell, {super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: AppTheme.of(context).col60,
      body: _navigationShell,
      bottomNavigationBar: AppBottomNavBar(onTap: _navigationShell.goBranch,),
    );
  }
}
