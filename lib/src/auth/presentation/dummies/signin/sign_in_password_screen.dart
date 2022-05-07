import 'package:blog_app_2/src/auth/auth_providers.dart';
import 'package:blog_app_2/src/auth/domain/usecases/sign_in/sign_in_usecase.dart';
import 'package:blog_app_2/src/shared/presentation/forms/validators.dart';
import 'package:blog_app_2/src/shared/presentation/widgets/capyba_social_circular_progress_indicator.dart';
import 'package:blog_app_2/src/shared/presentation/widgets/flexible_scroll_container.dart';
import 'package:blog_app_2/src/shared/presentation/widgets/text_field/capyba_social_text_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignInPasswordScreen extends ConsumerStatefulWidget {
  const SignInPasswordScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SignInPasswordScreenState();
}

class _SignInPasswordScreenState extends ConsumerState<SignInPasswordScreen> {
  late final CapybaSocialTextFieldController controller;
  @override
  void initState() {
    controller = CapybaSocialTextFieldController(
      '',
      validators: Validators.password,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final SignInUsecase signInUsecase =
        ref.read(AuthProviders.signInUsecaseProvider.notifier);

    final SignInState signInState =
        ref.watch(AuthProviders.signInUsecaseProvider);

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
                    keyboardType: TextInputType.visiblePassword,
                    controller: controller,
                    onChanged: signInUsecase.onPasswordChanged,
                    onFieldSubmitted: (value) => _onContinuePressed(),
                    decoration: InputDecoration(
                      labelText: "Password",
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
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: signInUsecase.onClickForgotPassword,
                    //  () {
                    //   FirebaseAuth.instance
                    //       .sendPasswordResetEmail(email: _emailController.text);
                    //   showDialog(
                    //     context: context,
                    //     builder: (context) => AlertDialog(
                    //       title: const Text(
                    //           'Enviamos um email para redefinir sua senha. Se não encontrar na caixa de entrada verifique no spam.'),
                    //       content: ElevatedButton(
                    //         onPressed: () {
                    //           Navigator.pop(context);
                    //         },
                    //         child: const Text("ok"),
                    //       ),
                    //     ),
                    //   );
                    // },
                    child: const Text(
                      'Forgot password?',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
              signInState.signInRequestStatus.maybeWhen(
                orElse: () => Container(),
                loading: () => const CapybaSocialCircularProgressIndicator(),
              ),
              signInState.sendCodeRequestStatus.maybeWhen(
                orElse: () => Container(),
                loading: () => const CapybaSocialCircularProgressIndicator(),
              ),
              ElevatedButton(
                onPressed: !signInState.isLoading ? _onContinuePressed : null,
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
        .onContinueFromPasswordScreenPressed();
  }
}
