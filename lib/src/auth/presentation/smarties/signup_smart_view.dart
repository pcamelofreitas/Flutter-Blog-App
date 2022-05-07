import 'dart:io';

import 'package:blog_app_2/src/auth/auth_providers.dart';
import 'package:blog_app_2/src/auth/domain/usecases/sign_up/sign_up_usecase.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpSmartView extends ConsumerStatefulWidget {
  const SignUpSmartView({Key? key}) : super(key: key);

  @override
  SignUpSmartViewState createState() => SignUpSmartViewState();
}

class SignUpSmartViewState extends ConsumerState<SignUpSmartView> {
  late final GlobalKey<NavigatorState> navKey;

  @override
  void initState() {
    super.initState();

    navKey = GlobalKey<NavigatorState>();
  }

  @override
  Widget build(BuildContext context) {
    final SignUpState signUpState =
        ref.watch(AuthProviders.signUpUsecaseProvider);

    ref.listen(AuthProviders.signUpUsecaseProvider, _listener);

    return WillPopScope(
      onWillPop: () async => _dealWithPop(signUpState, false),
      child: Navigator(
        key: navKey,
        onPopPage: (_, __) => _dealWithPop(signUpState, true),
        pages: signUpState.flow.when(
          name: () => const [
            MaterialPage(child: SignUpNameScreen()),
          ],
          email: () => const [
            MaterialPage(child: SignUpNameScreen()),
            MaterialPage(child: SignUpEmailScreen()),
          ],
          password: () => const [
            MaterialPage(child: SignUpNameScreen()),
            MaterialPage(child: SignUpEmailScreen()),
            MaterialPage(child: SignUpPasswordScreen()),
          ],
          confirmationPassword: () => const [
            MaterialPage(child: SignUpNameScreen()),
            MaterialPage(child: SignUpEmailScreen()),
            MaterialPage(child: SignUpPasswordScreen()),
            MaterialPage(child: SignUpConfirmationPasswordScreen()),
          ],
          selfie: () => const [
            MaterialPage(child: SignUpNameScreen()),
            MaterialPage(child: SignUpEmailScreen()),
            MaterialPage(child: SignUpPasswordScreen()),
            MaterialPage(child: SignUpConfirmationPasswordScreen()),
            MaterialPage(child: SignUpSelfieScreen()),
          ],
          camera: () => const [
            MaterialPage(child: SignUpNameScreen()),
            MaterialPage(child: SignUpEmailScreen()),
            MaterialPage(child: SignUpPasswordScreen()),
            MaterialPage(child: SignUpConfirmationPasswordScreen()),
            MaterialPage(child: SignUpSelfieScreen()),
            MaterialPage(child: SignUpCameraScreen()),
          ],
        ),
      ),
    );
  }

  bool _dealWithPop(SignUpState state, bool internalNavigator) {
    bool _condition = false;

    if (Platform.isIOS) {
      _condition =
          internalNavigator && Navigator.of(context).userGestureInProgress;
    } else {
      _condition = internalNavigator;
    }

    if (state.isLoading) {
      return false;
    } else {
      return state.flow.when(
        name: () {
          ref
              .read(AuthProviders.signUpUsecaseProvider.notifier)
              .onLeftSignUpUsecase();

          return true;
        },
        email: () {
          ref
              .read(AuthProviders.signUpUsecaseProvider.notifier)
              .onBackFromEmailScreenPressed();

          return _condition;
        },
        password: () {
          ref
              .read(AuthProviders.signUpUsecaseProvider.notifier)
              .onBackFromPasswordScreenPressed();

          return _condition;
        },
        confirmationPassword: () {
          ref
              .read(AuthProviders.signUpUsecaseProvider.notifier)
              .onBackFromConfirmationPasswordScreenPressed();

          return _condition;
        },
        selfie: () {
          ref
              .read(AuthProviders.signUpUsecaseProvider.notifier)
              .onBackFromSelfieScreenPressed();

          return _condition;
        },
        camera: () {
          ref
              .read(AuthProviders.signUpUsecaseProvider.notifier)
              .onBackFromCameraScreenPressed();

          return _condition;
        },
      );
    }
  }

  void _listener(SignUpState? previous, SignUpState next) {
    next.action.when(
      idle: () => {},
      popFlow: () {
        Navigator.of(context).pop();
        ref
            .read(AuthProviders.signUpUsecaseProvider.notifier)
            .onLeftSignUpUsecase();
      },
      goToHome: () {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const RootSmartView(),
          ),
          (_) => false,
        );
        ref
            .read(AuthProviders.signUpUsecaseProvider.notifier)
            .onLeftSignUpUsecase();
      },
    );
  }
}
