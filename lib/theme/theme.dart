import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData lightTheme = ThemeData.light().copyWith(extensions: <ThemeExtension<dynamic>>[AppColors.light]);

  static final ThemeData darkTheme = ThemeData.dark().copyWith(extensions: <ThemeExtension<dynamic>>[AppColors.dark]);

  static AppColors of(BuildContext context) {
    return Theme.of(context).extension<AppColors>()!;
  }

  // #region spacing
  static const double s0 = 0;
  static const double s0_5 = 2;
  static const double s1 = 4;
  static const double s1_5 = 6;
  static const double s2 = 8;
  static const double s2_5 = 10;
  static const double s3 = 12;
  static const double s3_5 = 14;
  static const double s4 = 16;
  static const double s5 = 20;
  static const double s6 = 24;
  static const double s7 = 28;
  static const double s8 = 32;
  static const double s9 = 36;
  static const double s10 = 40;
  static const double s11 = 44;
  static const double s12 = 48;
  static const double s14 = 56;
  static const double s16 = 64;
  static const double s20 = 80;
  static const double s24 = 96;
  static const double s28 = 112;
  static const double s32 = 128;
  static const double s36 = 144;
  static const double s40 = 160;
  static const double s44 = 176;
  static const double s48 = 192;
  static const double s52 = 208;
  static const double s56 = 224;
  static const double s60 = 240;
  static const double s64 = 256;
  static const double s72 = 288;
  static const double s80 = 320;
  static const double s96 = 384;
  // #endregion
}

@immutable
class AppColors extends ThemeExtension<AppColors> {
  final Color? col10;
  final Color? col30;
  final Color? col60;

  const AppColors({required this.col10, required this.col30, required this.col60});

  @override
  ThemeExtension<AppColors> copyWith({Color? col10, Color? col30, Color? col60}) {
    return AppColors(col10: col10 ?? this.col10, col30: col30 ?? this.col30, col60: col60 ?? this.col60);
  }

  @override
  ThemeExtension<AppColors> lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this;

    return AppColors(col10: Color.lerp(col10, other.col10, t), col30: Color.lerp(col30, other.col30, t), col60: Color.lerp(col60, other.col60, t));
  }

  static const light = AppColors(col10: Color(0xFF4356FF), col30: Color(0xFF2C2C2C), col60: Color(0xFFFFFFFF));

  static const dark = AppColors(col10: Color(0xFF4356FF), col30: Color(0xFFCCCCCC), col60: Color(0xFF030303));
}
