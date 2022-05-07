import 'package:blog_app_2/src/auth/data/repositories/auth_repositories.dart';
import 'package:blog_app_2/src/auth/domain/models/auth_response_model.dart';
import 'package:blog_app_2/src/auth/domain/usecases/sign_in/sign_in_form.dart';
import 'package:blog_app_2/src/shared/errors/app_error.dart';
import 'package:blog_app_2/src/shared/types/maybe.dart';
import 'package:blog_app_2/src/shared/types/request_status.dart';
import 'package:blog_app_2/src/shared/types/result.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';

part 'sign_in_state.dart';
part 'sign_in_usecase.freezed.dart';

class SignInUsecase extends StateNotifier<SignInState> {
  SignInUsecase({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(SignInState.initial());

  final AuthRepository _authRepository;

  //email screen
  void onBackFromEmailScreenPressed() {
    state = state.copyWith(
      action: const PopFlow(),
    );
  }

  void onEmailChanged(String value) {
    state = state.copyWith(
      signInForm: state.signInForm.copyWith(
        email: state.signInForm.email.copyWith(
          field: Just(value),
        ),
      ),
    );
  }

  void onContinueFromEmailScreenPressed() {
    Result<String> emailValidation = state.signInForm.emailValidation;

    emailValidation.handle(
      onSuccess: (data) => state = state.copyWith(
        flow: const Password(),
      ),
      onFailure: (error) {},
    );
  }

  //password Screen
  void onBackFromPasswordScreenPressed() {
    state = state.copyWith(
      flow: const Email(),
    );
  }

  void onPasswordChanged(String value) {
    state = state.copyWith(
      signInForm: state.signInForm.copyWith(
        password: state.signInForm.password.copyWith(
          field: Just(value),
        ),
      ),
    );
  }

  void onContinueFromPasswordScreenPressed() {
    Result<String> passwordValidation = state.signInForm.passwordValidation;
    passwordValidation.handle(
      onSuccess: (data) async {
        state = state.copyWith(
          signInRequestStatus: const Loading(),
        );
        Result<AuthResponseModel> signInRes = await _authRepository
            .signInWithEmailAndPassword(form: state.signInForm);

        signInRes.handle(
          onSuccess: (data) {
            state.copyWith(
              signInRequestStatus: Succeeded(data),
              action: const GoToHome(),
            );
          },
          onFailure: (error) {
            state.copyWith(
              signInRequestStatus: Failed(
                AppUnknownError(
                  msg: 'Failed to sign in. Check your credentials.',
                ),
              ),
            );
          },
        );
      },
      onFailure: (error) => {},
    );
  }

  //forgot password
  void onClickForgotPassword() async {
    state = state.copyWith(
      sendCodeRequestStatus: const Loading(),
    );

    Result sendResetPasswordEmailRes =
        await _authRepository.sendEmailToResetPassword(
      state.signInForm.email.field.value!,
    );

    sendResetPasswordEmailRes.handle(
      onSuccess: (_) => state = state.copyWith(
        sendCodeRequestStatus: const Succeeded(
          'Reset password e-mail sent. Check your inbox.',
        ),
      ),
      onFailure: (error) => state = state.copyWith(
        sendCodeRequestStatus: Failed(
          AppUnknownError(
            msg:
                "The email to reset password couldn't be sent. Contact support.",
          ),
        ),
      ),
    );
  }

  //left flow
  void onLeftSignInUsecase() {
    state = SignInState.initial();
  }
}
