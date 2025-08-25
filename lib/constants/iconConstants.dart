import 'package:flutter/material.dart';

enum AppIconSize {
  sm(Size(22, 22)),
  md(Size(24, 24)),
  lg(Size(38, 38)),
  ;

  final Size size;
  const AppIconSize(this.size);
}