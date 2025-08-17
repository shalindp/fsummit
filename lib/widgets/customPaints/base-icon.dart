import 'package:flutter/material.dart';

class AppIcon extends CustomPainter {
  Color? color;

  AppIcon({super.repaint, this.color});

  @override
  void paint(Canvas canvas, Size size) {
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
