import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../services/appModule.dart';
import '../../../services/uiService.dart';
import '../../../theme/theme.dart';
import '../../../widgets/customPaints/constants.dart';
import '../../../widgets/customPaints/leftChevron.dart';

class ConversationsPage extends StatelessWidget {
  ConversationsPage({super.key});

  late final UiService _uiService =  locator.get<UiService>();

  @override
  Widget build(BuildContext context) {
    _uiService.updateAppBar(_Header());

    return SizedBox(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("ConversationsPage"),
            ElevatedButton(
              onPressed: () {
                context.push('/chat');
              },
              child: Text("Go to chat"),
            ),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget implements PreferredSizeWidget {
  const _Header({super.key});

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
