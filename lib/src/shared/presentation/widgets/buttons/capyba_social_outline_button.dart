import 'package:blog_app_2/src/shared/presentation/design_system/themes/app_button_color.dart';
import 'package:blog_app_2/src/shared/presentation/design_system/tokens/spacing_tokens.dart';
import 'package:flutter/material.dart';

const double _BTN_HEIGHT = SpacingTokens.yotta;

class CapybaSocialOutlineButton extends StatelessWidget {
  const CapybaSocialOutlineButton(
    this.text, {
    Key? key,
    this.onPressed,
    this.color = AppButtonColor.outline,
    this.icon,
  }) : super(key: key);

  final String? text;
  final void Function()? onPressed;
  final AppButtonColor color;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: SizedBox(
        height: _BTN_HEIGHT,
        child: OutlinedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed) ||
                    states.contains(MaterialState.focused) ||
                    states.contains(MaterialState.hovered) ||
                    states.contains(MaterialState.selected) ||
                    states.contains(MaterialState.dragged)) {
                  return color.focusedBackground;
                } else if (states.contains(MaterialState.disabled)) {
                  return color.base.withOpacity(0.5);
                }
                return color.base;
              },
            ),
            side: MaterialStateProperty.resolveWith<BorderSide>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed) ||
                    states.contains(MaterialState.focused) ||
                    states.contains(MaterialState.hovered) ||
                    states.contains(MaterialState.selected) ||
                    states.contains(MaterialState.dragged)) {
                  return _buttonBorder(color.focusedForeround);
                } else if (states.contains(MaterialState.disabled)) {
                  return _buttonBorder(color.foreground.withOpacity(0.5));
                }

                return _buttonBorder(color.foreground);
              },
            ),
            shape: MaterialStateProperty.resolveWith<RoundedRectangleBorder>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed) ||
                    states.contains(MaterialState.focused) ||
                    states.contains(MaterialState.hovered) ||
                    states.contains(MaterialState.selected) ||
                    states.contains(MaterialState.dragged)) {
                  return _buttonShape(color.focusedForeround);
                } else if (states.contains(MaterialState.disabled)) {
                  return _buttonShape(color.foreground.withOpacity(0.5));
                }

                return _buttonShape(color.foreground);
              },
            ),
            foregroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed) ||
                    states.contains(MaterialState.focused) ||
                    states.contains(MaterialState.hovered) ||
                    states.contains(MaterialState.selected) ||
                    states.contains(MaterialState.dragged)) {
                  return color.focusedForeround;
                } else if (states.contains(MaterialState.disabled)) {
                  return color.foreground.withOpacity(0.5);
                }
                return color.foreground;
              },
            ),
          ),
          onPressed: onPressed,
          child: Builder(
            builder: (context) {
              final textWidget = Text(
                text ?? '',
                style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      color: color.foreground,
                      fontSize: SpacingTokens.mega,
                    ),
                textAlign: TextAlign.center,
              );
              if (icon == null) {
                return textWidget;
              } else {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: SpacingTokens.hecto,
                      ),
                      child: icon,
                    ),
                    const Spacer(),
                    Container(
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width -
                            9 * SpacingTokens.mega,
                      ),
                      child: textWidget,
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }

  RoundedRectangleBorder _buttonShape(Color color) {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(
        _BTN_HEIGHT / 2,
      ),
    );
  }

  BorderSide _buttonBorder(Color color) {
    return BorderSide(
      color: color,
      width: 1.0,
    );
  }
}
