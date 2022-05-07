import 'package:blog_app_2/src/auth/auth_providers.dart';
import 'package:blog_app_2/src/auth/domain/usecases/sign_up/sign_up_usecase.dart';
import 'package:blog_app_2/src/shared/presentation/design_system/tokens/spacing_tokens.dart';
import 'package:blog_app_2/src/shared/presentation/forms/validators.dart';
import 'package:blog_app_2/src/shared/presentation/widgets/flexible_scroll_container.dart';
import 'package:blog_app_2/src/shared/presentation/widgets/text_field/capyba_social_text_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpEmailScreen extends ConsumerStatefulWidget {
  const SignUpEmailScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpEmailScreen();
}

class _SignUpEmailScreen extends ConsumerState<SignUpEmailScreen> {
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

    return Scaffold(
      backgroundColor: Colors.green,
      body: FlexibleScrollContainer(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: SpacingTokens.mega,
              ),
              TextFormField(
                controller: controller,
                keyboardType: TextInputType.text,
                onChanged: usecase.onEmailChanged,
                onFieldSubmitted: (value) => _onContinuePressed(),
                decoration: InputDecoration(
                  labelText: "Email",
                  labelStyle: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: SpacingTokens.mega,
              ),
              ElevatedButton(
                onPressed: _onContinuePressed,
                child: const Text('Continue'),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _onContinuePressed() {
    controller.showValidationState();

    ref
        .read(AuthProviders.signUpUsecaseProvider.notifier)
        .onContinueFromEmailScreenPressed();
  }
}
