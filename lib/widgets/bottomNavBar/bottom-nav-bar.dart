import 'package:flutter/material.dart';
import 'package:fsummit/widgets/customPaints/chat-icon.dart';
import 'package:fsummit/widgets/customPaints/constants.dart';
import 'package:fsummit/widgets/customPaints/match-icon.dart';
import 'package:fsummit/widgets/customPaints/profile-icon.dart';

import '../customPaints/discover-icon.dart';

class AppBottomNavBar extends StatelessWidget {
  AppBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    double bottomPadding = MediaQuery.of(context).padding.bottom;

    return Container(
      color: Colors.grey[300],
      height: 56 + bottomPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomPaint(
            size: AppIconSIze.lg.size,
            painter: DiscoverIcon(color: Colors.blueAccent),
          ),
          CustomPaint(
            size: AppIconSIze.lg.size,
            painter: MatchIcon(),
          ),
          CustomPaint(
            size: AppIconSIze.lg.size,
            painter: ChatIcon(),
          ),
          CustomPaint(
            size: AppIconSIze.lg.size,
            painter: ProfileIcon(),
          ),
        ],
      ),
    );
  }
}
