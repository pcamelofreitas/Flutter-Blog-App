part of 'sign_in_usecase.dart';

@freezed
class SignInState with _$SignInState {
  const SignInState._();
  const factory SignInState({
    required SignInAction action,
    required SignInFlow flow,
    required SignInForm signInForm,
    required RequestStatus sendCodeRequestStatus,
    required RequestStatus signInRequestStatus,
  }) = _SignInState;

  bool get isLoading => signInRequestStatus is Loading;

  factory SignInState.initial() => const SignInState(
        action: _Idle(),
        flow: Email(),
        signInForm: SignInForm(),
        signInRequestStatus: Idle(),
        sendCodeRequestStatus: Idle(),
      );
}

@freezed
class SignInFlow with _$SignInFlow {
  const factory SignInFlow.email() = Email;
  const factory SignInFlow.password() = Password;
}

@freezed
class SignInAction with _$SignInAction {
  const factory SignInAction.idle() = _Idle;
  const factory SignInAction.popFlow() = PopFlow;
  const factory SignInAction.goToHome() = GoToHome;
}
