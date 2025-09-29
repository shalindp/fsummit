import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:fsummit/naviagtion/RouterMap.dart';
import 'package:fsummit/theme/theme.dart';
import 'package:fsummit/constants/iconConstants.dart';
import 'package:fsummit/widgets/customPaints/leftChevron.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:keyboard_height_plugin/keyboard_height_plugin.dart';
import 'package:signals/signals_flutter.dart';

import '../../../../api/apiTypes.dart';
import '../../../../constants/animationConstants.dart';
import '../../../../services/navigationService.dart';
import '../../../../services/uiService.dart';

part './widgets/ChatHeader.dart';
part './widgets/ChatList.dart';
part './widgets/ChatInput.dart';

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
      color: AppTheme.of(context).col60,
      child: Padding(
        padding: EdgeInsets.only(),
        child: Column(
          children: [
            _ChatHeader(),
            _ChatList(uiService: _uiService, scrollController: _scrollController, keyboardHeightSignal: _keyboardHeightSignal),
            _ChatInput(focusNode: _focusNode),
          ],
        ),
      ),
    );
  }
}


