import 'package:flutter/material.dart';

class MatchIcon  extends CustomPainter {
  Color? color;

  MatchIcon({super.repaint, this.color});

  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.3053133, size.height * 0.8730958);
    path_0.cubicTo(size.width * 0.1649096, size.height * 0.7649208, 0, size.height * 0.6378625, 0, size.height * 0.4176083);
    path_0.cubicTo(0, size.height * 0.1744625, size.width * 0.2750079, size.height * 0.002027650, size.width * 0.5000000, size.height * 0.2357858);
    path_0.lineTo(size.width * 0.6000000, size.height * 0.3357183);
    path_0.cubicTo(
      size.width * 0.6146458,
      size.height * 0.3503604,
      size.width * 0.6383917,
      size.height * 0.3503558,
      size.width * 0.6530333,
      size.height * 0.3357083,
    );
    path_0.cubicTo(
      size.width * 0.6676750,
      size.height * 0.3210617,
      size.width * 0.6676708,
      size.height * 0.2973179,
      size.width * 0.6530250,
      size.height * 0.2826758,
    );
    path_0.lineTo(size.width * 0.5564250, size.height * 0.1861104);
    path_0.cubicTo(size.width * 0.7684250, size.height * 0.03090896, size.width, size.height * 0.1944871, size.width, size.height * 0.4176083);
    path_0.cubicTo(size.width, size.height * 0.6378625, size.width * 0.8350917, size.height * 0.7649208, size.width * 0.6946833, size.height * 0.8730958);
    path_0.cubicTo(
      size.width * 0.6800958,
      size.height * 0.8843375,
      size.width * 0.6657667,
      size.height * 0.8953792,
      size.width * 0.6519167,
      size.height * 0.9063000,
    );
    path_0.cubicTo(
      size.width * 0.6000000,
      size.height * 0.9472250,
      size.width * 0.5500000,
      size.height * 0.9857542,
      size.width * 0.5000000,
      size.height * 0.9857542,
    );
    path_0.cubicTo(
      size.width * 0.4500000,
      size.height * 0.9857542,
      size.width * 0.4000000,
      size.height * 0.9472250,
      size.width * 0.3480867,
      size.height * 0.9063000,
    );
    path_0.cubicTo(
      size.width * 0.3342354,
      size.height * 0.8953792,
      size.width * 0.3199071,
      size.height * 0.8843375,
      size.width * 0.3053133,
      size.height * 0.8730958,
    );
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = color ?? Colors.black.withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
