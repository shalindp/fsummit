part of '../ChatPage.dart';

class _ChatList extends HookWidget {
  final UiService _uiService;
  final ScrollController _scrollController;
  final FlutterSignal<double> _keyboardHeightSignal;

  const _ChatList({
    required UiService uiService,
    required ScrollController scrollController,
    required FlutterSignal<double> keyboardHeightSignal,
  }) : _uiService = uiService,
       _scrollController = scrollController,
       _keyboardHeightSignal = keyboardHeightSignal;

  @override
  Widget build(BuildContext context) {
    double maxHeight =
        _uiService.maxHeight -
        _uiService.safeArea.top -
        _ChatHeader.height -
        _ChatInput.height;
    if (_keyboardHeightSignal.peek() == 0) {
      maxHeight = maxHeight - _uiService.safeArea.bottom;
    }

    return AnimatedSize(
      duration: _uiService.wasKeyboardUp ? 300.milliseconds : 250.milliseconds,
      curve: _uiService.wasKeyboardUp
          ? Curves.easeOutCubic
          : AppAnimation.iosCurve,
      onEnd: () {
        _uiService.wasKeyboardUp = _keyboardHeightSignal.peek() > 0;
      },
      child: SizedBox(
        height: _keyboardHeightSignal.watch(context) > 0
            ? maxHeight - _keyboardHeightSignal.peek()
            : maxHeight,
        child: ListView.builder(
          padding: EdgeInsets.symmetric(vertical: AppTheme.s4),
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
        decoration: BoxDecoration(
          color: isMe ? AppTheme.of(context).col10 : Colors.grey[900],
          borderRadius: BorderRadius.circular(18),
        ),
        child: Text(
          message.content.trim(),
          style: TextStyle(
            fontSize: 16,
            color: isMe ? Colors.white : Colors.white,
          ),
        ),
      ),
    );
  }
}
