import 'package:blog_app_2/src/auth/domain/usecases/onboarding/onboarding_usecase.dart';
import 'package:blog_app_2/src/auth/domain/usecases/sign_in/sign_in_usecase.dart';
import 'package:blog_app_2/src/auth/domain/usecases/sign_up/sign_up_usecase.dart';
import 'package:blog_app_2/src/dependecy_injection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthProviders {
  static StateNotifierProvider<OnboardingUsecase, OnboardingState>
      onboardingUsecaseProvider = StateNotifierProvider((ref) {
    return di<OnboardingUsecase>();
  });

  static StateNotifierProvider<SignInUsecase, SignInState>
      signInUsecaseProvider = StateNotifierProvider((ref) {
    return di<SignInUsecase>();
  });

  static StateNotifierProvider<SignUpUsecase, SignUpState>
      signUpUsecaseProvider = StateNotifierProvider((ref) {
    return di<SignUpUsecase>();
  });
}
