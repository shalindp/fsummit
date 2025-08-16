import 'package:flutter/material.dart';

enum AppIconSIze {
  sm(Size(16, 16)),
  md(Size(24, 24)),
  lg(Size(38, 38)),
  ;

  final Size size;
  const AppIconSIze(this.size);
}