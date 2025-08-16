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
      bottomNavigationBar: AppBottomNavBar(),
      // bottomNavigationBar: BottomNavigationBar(
      //   type: BottomNavigationBarType.fixed,
      //   onTap: _navigationShell.goBranch,
      //   items: [
      //     BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: "Dashboard"),
      //     BottomNavigationBarItem(icon: Icon(Icons.hearing), label: "Match"),
      //     BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Conversations"),
      //     BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
      //   ],
      //   // currentIndex: _selectedIndex,
      //   selectedItemColor: Colors.amber[800],
      //   // onTap: _onItemTapped,
      // ),
    );
  }
}
