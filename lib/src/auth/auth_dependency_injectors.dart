import 'package:blog_app_2/src/auth/data/repositories/auth_repositories.dart';
import 'package:blog_app_2/src/auth/domain/usecases/onboarding/onboarding_usecase.dart';
import 'package:blog_app_2/src/auth/domain/usecases/sign_in/sign_in_usecase.dart';
import 'package:blog_app_2/src/auth/domain/usecases/sign_up/sign_up_usecase.dart';
import 'package:blog_app_2/src/dependecy_injection.dart';

import 'package:google_sign_in/google_sign_in.dart';

void setupAuthDI() {
  di.registerSingleton(GoogleSignIn());
  di.registerFactory(() => OnboardingUsecase(authRepository: di()));
  di.registerFactory(() => SignInUsecase(authRepository: di()));
  di.registerFactory(() => SignUpUsecase(authRepository: di()));

  di.registerFactory(
    () => AuthRepository(
      firebaseAuth: di(),
      firebaseStorage: di(),
      firebaseFirestore: di(),
      googleSignIn: di(),
    ),
  );
}
