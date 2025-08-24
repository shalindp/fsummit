import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:fsummit/naviagtion/router-map.dart';
import 'package:fsummit/theme/theme.dart';
import 'package:fsummit/widgets/customPaints/constants.dart';
import 'package:fsummit/widgets/customPaints/leftChevron.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:keyboard_height_plugin/keyboard_height_plugin.dart';
import 'package:signals/signals_flutter.dart';

import '../../../api/apiTypes.dart';
import '../../../services/navigationService.dart';
import '../../../services/uiService.dart';

class ChatPage extends StatefulWidget {

  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final _uiService = GetIt.I<UiService>();
  final _navService = GetIt.I<NavigationService>();

  final _keyboardHeightPlugin = KeyboardHeightPlugin();
  final _focusNode = FocusNode();
  final _scrollController = ScrollController();
  final _keyboardHeightSignal = signal<double>(0);

  @override
  void initState() {
    super.initState();
    _keyboardHeightPlugin.onKeyboardHeightChanged((double height) {
      _keyboardHeightSignal.set(height);
    });

    // _uiService.appBottomNavBarVisibleSignal.set(false);
  }

  @override
  void dispose() {
    super.dispose();
    // _uiService.appBottomNavBarVisibleSignal.set(true);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme
          .of(context)
          .col60,
      child: Padding(
        padding: EdgeInsets.only(),
        child: Column(
          children: [
            _ChatHeader(),
            _Conversation(uiService: _uiService, scrollController: _scrollController, keyboardHeightSignal: _keyboardHeightSignal),
            _BottomBar(focusNode: _focusNode),
          ],
        ),
      ),
    );
  }
}

class _ChatHeader extends StatelessWidget implements PreferredSizeWidget {
  static const height = 56.0;

  const _ChatHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final double topPadding = MediaQuery
        .of(context)
        .padding
        .top;

    return Container(
      padding: EdgeInsets.only(top: topPadding, right: 16),
      height: preferredSize.height + topPadding,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
              if (GoRouter.of(context).canPop()) {
                GoRouter.of(context).pop();
              }
            },
            child: Container(
              color: Colors.transparent,
              height: height,
              padding: const EdgeInsets.only(right: 16),
              child: Align(
                alignment: Alignment.center,
                child: CustomPaint(
                  size: AppIconSize.md.size,
                  painter: LeftChevronIcon(color: AppTheme
                      .of(context)
                      .col30),
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
  final UiService _uiService;
  final ScrollController _scrollController;
  final FlutterSignal<double> _keyboardHeightSignal;

  const _Conversation({
    super.key,
    required UiService uiService,
    required ScrollController scrollController,
    required FlutterSignal<double> keyboardHeightSignal,
  })
      : _uiService = uiService,
        _scrollController = scrollController,
        _keyboardHeightSignal = keyboardHeightSignal;

  @override
  Widget build(BuildContext context) {
    double maxHeight = _uiService.maxHeight - _uiService.safeArea.top - _ChatHeader.height - _BottomBar.height;
    if (_keyboardHeightSignal.peek() == 0) {
      maxHeight = maxHeight - _uiService.safeArea.bottom;
    }

    return AnimatedSize(
      duration: _uiService.wasKeyboardUp ? 300.milliseconds : 150.milliseconds,
      curve: _uiService.wasKeyboardUp ? Curves.easeOutCubic : Curves.easeIn,
      onEnd: () {
        _uiService.wasKeyboardUp = _keyboardHeightSignal.peek() > 0;
      },
      child: SizedBox(
        height: _keyboardHeightSignal.watch(context) > 0 ? maxHeight - _keyboardHeightSignal.peek() : maxHeight,
        child: ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 16),
          controller: _scrollController,
          itemCount: MockData.conv1Messages.length,
          reverse: true,
          itemBuilder: (context, index) {
            final message = MockData.conv1Messages[index];
            final isMe = message.sender == MockData.users1;

            return _MessageBubble(message: message, isMe: isMe);
          },
        ),
      ),
    );
  }
}

class _MessageBubble extends StatelessWidget {
  final Message message;
  final bool isMe;

  const _MessageBubble({super.key, required this.message, required this.isMe});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(color: isMe ? AppTheme
            .of(context)
            .col10 : Colors.grey[900], borderRadius: BorderRadius.circular(18)),
        child: Text(message.content.trim(), style: TextStyle(fontSize: 16, color: isMe ? Colors.white : Colors.white)),
      ),
    );
  }
}

class _BottomBar extends StatelessWidget {
  final FocusNode _focusNode;

  static const height = 56.0;

  const _BottomBar({super.key, required FocusNode focusNode}) : _focusNode = focusNode;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(top: 10),
        child: Row(
          children: [
            Align(
              alignment: AlignmentGeometry.topCenter,
              child: Container(
                height: 38,
                width: 260,
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(99),
                    color: Color(0xFF0C0C0C)
                ),
                child: Align(
                  alignment: AlignmentGeometry.center,
                  child: TextField(
                    focusNode: _focusNode,
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                      // contentPadding: EdgeInsets.zero,
                      hintText: "Aa",
                      border: OutlineInputBorder(
                        // borderRadius: BorderRadius.circular(99),
                        borderSide: BorderSide.none, // remove border if you want
                      ),
                      // focusedBorder: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
