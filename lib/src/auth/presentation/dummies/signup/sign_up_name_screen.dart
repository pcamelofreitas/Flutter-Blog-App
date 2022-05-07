import 'package:blog_app_2/src/auth/auth_providers.dart';
import 'package:blog_app_2/src/auth/domain/usecases/sign_up/sign_up_usecase.dart';
import 'package:blog_app_2/src/shared/presentation/design_system/assets/capyba_social_icons.dart';
import 'package:blog_app_2/src/shared/presentation/design_system/tokens/color_tokens.dart';
import 'package:blog_app_2/src/shared/presentation/design_system/tokens/spacing_tokens.dart';
import 'package:blog_app_2/src/shared/presentation/forms/validators.dart';
import 'package:blog_app_2/src/shared/presentation/typography/capyba_social_text_style.dart';
import 'package:blog_app_2/src/shared/presentation/widgets/appbars/capyba_social_appbar.dart';
import 'package:blog_app_2/src/shared/presentation/widgets/buttons/capyba_social_button.dart';
import 'package:blog_app_2/src/shared/presentation/widgets/flexible_scroll_container.dart';
import 'package:blog_app_2/src/shared/presentation/widgets/text_field/capyba_social_text_field.dart';
import 'package:blog_app_2/src/shared/presentation/widgets/text_field/capyba_social_text_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpNameScreen extends ConsumerStatefulWidget {
  const SignUpNameScreen({Key? key}) : super(key: key);
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpNameScreen();
}

class _SignUpNameScreen extends ConsumerState<SignUpNameScreen> {
  late final CapybaSocialTextFieldController controller;

  @override
  void initState() {
    controller = CapybaSocialTextFieldController(
      "",
      validators: Validators.required,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final SignUpUsecase usecase =
        ref.read(AuthProviders.signUpUsecaseProvider.notifier);

    final CapybaSocialAppBar appBar = CapybaSocialAppBar(
      title: "Create account",
      leadingIcon: IconButton(
        onPressed: () => usecase.onBackFromNameScreenPressed(),
        icon: const Icon(CapybaSocialIcons.indexLeft),
      ),
    );

    return Theme(
      data: appBar.buildTheme(Theme.of(context)),
      child: Scaffold(
        backgroundColor: ColorTokens.neutralLightest,
        appBar: appBar.widget,
        body: FlexibleScrollContainer(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: SpacingTokens.giga,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: SpacingTokens.mega,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Enter your ",
                        style: CapybaSocialTextStyle.bodyText1.style
                            .copyWith(color: ColorTokens.neutralMediumDark),
                      ),
                      TextSpan(
                        text: "Name:",
                        style: CapybaSocialTextStyle.bodyText1.weightBold.style
                            .copyWith(
                          color: ColorTokens.neutralDarkest,
                        ),
                      )
                    ],
                  ),
                ),
                CapybaSocialTextField(
                  hintText: "Name",
                  controller: controller,
                  keyboardType: TextInputType.text,
                  onSubmitted: (value) => _onContinuePressed(),
                  onChanged: usecase.onNameChanged,
                ),
                const Spacer(),
                CapybaSocialButton(
                  text: "Continue",
                  onPressed: _onContinuePressed,
                ),
                const SizedBox(
                  height: SpacingTokens.mega,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onContinuePressed() {
    controller.showValidationState();

    ref
        .read(AuthProviders.signUpUsecaseProvider.notifier)
        .onContinueFromNameScreenPressed();
  }
}
