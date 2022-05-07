import 'dart:io';

import 'package:blog_app_2/src/auth/auth_providers.dart';
import 'package:blog_app_2/src/auth/domain/usecases/sign_in/sign_in_usecase.dart';
import 'package:blog_app_2/src/auth/presentation/dummies/signin/sign_in_email_screen.dart';
import 'package:blog_app_2/src/auth/presentation/dummies/signin/sign_in_password_screen.dart';
import 'package:blog_app_2/src/home/presentation/smarties/root_smart_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class SignInSmartView extends ConsumerStatefulWidget {
  const SignInSmartView({Key? key}) : super(key: key);

  @override
  SignInSmartViewState createState() => SignInSmartViewState();
}

class SignInSmartViewState extends ConsumerState<SignInSmartView> {
  late final GlobalKey<NavigatorState> navKey;

  @override
  void initState() {
    super.initState();
    navKey = GlobalKey<NavigatorState>();
  }

  @override
  Widget build(BuildContext context) {
    final SignInState signInState =
        ref.watch(AuthProviders.signInUsecaseProvider);
    ref.listen(AuthProviders.signInUsecaseProvider, _listener);

    return WillPopScope(
      child: Navigator(
        key: navKey,
        onPopPage: (_, __) => _dealWithPop(signInState, true),
        pages: signInState.flow.when(
            email: () => const [
                  MaterialPage(child: SignInEmailScreen()),
                ],
            password: () => const [
                  MaterialPage(
                    child: SignInEmailScreen(),
                  ),
                  MaterialPage(
                    child: SignInPasswordScreen(),
                  ),
                ]),
      ),
      onWillPop: () async => _dealWithPop(signInState, false),
    );
  }

  bool _dealWithPop(SignInState state, bool internalNavigator) {
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
        email: () {
          ref
              .read(AuthProviders.signInUsecaseProvider.notifier)
              .onLeftSignInUsecase();

          return true;
        },
        password: () {
          ref
              .read(AuthProviders.signInUsecaseProvider.notifier)
              .onBackFromPasswordScreenPressed();

          return _condition;
        },
      );
    }
  }

  void _listener(SignInState? previous, SignInState next) {
    next.action.when(
      idle: () => {},
      popFlow: () {
        Navigator.of(context).pop();
        ref
            .read(AuthProviders.signInUsecaseProvider.notifier)
            .onLeftSignInUsecase;
      },
      goToHome: () {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const RootSmartView(),
          ),
          (route) => false,
        );
        ref
            .read(AuthProviders.signInUsecaseProvider.notifier)
            .onLeftSignInUsecase();
      },
    );
  }
}
