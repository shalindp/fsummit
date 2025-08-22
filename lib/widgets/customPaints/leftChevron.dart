import 'package:flutter/material.dart';

class LeftChevronIcon extends CustomPainter {
  Color? color = Colors.black;

  LeftChevronIcon({super.repaint, this.color});

  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width*0.7083333,size.height*0.08333333);
    path_0.lineTo(size.width*0.2916667,size.height*0.5000000);
    path_0.lineTo(size.width*0.7083333,size.height*0.9166667);

    Paint paint_0_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.1250000;
    paint_0_stroke.color= color!;
    paint_0_stroke.strokeCap = StrokeCap.round;
    paint_0_stroke.strokeJoin = StrokeJoin.round;
    canvas.drawPath(path_0,paint_0_stroke);

    Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
    paint_0_fill.color = Colors.transparent;
    canvas.drawPath(path_0,paint_0_fill);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}