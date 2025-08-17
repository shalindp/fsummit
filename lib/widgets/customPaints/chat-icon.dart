import 'package:flutter/material.dart';
import 'package:fsummit/widgets/customPaints/base-icon.dart';

class ChatIcon extends AppIcon {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.2728129, size.height * 0.05460625);
    path_0.cubicTo(size.width * 0.1108725, size.height * 0.1373450, 0, size.height * 0.3057842, 0, size.height * 0.5001167);
    path_0.cubicTo(0, size.height * 0.5801000, size.width * 0.01878025, size.height * 0.6556958, size.width * 0.05217083, size.height * 0.7227333);
    path_0.cubicTo(
      size.width * 0.06104458,
      size.height * 0.7405458,
      size.width * 0.06399792,
      size.height * 0.7609125,
      size.width * 0.05885375,
      size.height * 0.7801417,
    );
    path_0.lineTo(size.width * 0.02907433, size.height * 0.8914375);
    path_0.cubicTo(
      size.width * 0.01614688,
      size.height * 0.9397500,
      size.width * 0.06034792,
      size.height * 0.9839500,
      size.width * 0.1086633,
      size.height * 0.9710208,
    );
    path_0.lineTo(size.width * 0.2199608, size.height * 0.9412417);
    path_0.cubicTo(
      size.width * 0.2391871,
      size.height * 0.9361000,
      size.width * 0.2595500,
      size.height * 0.9390542,
      size.width * 0.2773654,
      size.height * 0.9479292,
    );
    path_0.cubicTo(
      size.width * 0.3444042,
      size.height * 0.9813167,
      size.width * 0.4200000,
      size.height * 1.000100,
      size.width * 0.4999792,
      size.height * 1.000100,
    );
    path_0.cubicTo(
      size.width * 0.7442333,
      size.height * 1.000100,
      size.width * 0.9475833,
      size.height * 0.8249500,
      size.width * 0.9912750,
      size.height * 0.5933917,
    );
    path_0.cubicTo(
      size.width * 0.9087542,
      size.height * 0.6893417,
      size.width * 0.7864583,
      size.height * 0.7501083,
      size.width * 0.6499750,
      size.height * 0.7501083,
    );
    path_0.cubicTo(
      size.width * 0.4014537,
      size.height * 0.7501083,
      size.width * 0.1999921,
      size.height * 0.5486458,
      size.width * 0.1999921,
      size.height * 0.3001267,
    );
    path_0.cubicTo(
      size.width * 0.1999921,
      size.height * 0.2095425,
      size.width * 0.2267579,
      size.height * 0.1252096,
      size.width * 0.2728129,
      size.height * 0.05460625,
    );
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = super.color ?? Colors.black.withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.9913167, size.height * 0.5932500);
    path_1.cubicTo(size.width * 0.9970167, size.height * 0.5630333, size.width, size.height * 0.5318542, size.width, size.height * 0.4999792);
    path_1.cubicTo(size.width, size.height * 0.2238483, size.width * 0.7761500, 0, size.width * 0.5000208, 0);
    path_1.cubicTo(size.width * 0.4223583, 0, size.width * 0.3488321, size.height * 0.01770679, size.width * 0.2832588, size.height * 0.04930333);
    path_1.cubicTo(
      size.width * 0.2797675,
      size.height * 0.05098542,
      size.width * 0.2762992,
      size.height * 0.05270750,
      size.width * 0.2728538,
      size.height * 0.05446750,
    );
    path_1.cubicTo(
      size.width * 0.2267983,
      size.height * 0.1250708,
      size.width * 0.2000325,
      size.height * 0.2094037,
      size.width * 0.2000325,
      size.height * 0.2999879,
    );
    path_1.cubicTo(
      size.width * 0.2000325,
      size.height * 0.5485083,
      size.width * 0.4014946,
      size.height * 0.7499708,
      size.width * 0.6500125,
      size.height * 0.7499708,
    );
    path_1.cubicTo(
      size.width * 0.7865000,
      size.height * 0.7499708,
      size.width * 0.9087958,
      size.height * 0.6892083,
      size.width * 0.9913167,
      size.height * 0.5932500,
    );
    path_1.close();

    Paint paint_1_fill = Paint()..style = PaintingStyle.fill;
    paint_1_fill.color = super.color ?? Colors.black.withOpacity(1.0);
    canvas.drawPath(path_1, paint_1_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
