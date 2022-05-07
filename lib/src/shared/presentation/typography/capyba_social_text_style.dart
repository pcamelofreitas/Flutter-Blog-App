import 'package:blog_app_2/src/shared/presentation/design_system/tokens/typography_tokens.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

@immutable
class CapybaSocialTextStyle {
  final TextStyle style;

  const CapybaSocialTextStyle._(this.style);

  static CapybaSocialTextStyle headline1 = CapybaSocialTextStyle._(
    GoogleFonts.inter(
      textStyle: const TextStyle(
        fontSize: FontSizeTokens.weka,
        fontWeight: FontWeightTokens.light,
        letterSpacing: LetterSpacingTokens.deka,
      ),
    ),
  );
  static CapybaSocialTextStyle headline2 = CapybaSocialTextStyle._(
    GoogleFonts.inter(
      textStyle: const TextStyle(
        fontSize: FontSizeTokens.yotta,
        fontWeight: FontWeightTokens.light,
        letterSpacing: LetterSpacingTokens.hecto,
      ),
    ),
  );
  static CapybaSocialTextStyle headline3 = CapybaSocialTextStyle._(
    GoogleFonts.inter(
      textStyle: const TextStyle(
        fontSize: FontSizeTokens.zetta,
        fontWeight: FontWeightTokens.regular,
        letterSpacing: LetterSpacingTokens.kilo,
      ),
    ),
  );
  static CapybaSocialTextStyle headline4 = CapybaSocialTextStyle._(
    GoogleFonts.inter(
      textStyle: const TextStyle(
        fontSize: FontSizeTokens.exa,
        fontWeight: FontWeightTokens.regular,
        letterSpacing: LetterSpacingTokens.tera,
      ),
    ),
  );
  static CapybaSocialTextStyle headline5 = CapybaSocialTextStyle._(
    GoogleFonts.inter(
      textStyle: const TextStyle(
        fontSize: FontSizeTokens.peta,
        fontWeight: FontWeightTokens.regular,
        letterSpacing: LetterSpacingTokens.kilo,
      ),
    ),
  );
  static CapybaSocialTextStyle headline6 = CapybaSocialTextStyle._(
    GoogleFonts.inter(
      textStyle: const TextStyle(
        fontSize: FontSizeTokens.giga,
        fontWeight: FontWeightTokens.regular,
        letterSpacing: LetterSpacingTokens.giga,
      ),
    ),
  );
  static CapybaSocialTextStyle headline7 = CapybaSocialTextStyle._(
    GoogleFonts.inter(
      textStyle: const TextStyle(
        fontSize: FontSizeTokens.giga,
        fontWeight: FontWeightTokens.light,
        letterSpacing: LetterSpacingTokens.giga,
      ),
    ),
  );
  static CapybaSocialTextStyle subtitle1 = CapybaSocialTextStyle._(
    GoogleFonts.inter(
      textStyle: const TextStyle(
        fontSize: FontSizeTokens.zetta,
        fontWeight: FontWeightTokens.regular,
        letterSpacing: LetterSpacingTokens.giga,
      ),
    ),
  );
  static CapybaSocialTextStyle subtitle2 = CapybaSocialTextStyle._(
    GoogleFonts.inter(
      textStyle: const TextStyle(
        fontSize: FontSizeTokens.zetta,
        fontWeight: FontWeightTokens.regular,
        letterSpacing: LetterSpacingTokens.mega,
      ),
    ),
  );
  static CapybaSocialTextStyle bodyText1 = CapybaSocialTextStyle._(
    GoogleFonts.inter(
      textStyle: const TextStyle(
        fontSize: FontSizeTokens.mega,
        fontWeight: FontWeightTokens.regular,
        letterSpacing: LetterSpacingTokens.exa,
      ),
    ),
  );
  static CapybaSocialTextStyle bodyText2 = CapybaSocialTextStyle._(
    GoogleFonts.inter(
      textStyle: const TextStyle(
        fontSize: FontSizeTokens.kilo,
        fontWeight: FontWeightTokens.regular,
        letterSpacing: LetterSpacingTokens.tera,
      ),
    ),
  );
  static CapybaSocialTextStyle button = CapybaSocialTextStyle._(
    GoogleFonts.inter(
      textStyle: const TextStyle(
        fontSize: FontSizeTokens.kilo,
        fontWeight: FontWeightTokens.bold,
        letterSpacing: LetterSpacingTokens.exa,
      ),
    ),
  );
  static CapybaSocialTextStyle caption = CapybaSocialTextStyle._(
    GoogleFonts.inter(
      textStyle: const TextStyle(
        fontSize: FontSizeTokens.hecto,
        fontWeight: FontWeightTokens.regular,
        letterSpacing: LetterSpacingTokens.peta,
      ),
    ),
  );
  static CapybaSocialTextStyle overline = CapybaSocialTextStyle._(
    GoogleFonts.inter(
      textStyle: const TextStyle(
        fontSize: FontSizeTokens.deka,
        fontWeight: FontWeightTokens.regular,
        letterSpacing: LetterSpacingTokens.yotta,
      ),
    ),
  );

  CapybaSocialTextStyle get weightLight => CapybaSocialTextStyle._(
      style.copyWith(fontWeight: FontWeightTokens.light));

  CapybaSocialTextStyle get weightRegular => CapybaSocialTextStyle._(
      style.copyWith(fontWeight: FontWeightTokens.regular));

  CapybaSocialTextStyle get weightBold => CapybaSocialTextStyle._(
      style.copyWith(fontWeight: FontWeightTokens.bold));
}
