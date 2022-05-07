import 'package:blog_app_2/src/auth/auth_providers.dart';
import 'package:blog_app_2/src/auth/domain/usecases/sign_up/sign_up_usecase.dart';
import 'package:blog_app_2/src/shared/presentation/design_system/assets/capyba_social_icons.dart';
import 'package:blog_app_2/src/shared/presentation/design_system/tokens/color_tokens.dart';
import 'package:blog_app_2/src/shared/presentation/design_system/tokens/spacing_tokens.dart';
import 'package:blog_app_2/src/shared/presentation/typography/capyba_social_text_style.dart';
import 'package:blog_app_2/src/shared/presentation/widgets/appbars/capyba_social_appbar.dart';
import 'package:blog_app_2/src/shared/presentation/widgets/buttons/capyba_social_button.dart';
import 'package:blog_app_2/src/shared/presentation/widgets/flexible_scroll_container.dart';
import 'package:blog_app_2/src/shared/presentation/widgets/text_field/capyba_social_text_field.dart';
import 'package:blog_app_2/src/shared/presentation/widgets/text_field/capyba_social_text_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpConfirmationPasswordScreen extends ConsumerStatefulWidget {
  const SignUpConfirmationPasswordScreen({Key? key}) : super(key: key);
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SignUpConfirmationPasswordScreen();
}

class _SignUpConfirmationPasswordScreen
    extends ConsumerState<SignUpConfirmationPasswordScreen> {
  late final CapybaSocialTextFieldController controller;

  @override
  void initState() {
    final SignUpState state = ref.read(AuthProviders.signUpUsecaseProvider);

    controller = CapybaSocialTextFieldController(
      state.signUpForm.confirmPassword.field.getOrElse(''),
      equalsTo: state.signUpForm.password.field.getOrElse(''),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final SignUpUsecase usecase =
        ref.read(AuthProviders.signUpUsecaseProvider.notifier);

    final SignUpState state = ref.watch(AuthProviders.signUpUsecaseProvider);

    final CapybaSocialAppBar appBar = CapybaSocialAppBar(
      title: "Create account",
      leadingIcon: IconButton(
        onPressed: () => usecase.onBackFromConfirmationPasswordScreenPressed(),
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
                        text: "Confirm your ",
                        style: CapybaSocialTextStyle.bodyText1.style
                            .copyWith(color: ColorTokens.neutralMediumDark),
                      ),
                      TextSpan(
                        text: "Password:",
                        style: CapybaSocialTextStyle.bodyText1.weightBold.style
                            .copyWith(
                          color: ColorTokens.neutralDarkest,
                        ),
                      )
                    ],
                  ),
                ),
                CapybaSocialTextField(
                  hintText: "Password",
                  controller: controller,
                  keyboardType: TextInputType.visiblePassword,
                  onSubmitted: (value) => _onContinuePressed(state: state),
                  onChanged: usecase.onConfirmationPasswordChanged,
                  suffix: SUFFIX.Eye,
                ),
                const Spacer(),
                CapybaSocialButton(
                  text: "Continue",
                  onPressed: () => _onContinuePressed(state: state),
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

  void _onContinuePressed({
    required SignUpState state,
  }) {
    if (!controller.dirty) {
      controller.internalOnChanged(
        state.signUpForm.password.field.getOrElse(''),
      );
    }
    controller.showValidationState();

    ref
        .read(AuthProviders.signUpUsecaseProvider.notifier)
        .onContinueFromConfirmationPasswordScreenPressed();
  }
}
