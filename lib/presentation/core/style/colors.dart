//Light pallet

import 'package:flutter/material.dart';

const backgroundColorLight = Color(0xFFFAFDFF);
const textColorLight = Color(0xFF171C26);
const secondaryColorLight = Color(0xFF9D2C56);
const primaryColorLight = Color(0xFFD17438);
const shadowColorLight = Color(0x26000000);
const errorColorLight = Color(0xFFFF2D2D);

class AppColors extends ThemeExtension<AppColors> {
  final Color? text;
  final Color? secondary;
  final Color? primary;
  final Color? background;
  final Color? shadow;
  final Color? error;


  const AppColors({
    required this.text,
    required this.secondary,
    required this.primary,
    required this.background,
    required this.shadow,
    required this.error,
  });

  @override
  AppColors copyWith({
    final Color? text,
    final Color? secondary,
    final Color? primary,
    final Color? background,
    final Color? shadow,
    final Color? error,
  }) =>
      AppColors(
        text: text ?? this.text,
        secondary: secondary ?? this.secondary,
        primary: primary ?? this.primary,
        background: background ?? this.background,
        shadow: shadow ?? this.shadow,
        error: error ?? this.error,
      );

  @override
  ThemeExtension<AppColors> lerp(covariant ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) {
      return this;
    }

    return AppColors(
      text: Color.lerp(text, other.text, t),
      secondary: Color.lerp(secondary, other.secondary, t),
      primary: Color.lerp(primary, other.primary, t),
      background: Color.lerp(background, other.background, t),
      shadow: Color.lerp(shadow, other.shadow, t),
      error: Color.lerp(error, other.error, t),
    );
  }
}
