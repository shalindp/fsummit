part of '../BottomNavbar.dart';

class _NavItem extends HookWidget {
  final bool _isActive;
  final void Function() _onTap;
  final CustomPainter Function({Color? color, Listenable? repaint}) painterBuilder;

  const _NavItem(
      {super.key, required bool isActive, required void Function() onTap, required this.painterBuilder})
      : _isActive = isActive,
        _onTap = onTap;

  @override
  Widget build(BuildContext context) {
    var animController = useAnimationController(duration: 0.milliseconds);

    useEffect((){
      if(_isActive){
        animController.forward();
      }else{
        animController.reverse();
      }
    },[_isActive]);

    return Expanded(
      child: GestureDetector(
        onTap: _onTap,
        child: Container(
          color: Colors.transparent,
          alignment: Alignment.center,
          width: AppIconSize.md.size.width,
          child: Animate(autoPlay: false, controller: animController).custom(
            duration: 320.milliseconds,
            builder: (context, value, listenable) {
              var color = Color.lerp(Colors.grey[300], AppTheme
                  .of(context)
                  .col10, value);
              return CustomPaint(
                size: AppIconSize.md.size,
                painter: painterBuilder(color: color),
              );
            },
          ),
        ),
      ),
    );
  }
}
