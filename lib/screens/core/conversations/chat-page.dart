import 'package:flutter/material.dart';
import 'package:fsummit/naviagtion/router-map.dart';
import 'package:fsummit/theme/theme.dart';
import 'package:fsummit/widgets/customPaints/constants.dart';
import 'package:fsummit/widgets/customPaints/leftChevron.dart';
import 'package:go_router/go_router.dart';

import '../../../services/appModule.dart';
import '../../../services/navigationService.dart';
import '../../../services/uiService.dart';

class ChatPage extends StatelessWidget {
  final _uiService = locator.get<UiService>();
  final _navService = locator.get<NavigationService>();

  ChatPage({super.key}) {
    // WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_navService.activeRouter == AppRoute.chat) {
        _uiService.updateAppBar(_ChatHeader());
      }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.of(context).col60,
      child: Padding(
        padding: const EdgeInsets.only(top: 0),
        child: Column(
          children: [
            // _Conversation(),
          ],
        ),
      ),
    );
  }
}

class _ChatHeader extends StatelessWidget implements PreferredSizeWidget {
  const _ChatHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double topPadding = MediaQuery.of(context).padding.top;

    return Container(
      padding: EdgeInsets.only(top: topPadding, left: 16, right: 16),
      height: preferredSize.height + topPadding,
      child: Row(
        spacing: 16,
        children: [
          GestureDetector(
            onTap: () {
              GoRouter.of(context).pop();
            },
            child: CustomPaint(
              painter: LeftChevronIcon(color: AppTheme.of(context).col30),
              size: AppIconSize.sm.size,
            ),
          ),
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(color: Colors.grey[300], shape: BoxShape.circle),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Kawya',
                style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text('Active 40m ago', style: TextStyle(color: Colors.grey[400], fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
