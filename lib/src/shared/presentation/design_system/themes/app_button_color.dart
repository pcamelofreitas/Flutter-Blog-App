import 'package:blog_app_2/src/shared/presentation/design_system/tokens/color_tokens.dart';
import 'package:flutter/material.dart';

@immutable
class AppButtonColor {
  final Color base;
  final Color foreground;
  final Color focusedBackground;
  final Color focusedForeround;
  final Color disabledBackground;
  final Color disabledForeround;

  const AppButtonColor(
    this.base, {
    this.foreground = ColorTokens.neutralLightest,
    this.focusedBackground = ColorTokens.neutral,
    this.focusedForeround = ColorTokens.neutralLightest,
    this.disabledBackground = ColorTokens.neutralMediumDark,
    this.disabledForeround = ColorTokens.neutralLightest,
  });

  static const AppButtonColor primary = AppButtonColor(
    ColorTokens.neutralMediumDark,
    disabledBackground: ColorTokens.neutral,
    disabledForeround: ColorTokens.neutralMediumLight,
    focusedBackground: ColorTokens.neutral,
    focusedForeround: ColorTokens.neutralMediumDark,
    foreground: ColorTokens.neutralLightest,
  );

  static const AppButtonColor outline = AppButtonColor(
    ColorTokens.neutralLightest,
    disabledBackground: ColorTokens.neutralMediumLight,
    disabledForeround: ColorTokens.neutralLight,
    focusedBackground: ColorTokens.neutralMediumLight,
    focusedForeround: ColorTokens.neutralLight,
    foreground: ColorTokens.neutralDarkest,
  );
}
