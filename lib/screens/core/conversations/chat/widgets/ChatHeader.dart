part of '../ChatPage.dart';

class _ChatHeader extends StatelessWidget implements PreferredSizeWidget {
  static const height = 56.0;

  const _ChatHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final double topPadding = MediaQuery.of(context).padding.top;

    return Container(
      padding: EdgeInsets.only(top: topPadding, right: AppTheme.s4),
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
              padding: const EdgeInsets.only(right: AppTheme.s4),
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
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  shape: BoxShape.circle,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Kawya',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Active 40m ago',
                    style: TextStyle(color: Colors.grey[400], fontSize: 12),
                  ),
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
