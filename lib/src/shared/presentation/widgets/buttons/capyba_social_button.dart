import 'package:blog_app_2/src/shared/presentation/design_system/themes/app_button_color.dart';
import 'package:blog_app_2/src/shared/presentation/design_system/tokens/spacing_tokens.dart';
import 'package:flutter/material.dart';

const double _BTN_HEIGHT = SpacingTokens.yotta;

class CapybaSocialButton extends StatelessWidget {
  const CapybaSocialButton({
    Key? key,
    this.onPressed,
    this.color = AppButtonColor.primary,
    this.icon,
    this.border = true,
    this.fillWidth = true,
    this.text,
  }) : super(key: key);

  final String? text;
  final void Function()? onPressed;
  final AppButtonColor color;
  final Widget? icon;
  final bool? border;
  final bool? fillWidth;

  @override
  Widget build(BuildContext context) {
    return fillWidth!
        ? FractionallySizedBox(
            widthFactor: 1,
            child: _buttonContent(context),
          )
        : _buttonContent(
            context,
          );
  }

  Widget _buttonContent(BuildContext context) {
    return SizedBox(
      height: _BTN_HEIGHT,
      child: ElevatedButton(
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
          shape: border!
              ? MaterialStateProperty.resolveWith<RoundedRectangleBorder>(
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
                )
              : null,
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
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: textWidget),
                ],
              );
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
    );
  }

  RoundedRectangleBorder _buttonBorder(Color color) {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(
        _BTN_HEIGHT / 2,
      ),
      side: BorderSide(
        color: color,
        width: 1,
      ),
    );
  }
}
