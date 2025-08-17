part of '../bottom-nav-bar.dart';

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
    duration: 200.milliseconds,
  );

  @override
  void didUpdateWidget(covariant _navItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget._isActive) {
      HapticFeedback.lightImpact();
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
          width: AppIconSIze.md.size.width,
          child: Animate(autoPlay: false, controller: _controller).custom(
            duration: 320.milliseconds,
            builder: (context, value, listenable) {
              const Color myColor = Color(0xFF615EFC);
              var color =  Color.lerp(Colors.grey[300], myColor, value);
              return CustomPaint(
                size: AppIconSIze.md.size,
                painter: widget.painterBuilder(color: color),
              );
            },
          ),
        ),
      ),
    );
  }
}
