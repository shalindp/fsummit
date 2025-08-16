import 'package:flutter/material.dart';

class ProfileIcon extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.5000000, size.height * 0.1666667);
    path_0.arcToPoint(
      Offset(size.width * 0.5000000, size.height * 0.5000000),
      radius: Radius.elliptical(size.width * 0.1666667, size.height * 0.1666667),
      rotation: 0,
      largeArc: true,
      clockwise: false,
    );
    path_0.arcToPoint(
      Offset(size.width * 0.5000000, size.height * 0.1666667),
      radius: Radius.elliptical(size.width * 0.1666667, size.height * 0.1666667),
      rotation: 0,
      largeArc: false,
      clockwise: false,
    );
    path_0.close();
    path_0.moveTo(size.width * 0.4166667, size.height * 0.5416667);
    path_0.arcToPoint(
      Offset(size.width * 0.2500000, size.height * 0.7083333),
      radius: Radius.elliptical(size.width * 0.1666667, size.height * 0.1666667),
      rotation: 0,
      largeArc: false,
      clockwise: false,
    );
    path_0.lineTo(size.width * 0.2500000, size.height * 0.7500000);
    path_0.arcToPoint(
      Offset(size.width * 0.3333333, size.height * 0.8333333),
      radius: Radius.elliptical(size.width * 0.08333333, size.height * 0.08333333),
      rotation: 0,
      largeArc: false,
      clockwise: false,
    );
    path_0.lineTo(size.width * 0.6666667, size.height * 0.8333333);
    path_0.arcToPoint(
      Offset(size.width * 0.7500000, size.height * 0.7500000),
      radius: Radius.elliptical(size.width * 0.08333333, size.height * 0.08333333),
      rotation: 0,
      largeArc: false,
      clockwise: false,
    );
    path_0.lineTo(size.width * 0.7500000, size.height * 0.7083333);
    path_0.arcToPoint(
      Offset(size.width * 0.5833333, size.height * 0.5416667),
      radius: Radius.elliptical(size.width * 0.1666667, size.height * 0.1666667),
      rotation: 0,
      largeArc: false,
      clockwise: false,
    );
    path_0.lineTo(size.width * 0.4166667, size.height * 0.5416667);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Color(0xff000000).withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
