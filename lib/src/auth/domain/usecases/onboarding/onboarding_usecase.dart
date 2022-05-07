import 'package:blog_app_2/src/auth/data/repositories/auth_repositories.dart';
import 'package:blog_app_2/src/shared/errors/app_error.dart';
import 'package:blog_app_2/src/shared/types/request_status.dart';
import 'package:blog_app_2/src/shared/types/result.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';

part 'onboarding_state.dart';
part 'onboarding_usecase.freezed.dart';

class OnboardingUsecase extends StateNotifier<OnboardingState> {
  OnboardingUsecase({
    required authRepository,
  })  : _authRepository = authRepository,
        super(OnboardingState.initial());

  final AuthRepository _authRepository;

  Future<void> init() async {
    List futures = await Future.wait(
      [
        _authRepository.evaluateAuthState(),
        Future.delayed(
          const Duration(milliseconds: 1500),
        ),
      ],
    );

    Result authStateEvaluationRes = futures.first;

    authStateEvaluationRes.handle(
      onSuccess: (data) => state = state.copyWith(
        action: const GoToHome(),
      ),
      onFailure: (error) => state = state.copyWith(
        flow: const Unauthenticated(),
      ),
    );

    state = state.copyWith(
      flow: const Unauthenticated(),
    );
  }

  // void onClickSignInToContinue() {
  //   state = state.copyWith(
  //     flow: const Unauthenticated(),
  //   );
  // }

  // void onClickContinueFromSignIn() {}

  void onClickOnSignInWithEmail() {
    state = state.copyWith(
      action: const GoToSignIn(),
    );
  }

  void onClickSignInWithGoogle() async {
    state = state.copyWith(
      signInWithGoogleRequestStatus: const Loading(),
    );

    Result signInWithGoogleRes = await _authRepository.signInWithGoogle();

    signInWithGoogleRes.handle(
      onSuccess: (data) => state = state.copyWith(
        action: const GoToHome(),
        signInWithGoogleRequestStatus: Succeeded(data),
      ),
      onFailure: (error) => state = state.copyWith(
        signInWithGoogleRequestStatus: Failed(
          AppUnknownError(
            msg: "Failed to sign in with Google.",
          ),
        ),
      ),
    );
  }

  void onClickOnSignUp() {
    state = state.copyWith(
      action: const GoToSignUp(),
    );
  }

  void onLeftSignInUsecase() {
    state = OnboardingState.initial();
  }
}
