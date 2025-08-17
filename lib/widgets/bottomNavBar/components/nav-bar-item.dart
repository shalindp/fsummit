part of '../bottom-nav-bar.dart';

class _navItem extends StatelessWidget {
  final bool _isActive;
  final void Function() _onTap;
  final AppIcon _icon;

  const _navItem({super.key, required bool isActive, required void Function() onTap, required AppIcon icon}) : _isActive = isActive, _onTap = onTap, _icon = icon;

  @override
  Widget build(BuildContext context) {
    _icon.color = _isActive ? Colors.pink : Colors.grey[600]!;

    return Expanded(
      child: GestureDetector(
        onTap: _onTap,
        child: Container(
          color: Colors.transparent,
          alignment: Alignment.center,
          width: AppIconSIze.md.size.width,
          child: CustomPaint(size: AppIconSIze.md.size, painter: _icon),
        ),
      ),
    );
  }
}
