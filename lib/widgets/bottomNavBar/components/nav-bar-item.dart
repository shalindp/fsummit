part of '../BottomNavbar.dart';

class _navItem extends StatefulWidget {
  final bool _isActive;
  final void Function() _onTap;
  final CustomPainter Function({Color? color, Listenable? repaint}) painterBuilder;

  _navItem({super.key, required bool isActive, required void Function() onTap, required this.painterBuilder}) : _isActive = isActive, _onTap = onTap;

  @override
  State<_navItem> createState() => _navItemState();
}

class _navItemState extends State<_navItem> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: 100.milliseconds,
  );


  @override
  void initState() {
    super.initState();
    if (widget._isActive) {
      _controller.forward();
    }
  }

  @override
  void didUpdateWidget(covariant _navItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget._isActive) {
      // HapticFeedback.lightImpact();
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: widget._onTap,
        child: Container(
          color: Colors.transparent,
          alignment: Alignment.center,
          width: AppIconSize.md.size.width,
          child: Animate(autoPlay: false, controller: _controller).custom(
            duration: 320.milliseconds,
            builder: (context, value, listenable) {
              var color =  Color.lerp(Colors.grey[300], AppTheme.of(context).col10, value);
              return CustomPaint(
                size: AppIconSize.md.size,
                painter: widget.painterBuilder(color: color),
              );
            },
          ),
        ),
      ),
    );
  }
}
