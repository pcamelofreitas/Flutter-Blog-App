import 'package:blog_app_2/src/auth/auth_providers.dart';
import 'package:blog_app_2/src/auth/domain/usecases/sign_in/sign_in_usecase.dart';
import 'package:blog_app_2/src/shared/presentation/forms/validators.dart';
import 'package:blog_app_2/src/shared/presentation/widgets/flexible_scroll_container.dart';
import 'package:blog_app_2/src/shared/presentation/widgets/text_field/capyba_social_text_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignInEmailScreen extends ConsumerStatefulWidget {
  const SignInEmailScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SignInEmailScreenState();
}

class _SignInEmailScreenState extends ConsumerState<SignInEmailScreen> {
  late final CapybaSocialTextFieldController controller;
  @override
  void initState() {
    controller = CapybaSocialTextFieldController(
      '',
      validators: Validators.email,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final SignInUsecase signInUsecase =
        ref.read(AuthProviders.signInUsecaseProvider.notifier);
    return Scaffold(
      appBar: AppBar(),
      body: FlexibleScrollContainer(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    width: 1.0,
                    color: Colors.black54,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black38,
                      offset: Offset(1, 1.0),
                      blurRadius: 5,
                      spreadRadius: 1,
                    )
                  ],
                  borderRadius: const BorderRadius.all(
                    Radius.circular(125),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: controller,
                    onChanged: signInUsecase.onEmailChanged,
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
                ),
              ),
              ElevatedButton(
                onPressed: _onContinuePressed,
                child: const Text('Continue'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onContinuePressed() {
    controller.showValidationState();
    ref
        .read(AuthProviders.signInUsecaseProvider.notifier)
        .onContinueFromEmailScreenPressed();
  }
}
