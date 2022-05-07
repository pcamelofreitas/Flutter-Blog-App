import 'package:blog_app_2/src/shared/errors/default_error_messages.dart';
import 'package:blog_app_2/src/shared/presentation/design_system/tokens/color_tokens.dart';
import 'package:blog_app_2/src/shared/presentation/design_system/tokens/spacing_tokens.dart';
import 'package:blog_app_2/src/shared/presentation/typography/capyba_social_text_style.dart';
import 'package:flutter/material.dart';

class DefaultFailedMessage extends StatelessWidget {
  final String msg;

  const DefaultFailedMessage({
    Key? key,
    this.msg = DefaultErrorMessages.unknownError,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(
        SpacingTokens.hecto,
      ),
      alignment: Alignment.center,
      child: Text(
        msg,
        style: CapybaSocialTextStyle.bodyText1.weightBold.style.apply(
          color: ColorTokens.neutralDark,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
