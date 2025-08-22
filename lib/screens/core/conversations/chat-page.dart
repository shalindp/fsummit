import 'package:flutter/material.dart';
import 'package:fsummit/naviagtion/router-map.dart';
import 'package:fsummit/theme/theme.dart';
import 'package:fsummit/widgets/customPaints/constants.dart';
import 'package:fsummit/widgets/customPaints/leftChevron.dart';
import 'package:go_router/go_router.dart';

import '../../../api/apiTypes.dart';
import '../../../services/appModule.dart';
import '../../../services/navigationService.dart';
import '../../../services/uiService.dart';

class ChatPage extends StatelessWidget {
  final _uiService = locator.get<UiService>();
  final _navService = locator.get<NavigationService>();

  ChatPage({super.key}) {
    if (_navService.activeRouter == AppRoute.chat) {
      _uiService.updateAppBar(_ChatHeader());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.of(context).col60,
      child: Padding(
        padding: const EdgeInsets.only(top: 0),
        child: Column(children: [_Conversation()]),
      ),
    );
  }
}

class _ChatHeader extends StatelessWidget implements PreferredSizeWidget {
  static const height = 56.0;

  const _ChatHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final double topPadding = MediaQuery.of(context).padding.top;

    return Container(
      padding: EdgeInsets.only(top: topPadding, right: 16),
      height: preferredSize.height + topPadding,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              GoRouter.of(context).pop();
            },
            child: Container(
              color: Colors.transparent,
              height: height,
              padding: const EdgeInsets.only(right: 16),
              child: Align(
                alignment: Alignment.center,
                child: CustomPaint(
                  size: AppIconSize.md.size,
                  painter: LeftChevronIcon(color: AppTheme.of(context).col30),
                ),
              ),
            ),
          ),
          Row(
            spacing: 16,
            children: [
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
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(height);
}


class _Conversation extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();

  _Conversation({super.key}){
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   _scrollController.jumpTo(
    //     _scrollController.position.maxScrollExtent,
    //   );
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        controller: _scrollController,
        itemCount: MockData.conv1Messages.length,
        reverse: true, // so newest is at the bottom
        itemBuilder: (context, index) {
          final message = MockData.conv1Messages[index];
          final isMe = message.sender == MockData.users1; // or compare to current user

          return _Message(message: message, isMe: isMe);
        },
      ),
    );
  }
}

class _Message extends StatelessWidget {
  final Message message;
  final bool isMe;

  const _Message({super.key, required this.message, required this.isMe});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isMe ? AppTheme.of(context).col10 : Colors.grey[900],
          borderRadius: BorderRadius.circular(18),
        ),
        child: Text(
          message.content.trim(),
          style: TextStyle(fontSize: 16, color: isMe ? Colors.white : Colors.white),
        ),
      ),
    );
  }
}
