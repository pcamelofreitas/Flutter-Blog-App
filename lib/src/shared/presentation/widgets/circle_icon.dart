import 'package:blog_app_2/src/shared/presentation/design_system/tokens/color_tokens.dart';
import 'package:blog_app_2/src/shared/presentation/design_system/tokens/spacing_tokens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CircleIcon extends StatelessWidget {
  const CircleIcon({
    Key? key,
    required this.iconUrl,
    this.fillColor = ColorTokens.neutralDarkest,
    this.padding = const EdgeInsets.all(SpacingTokens.kilo),
    this.size = SpacingTokens.mega,
  }) : super(key: key);

  final String iconUrl;
  final Color fillColor;
  final EdgeInsets padding;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: fillColor,
      ),
      child: SvgPicture.asset(
        iconUrl,
        width: size,
        height: size,
      ),
    );
  }
}
