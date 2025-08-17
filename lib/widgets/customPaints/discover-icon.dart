import 'package:flutter/material.dart';
import 'package:fsummit/widgets/customPaints/base-icon.dart';

//Copy this CustomPainter code to the Bottom of the File
class DiscoverIcon extends AppIcon {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.5000000, 0);
    path_0.cubicTo(size.width * 0.2245000, 0, 0, size.height * 0.2245000, 0, size.height * 0.5000000);
    path_0.cubicTo(0, size.height * 0.7755000, size.width * 0.2245000, size.height, size.width * 0.5000000, size.height);
    path_0.cubicTo(size.width * 0.7755000, size.height, size.width, size.height * 0.7755000, size.width, size.height * 0.5000000);
    path_0.cubicTo(size.width, size.height * 0.2245000, size.width * 0.7755000, 0, size.width * 0.5000000, 0);
    path_0.close();
    path_0.moveTo(size.width * 0.4250000, size.height * 0.7065000);
    path_0.cubicTo(
      size.width * 0.3525000,
      size.height * 0.7065000,
      size.width * 0.2940000,
      size.height * 0.6475000,
      size.width * 0.2940000,
      size.height * 0.5755000,
    );
    path_0.cubicTo(
      size.width * 0.2940000,
      size.height * 0.4205000,
      size.width * 0.4200000,
      size.height * 0.2945000,
      size.width * 0.5750000,
      size.height * 0.2945000,
    );
    path_0.cubicTo(
      size.width * 0.6475000,
      size.height * 0.2945000,
      size.width * 0.7060000,
      size.height * 0.3535000,
      size.width * 0.7060000,
      size.height * 0.4255000,
    );
    path_0.cubicTo(
      size.width * 0.7060000,
      size.height * 0.5800000,
      size.width * 0.5800000,
      size.height * 0.7065000,
      size.width * 0.4250000,
      size.height * 0.7065000,
    );
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = super.color ?? Colors.black.withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
