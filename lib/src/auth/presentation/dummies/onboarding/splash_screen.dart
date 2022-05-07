import 'package:blog_app_2/models/logo.dart';
import 'package:blog_app_2/src/auth/auth_providers.dart';
import 'package:blog_app_2/src/auth/domain/usecases/onboarding/onboarding_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final OnboardingUsecase usecase =
        ref.read(AuthProviders.onboardingUsecaseProvider.notifier);
    final OnboardingState state =
        ref.watch(AuthProviders.onboardingUsecaseProvider);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        AppLogo(),
        SizedBox(height: 100),
        // Center(
        //   child: Container(
        //     height: 50,
        //     width: 200,
        //     decoration: BoxDecoration(
        //       color: Colors.white,
        //       border: Border.all(width: 1, color: Colors.black54),
        //       boxShadow: const [
        //         BoxShadow(
        //           color: Colors.black38,
        //           offset: Offset(1, 2.0),
        //           blurRadius: 10,
        //           spreadRadius: 1,
        //         )
        //       ],
        //       borderRadius: const BorderRadius.all(Radius.circular(128)),
        //     ),
        //     child: Padding(
        //       padding: const EdgeInsets.all(8.0),
        //       child: TextButton(
        //         onPressed: usecase.onClickSignInToContinue,
        //         child: const Text('Sign in to continue'),
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
