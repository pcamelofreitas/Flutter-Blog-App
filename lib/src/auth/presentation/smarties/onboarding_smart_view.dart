import 'package:blog_app_2/src/auth/auth_providers.dart';
import 'package:blog_app_2/src/auth/domain/usecases/onboarding/onboarding_usecase.dart';
import 'package:blog_app_2/src/auth/presentation/dummies/onboarding/splash_screen.dart';
import 'package:blog_app_2/src/auth/presentation/dummies/onboarding/unathenticated_page.dart';
import 'package:blog_app_2/src/auth/presentation/smarties/signin_smart_view.dart';
import 'package:blog_app_2/src/auth/presentation/smarties/signup_smart_view.dart';
import 'package:blog_app_2/src/home/presentation/smarties/root_smart_view.dart';
import 'package:blog_app_2/src/shared/presentation/widgets/capyba_social_notifications.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OnboardingSmarView extends ConsumerStatefulWidget {
  const OnboardingSmarView({Key? key}) : super(key: key);

  @override
  OnboardingSmartViewState createState() => OnboardingSmartViewState();
}

class OnboardingSmartViewState extends ConsumerState<OnboardingSmarView> {
  late final GlobalKey<NavigatorState> navKey;

  @override
  void initState() {
    super.initState();
    //call init events
    ref.read(AuthProviders.onboardingUsecaseProvider.notifier).init();
    navKey = GlobalKey<NavigatorState>();
  }

  @override
  Widget build(BuildContext context) {
    final OnboardingState onboardingState =
        ref.watch(AuthProviders.onboardingUsecaseProvider);
    ref.listen(AuthProviders.onboardingUsecaseProvider, _listener);

    return Navigator(
      key: navKey,
      onPopPage: (_, __) => true,
      observers: [HeroController()],
      pages: onboardingState.flow.when(
        splash: () => [const MaterialPage(child: SplashScreen())],
        unauthenticated: () => [UnauthenticatedPage()],
      ),
    );
  }

  void _listener(OnboardingState? previous, OnboardingState next) {
    next.action.when(
      idle: () => {},
      goToSignUp: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const SignUpSmartView(),
        ),
      ),
      goToSignIn: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const SignInSmartView(),
        ),
      ),
      goToHome: () {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const RootSmartView(),
          ),
          (_) => false,
        );

        ref
            .read(AuthProviders.onboardingUsecaseProvider.notifier)
            .onLeftSignInUsecase();
      },
    );

    if (previous?.signInWithGoogleRequestStatus !=
        next.signInWithGoogleRequestStatus) {
      next.signInWithGoogleRequestStatus.maybeMap(
        orElse: () => {},
        failed: (failedStatus) =>
            CapybaSocialNotifications.showNotification(failedStatus),
      );
    }
  }
}
