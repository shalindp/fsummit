import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    extensions: <ThemeExtension<dynamic>>[
      AppColors.light,
    ],
  );

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    extensions: <ThemeExtension<dynamic>>[
      AppColors.dark,
    ],
  );

  static AppColors of(BuildContext context) {
    return Theme.of(context).extension<AppColors>()!;
  }
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
