part of 'sign_up_usecase.dart';

@freezed
class SignUpState with _$SignUpState {
  const SignUpState._();
  const factory SignUpState({
    required SignUpAction action,
    required SignUpFlow flow,
    required SignUpForm signUpForm,
    required RequestStatus signUpRequestStatus,
  }) = _SignUpState;

  bool get isLoading => signUpRequestStatus is Loading;

  factory SignUpState.initial() => const SignUpState(
        action: _Idle(),
        flow: Name(),
        signUpForm: SignUpForm(),
        signUpRequestStatus: Idle(),
      );
}

@freezed
class SignUpFlow {
  const factory SignUpFlow.name() = Name;
  const factory SignUpFlow.email() = Email;
  const factory SignUpFlow.password() = Password;
  const factory SignUpFlow.confirmationPassword() = ConfirmationPassword;
  const factory SignUpFlow.selfie() = Selfie;
  const factory SignUpFlow.camera() = Camera;
}

@freezed
class SignUpAction with _$SignUpAction {
  const factory SignUpAction.idle() = _Idle;
  const factory SignUpAction.popFlow() = PopFlow;
  const factory SignUpAction.goToHome() = GoToHome;
}
