import 'package:flutter/material.dart';

class ChatIcon extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.2330150, size.height * 0.09655750);
    path_0.cubicTo(
      size.width * 0.1317981,
      size.height * 0.1482712,
      size.width * 0.06250000,
      size.height * 0.2535500,
      size.width * 0.06250000,
      size.height * 0.3750125,
    );
    path_0.cubicTo(
      size.width * 0.06250000,
      size.height * 0.4250031,
      size.width * 0.07423813,
      size.height * 0.4722531,
      size.width * 0.09510813,
      size.height * 0.5141531,
    );
    path_0.cubicTo(
      size.width * 0.1006544,
      size.height * 0.5252875,
      size.width * 0.1025003,
      size.height * 0.5380156,
      size.width * 0.09928500,
      size.height * 0.5500344,
    );
    path_0.lineTo(size.width * 0.08067219, size.height * 0.6195969);
    path_0.cubicTo(
      size.width * 0.07259219,
      size.height * 0.6497937,
      size.width * 0.1002191,
      size.height * 0.6774219,
      size.width * 0.1304172,
      size.height * 0.6693406,
    );
    path_0.lineTo(size.width * 0.1999809, size.height * 0.6507281);
    path_0.cubicTo(
      size.width * 0.2119978,
      size.height * 0.6475125,
      size.width * 0.2247253,
      size.height * 0.6493594,
      size.width * 0.2358603,
      size.height * 0.6549063,
    );
    path_0.cubicTo(
      size.width * 0.2777613,
      size.height * 0.6757750,
      size.width * 0.3250094,
      size.height * 0.6875156,
      size.width * 0.3750000,
      size.height * 0.6875156,
    );
    path_0.cubicTo(
      size.width * 0.5276656,
      size.height * 0.6875156,
      size.width * 0.6547625,
      size.height * 0.5780406,
      size.width * 0.6820719,
      size.height * 0.4333125,
    );
    path_0.cubicTo(
      size.width * 0.6304937,
      size.height * 0.4932844,
      size.width * 0.5540563,
      size.height * 0.5312625,
      size.width * 0.4687500,
      size.height * 0.5312625,
    );
    path_0.cubicTo(
      size.width * 0.3134188,
      size.height * 0.5312625,
      size.width * 0.1875000,
      size.height * 0.4053438,
      size.width * 0.1875000,
      size.height * 0.2500141,
    );
    path_0.cubicTo(
      size.width * 0.1875000,
      size.height * 0.1933966,
      size.width * 0.2042294,
      size.height * 0.1406866,
      size.width * 0.2330150,
      size.height * 0.09655750,
    );
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Color(0xff000000).withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.6820719, size.height * 0.4332969);
    path_1.cubicTo(
      size.width * 0.6856344,
      size.height * 0.4144094,
      size.width * 0.6875000,
      size.height * 0.3949219,
      size.width * 0.6875000,
      size.height * 0.3750000,
    );
    path_1.cubicTo(
      size.width * 0.6875000,
      size.height * 0.2024109,
      size.width * 0.5475875,
      size.height * 0.06250000,
      size.width * 0.3750000,
      size.height * 0.06250000,
    );
    path_1.cubicTo(
      size.width * 0.3264594,
      size.height * 0.06250000,
      size.width * 0.2805034,
      size.height * 0.07356719,
      size.width * 0.2395184,
      size.height * 0.09331594,
    );
    path_1.cubicTo(
      size.width * 0.2373362,
      size.height * 0.09436719,
      size.width * 0.2351684,
      size.height * 0.09544344,
      size.width * 0.2330150,
      size.height * 0.09654344,
    );
    path_1.cubicTo(
      size.width * 0.2042294,
      size.height * 0.1406725,
      size.width * 0.1875000,
      size.height * 0.1933825,
      size.width * 0.1875000,
      size.height * 0.2500000,
    );
    path_1.cubicTo(
      size.width * 0.1875000,
      size.height * 0.4053312,
      size.width * 0.3134188,
      size.height * 0.5312500,
      size.width * 0.4687500,
      size.height * 0.5312500,
    );
    path_1.cubicTo(
      size.width * 0.5540563,
      size.height * 0.5312500,
      size.width * 0.6304937,
      size.height * 0.4932719,
      size.width * 0.6820719,
      size.height * 0.4332969,
    );
    path_1.close();

    Paint paint_1_fill = Paint()..style = PaintingStyle.fill;
    paint_1_fill.color = Color(0xff000000).withOpacity(1.0);
    canvas.drawPath(path_1, paint_1_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
