import 'package:flutter/material.dart';
import 'package:fsummit/theme/theme.dart';

import '../../../services/appModule.dart';
import '../../../services/uiService.dart';

class ChatPage extends StatelessWidget {
  late UiService _uiService;

  ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    print("build chat");
    _uiService = locator.get<UiService>();
    _uiService.updateAppBar(_Header());

    return Container(
      color: AppTheme.of(context).col60,
      child: Padding(
        padding: const EdgeInsets.only(top: 0),
        child: Column(
          children: [
            // _Header(),
            _Conversation(),
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
        spacing: 10,
        children: [
          Text("<", style: TextStyle(color: Colors.white, fontSize: 16)),
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
  Size get preferredSize =>  const Size.fromHeight(56);
}

class _Conversation extends StatelessWidget {
  const _Conversation({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 500,
        padding: const EdgeInsets.all(0),
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(backgroundColor: Colors.blue, child: Text('U$index')),
            title: Text('User $index'),
            subtitle: Text('Message from user $index'),
            trailing: Text('10:${index % 60}'),
          );
        },
      ),
    );
  }
}
