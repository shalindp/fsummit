import 'package:flutter/material.dart';

//Copy this CustomPainter code to the Bottom of the File
class DiscoverIcon extends CustomPainter {
  final Color? color;

  DiscoverIcon({this.color});

  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.3750000, size.height * 0.06250000);
    path_0.cubicTo(
      size.width * 0.2028125,
      size.height * 0.06250000,
      size.width * 0.06250000,
      size.height * 0.2028125,
      size.width * 0.06250000,
      size.height * 0.3750000,
    );
    path_0.cubicTo(
      size.width * 0.06250000,
      size.height * 0.5471875,
      size.width * 0.2028125,
      size.height * 0.6875000,
      size.width * 0.3750000,
      size.height * 0.6875000,
    );
    path_0.cubicTo(
      size.width * 0.5471875,
      size.height * 0.6875000,
      size.width * 0.6875000,
      size.height * 0.5471875,
      size.width * 0.6875000,
      size.height * 0.3750000,
    );
    path_0.cubicTo(
      size.width * 0.6875000,
      size.height * 0.2028125,
      size.width * 0.5471875,
      size.height * 0.06250000,
      size.width * 0.3750000,
      size.height * 0.06250000,
    );
    path_0.close();
    path_0.moveTo(size.width * 0.3281250, size.height * 0.5040625);
    path_0.cubicTo(
      size.width * 0.2828125,
      size.height * 0.5040625,
      size.width * 0.2462500,
      size.height * 0.4671875,
      size.width * 0.2462500,
      size.height * 0.4221875,
    );
    path_0.cubicTo(
      size.width * 0.2462500,
      size.height * 0.3253125,
      size.width * 0.3250000,
      size.height * 0.2465625,
      size.width * 0.4218750,
      size.height * 0.2465625,
    );
    path_0.cubicTo(
      size.width * 0.4671875,
      size.height * 0.2465625,
      size.width * 0.5037500,
      size.height * 0.2834375,
      size.width * 0.5037500,
      size.height * 0.3284375,
    );
    path_0.cubicTo(
      size.width * 0.5037500,
      size.height * 0.4250000,
      size.width * 0.4250000,
      size.height * 0.5040625,
      size.width * 0.3281250,
      size.height * 0.5040625,
    );
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = color ??  Color(0xffff5151).withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
