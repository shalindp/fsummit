import 'package:flutter/material.dart';
import 'package:fsummit/widgets/customPaints/base-icon.dart';

class ProfileIcon extends AppIcon {
  @override
  void paint(Canvas canvas, Size size) {

  Path path_0 = Path();
  path_0.moveTo(size.width*0.5000000,0);
  path_0.cubicTo(size.width*0.4336958,0,size.width*0.3701075,size.height*0.02633921,size.width*0.3232233,size.height*0.07322333);
  path_0.cubicTo(size.width*0.2763392,size.height*0.1201075,size.width*0.2500000,size.height*0.1836958,size.width*0.2500000,size.height*0.2500000);
  path_0.cubicTo(size.width*0.2500000,size.height*0.3163042,size.width*0.2763392,size.height*0.3798925,size.width*0.3232233,size.height*0.4267750);
  path_0.cubicTo(size.width*0.3701075,size.height*0.4736625,size.width*0.4336958,size.height*0.5000000,size.width*0.5000000,size.height*0.5000000);
  path_0.cubicTo(size.width*0.5663042,size.height*0.5000000,size.width*0.6298917,size.height*0.4736625,size.width*0.6767750,size.height*0.4267750);
  path_0.cubicTo(size.width*0.7236625,size.height*0.3798925,size.width*0.7500000,size.height*0.3163042,size.width*0.7500000,size.height*0.2500000);
  path_0.cubicTo(size.width*0.7500000,size.height*0.1836958,size.width*0.7236625,size.height*0.1201075,size.width*0.6767750,size.height*0.07322333);
  path_0.cubicTo(size.width*0.6298917,size.height*0.02633921,size.width*0.5663042,0,size.width*0.5000000,0);
  path_0.close();
  path_0.moveTo(size.width*0.3750000,size.height*0.5625000);
  path_0.cubicTo(size.width*0.3086958,size.height*0.5625000,size.width*0.2451075,size.height*0.5888375,size.width*0.1982233,size.height*0.6357250);
  path_0.cubicTo(size.width*0.1513392,size.height*0.6826083,size.width*0.1250000,size.height*0.7461958,size.width*0.1250000,size.height*0.8125000);
  path_0.lineTo(size.width*0.1250000,size.height*0.8750000);
  path_0.cubicTo(size.width*0.1250000,size.height*0.9081500,size.width*0.1381696,size.height*0.9399458,size.width*0.1616117,size.height*0.9633875);
  path_0.cubicTo(size.width*0.1850538,size.height*0.9868292,size.width*0.2168479,size.height,size.width*0.2500000,size.height);
  path_0.lineTo(size.width*0.7500000,size.height);
  path_0.cubicTo(size.width*0.7831500,size.height,size.width*0.8149458,size.height*0.9868292,size.width*0.8383875,size.height*0.9633875);
  path_0.cubicTo(size.width*0.8618292,size.height*0.9399458,size.width*0.8750000,size.height*0.9081500,size.width*0.8750000,size.height*0.8750000);
  path_0.lineTo(size.width*0.8750000,size.height*0.8125000);
  path_0.cubicTo(size.width*0.8750000,size.height*0.7461958,size.width*0.8486625,size.height*0.6826083,size.width*0.8017750,size.height*0.6357250);
  path_0.cubicTo(size.width*0.7548917,size.height*0.5888375,size.width*0.6913042,size.height*0.5625000,size.width*0.6250000,size.height*0.5625000);
  path_0.lineTo(size.width*0.3750000,size.height*0.5625000);
  path_0.close();

  Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
  paint_0_fill.color = super.color ?? Colors.black.withOpacity(1.0);
  canvas.drawPath(path_0,paint_0_fill);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
  return true;
  }
  }