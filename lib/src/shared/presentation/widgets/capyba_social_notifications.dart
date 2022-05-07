import 'package:blog_app_2/src/shared/presentation/design_system/assets/capyba_social_icons.dart';
import 'package:blog_app_2/src/shared/presentation/design_system/tokens/color_tokens.dart';
import 'package:blog_app_2/src/shared/presentation/design_system/tokens/spacing_tokens.dart';
import 'package:blog_app_2/src/shared/presentation/typography/capyba_social_text_style.dart';
import 'package:blog_app_2/src/shared/types/request_status.dart';
import 'package:flutter/material.dart';

const Duration _snackbarDisplayDuration = Duration(milliseconds: 5000);
const double _NOTIFICATION_BOTTOM_PADDING = 70;

class CapybaSocialNotifications {
  static final GlobalKey<ScaffoldMessengerState> scaffoldMessengerStateKey =
      GlobalKey<ScaffoldMessengerState>();

  static showNotification(
    RequestStatus status, {
    Duration duration = _snackbarDisplayDuration,
    EdgeInsets margin = const EdgeInsets.only(
      bottom: _NOTIFICATION_BOTTOM_PADDING,
    ),
  }) {
    scaffoldMessengerStateKey.currentState?.showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: ColorTokens.neutralLightest,
        margin: EdgeInsets.only(
          left: SpacingTokens.yotta + margin.left,
          right: SpacingTokens.yotta + margin.right,
          bottom: SpacingTokens.giga + margin.bottom,
        ),
        duration: duration,
        padding: const EdgeInsets.symmetric(
          horizontal: SpacingTokens.kilo,
          vertical: SpacingTokens.hecto,
        ),
        content: LayoutBuilder(
          builder: (context, boxConstraints) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: SpacingTokens.kilo),
                  child: InkWell(
                    onTap: () => scaffoldMessengerStateKey.currentState
                        ?.clearSnackBars(),
                    child: Icon(
                      status.when(
                        idle: () => CapybaSocialIcons.alert,
                        loading: () => CapybaSocialIcons.alert,
                        succeeded: (_) => CapybaSocialIcons.confirmed,
                        failed: (_) => CapybaSocialIcons.error,
                      ),
                      size: SpacingTokens.mega,
                      color: status.when(
                        idle: () => ColorTokens.neutralLightest,
                        loading: () => ColorTokens.primary,
                        succeeded: (_) => ColorTokens.primary,
                        failed: (_) => ColorTokens.danger,
                      ),
                    ),
                  ),
                ),
                Container(
                  constraints: BoxConstraints(
                    maxWidth: boxConstraints.maxWidth -
                        SpacingTokens.giga -
                        SpacingTokens.kilo,
                  ),
                  child: Text(
                    status.when(
                      idle: () => '',
                      loading: () => '',
                      succeeded: (msg) => msg ?? 'Sucesso',
                      failed: (failed) => failed.msg,
                    ),
                    textAlign: TextAlign.center,
                    style: CapybaSocialTextStyle.caption.style.copyWith(
                      color: status.when(
                        idle: () => ColorTokens.neutralLightest,
                        loading: () => ColorTokens.primary,
                        succeeded: (_) => ColorTokens.primary,
                        failed: (_) => ColorTokens.danger,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: status.when(
              idle: () => ColorTokens.neutralLight,
              loading: () => ColorTokens.primary,
              succeeded: (_) => ColorTokens.primary,
              failed: (_) => ColorTokens.danger,
            ),
          ),
          borderRadius: BorderRadius.circular(
            SpacingTokens.deka,
          ),
        ),
      ),
    );
  }
}
