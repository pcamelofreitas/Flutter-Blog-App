import 'package:blog_app_2/src/shared/presentation/design_system/tokens/color_tokens.dart';
import 'package:blog_app_2/src/shared/presentation/design_system/tokens/spacing_tokens.dart';
import 'package:blog_app_2/src/shared/presentation/typography/capyba_social_text_style.dart';
import 'package:flutter/material.dart';

@immutable
class CapybaSocialAppBar {
  final Widget? leadingIcon;
  final Widget? secondaryIcon;
  final String? title;
  final double? toolbarHeight;
  final bool centerTitle;
  final void Function()? onLeadingPressed;
  final void Function()? onSecondaryPressed;
  final Color backgroundColor;
  final Color foregroundColor;

  AppBar get widget => AppBar(
        centerTitle: centerTitle,
        toolbarHeight: toolbarHeight,
        title: Row(
          children: [
            Expanded(
              child: Text(
                title ?? '',
                textAlign: centerTitle ? TextAlign.center : TextAlign.start,
              ),
            )
          ],
        ),
        leading: buildLeadingIcon(),
        actions: buildSecondaryIcon(),
      );

  ThemeData buildTheme(ThemeData theme) {
    return theme.copyWith(
      appBarTheme: theme.appBarTheme.copyWith(
        titleSpacing: centerTitle ? 0 : -10,
        elevation: 0,
        color: backgroundColor,
        iconTheme: IconThemeData(color: foregroundColor),
        actionsIconTheme: IconThemeData(color: foregroundColor),
        titleTextStyle:
            CapybaSocialTextStyle.bodyText2.weightBold.style.copyWith(
          color: foregroundColor,
        ),
      ),
    );
  }

  const CapybaSocialAppBar({
    this.leadingIcon,
    this.secondaryIcon,
    this.title,
    this.toolbarHeight,
    this.centerTitle = true,
    this.onLeadingPressed,
    this.onSecondaryPressed,
    this.backgroundColor = ColorTokens.neutralLightest,
    this.foregroundColor = ColorTokens.neutralMediumDark,
  });

  Widget? buildLeadingIcon() {
    if (leadingIcon == null) {
      return Container();
    }
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        if (onLeadingPressed != null) {
          onLeadingPressed!();
        }
      },
      child: Container(margin: const EdgeInsets.only(), child: leadingIcon),
    );
  }

  List<Widget>? buildSecondaryIcon() {
    // the leading icon naturally has a margin right value.
    // if nothing is done, this margin may push the title content right.
    // setting a margin right in the secondary icon pulls the title back
    // into place

    return [
      InkWell(
        onTap: () {
          if (onSecondaryPressed != null) {
            onSecondaryPressed!();
          }
        },
        child: Container(
          margin: const EdgeInsets.only(
            right: SpacingTokens.mega,
            left: SpacingTokens.mega,
          ),
          width: SpacingTokens.tera,
          child: secondaryIcon,
        ),
      )
    ];
  }
}
