import 'dart:io';

import 'package:blog_app_2/src/auth/data/entities/auth_response_entity.dart';
import 'package:blog_app_2/src/auth/domain/models/auth_response_model.dart';
import 'package:blog_app_2/src/auth/domain/usecases/sign_in/sign_in_form.dart';
import 'package:blog_app_2/src/auth/domain/usecases/sign_up/sign_up_form.dart';
import 'package:blog_app_2/src/shared/errors/app_error.dart';
import 'package:blog_app_2/src/shared/errors/exceptions.dart';
import 'package:blog_app_2/src/shared/types/result.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepository {
  AuthRepository({
    required FirebaseAuth firebaseAuth,
    required FirebaseStorage firebaseStorage,
    required FirebaseFirestore firebaseFirestore,
    required GoogleSignIn googleSignIn,
  })  : _firebaseAuth = firebaseAuth,
        _firebaseStorage = firebaseStorage,
        _firebaseFirestore = firebaseFirestore,
        _googleSignIn = googleSignIn,
        super();

  final FirebaseAuth _firebaseAuth;
  final FirebaseStorage _firebaseStorage;
  final FirebaseFirestore _firebaseFirestore;
  final GoogleSignIn _googleSignIn;

  //know if the user is logged or not
  Future<Result> evaluateAuthState() async {
    User? loggedUser = _firebaseAuth.currentUser;
    if (loggedUser != null) {
      return const Success(true);
    } else {
      return Failure(AppUnknownError());
    }
  }

  //REGISTER
  // Future<void> registerAccount(
  //   String email,
  //   String displayName,
  //   String password,
  //   String photoURL, // GET-URL-IMAGE-BEFORE-UPLOAD-TO-STORAGE
  //   void Function(FirebaseAuthException e) errorCallback,
  // ) async {
  //   try {
  //     var credential = await FirebaseAuth.instance
  //         .createUserWithEmailAndPassword(email: email, password: password);
  //     await credential.user!.updateDisplayName(displayName);
  //     credential.user!.updatePhotoURL(photoURL);
  //   } on FirebaseAuthException catch (e) {
  //     errorCallback(e);
  //   }
  // }

  Future<Result<AuthResponseModel>> signUpWithEmailAndPassword(
      {required SignUpForm form}) async {
    try {
      final UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: form.email.field.getOrElse(''),
        password: form.password.field.getOrElse(''),
      );

      AuthResponseEntity authResponseEntity = AuthResponseEntity(
        uid: userCredential.user?.uid,
        emailVerified: userCredential.user?.emailVerified,
      );

      AuthResponseModel authResponseModel = authResponseEntity.toDomain();

      Result uploadProfilePicRes = await _uploadProfilePicture(
        fileName: authResponseModel.uid,
        picture: File(form.selfie.field.getOrElse('')),
      );

      Result updateUserProfile = await _updateUserProfile(
        name: form.name.field.getOrElse(''),
        pictureUrl: form.selfie.field.getOrElse(''),
      );
      if (updateUserProfile is Success && uploadProfilePicRes is Success) {
        return Success(authResponseModel);
      } else {
        return Failure(AppUnknownError(slug: "failed at least one step"));
      }
    } on ParseException catch (e) {
      return Failure(EntityNotFitError(slug: e.toString()));
    } catch (e) {
      return Failure(AppUnknownError(slug: e.toString()));
    }
  }

  //UPLOAD-PROFILE-PICTURE
  Future<Result> _uploadProfilePicture({
    required String fileName,
    required File picture,
  }) async {
    try {
      await _firebaseStorage
          .ref("/profile_pictures/$fileName")
          .putFile(picture);

      return const Success(true);
    } catch (e) {
      return Failure(AppUnknownError(slug: e.toString()));
    }
  }

  //UPDATE-USER-PROFILE-WITH-PICTURE-AND-NAME
  Future<Result> _updateUserProfile({
    required String name,
    required String pictureUrl,
  }) async {
    try {
      await _firebaseAuth.currentUser?.updateDisplayName(name);
      await _firebaseAuth.currentUser?.updatePhotoURL(pictureUrl);

      return const Success(true);
    } catch (e) {
      return Failure(AppUnknownError(slug: e.toString()));
    }
  }

  //SIGN-IN-WITH-EMAIL-N-PASSWORD

  // Future<void> signInWithEmailAndPassword(
  //   String email,
  //   String password,
  //   void Function(FirebaseAuthException e) errorCallback,
  // ) async {
  //   try {
  //     await FirebaseAuth.instance
  //         .signInWithEmailAndPassword(email: email, password: password);
  //   } on FirebaseAuthException catch (e) {
  //     errorCallback(e);
  //   }
  // }

  Future<Result<AuthResponseModel>> signInWithEmailAndPassword(
      {required SignInForm form}) async {
    try {
      final UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: form.email.field.getOrElse(""),
        password: form.password.field.getOrElse(""),
      );

      AuthResponseEntity authResponseEntity = AuthResponseEntity(
        uid: userCredential.user?.uid,
        emailVerified: userCredential.user?.emailVerified,
      );

      return Success(authResponseEntity.toDomain());
    } on ParseException catch (e) {
      return Failure(EntityNotFitError(slug: e.toString()));
    } catch (e) {
      return Failure(AppUnknownError(slug: e.toString()));
    }
  }

  //SIGN-IN-WITH-GOOGLE

  // Future<void> singInWithGoogle({required BuildContext context}) async {
  //   FirebaseAuth auth = FirebaseAuth.instance;

  //   final GoogleSignIn googleSignIn = GoogleSignIn();

  //   final GoogleSignInAccount? googleSignInAccount =
  //       await googleSignIn.signIn();

  //   if (googleSignInAccount != null) {
  //     final GoogleSignInAuthentication googleSignInAuthentication =
  //         await googleSignInAccount.authentication;

  //     final AuthCredential credential = GoogleAuthProvider.credential(
  //       accessToken: googleSignInAuthentication.accessToken,
  //       idToken: googleSignInAuthentication.idToken,
  //     );

  //     try {
  //       // final UserCredential userCredential =
  //       await auth.signInWithCredential(credential);
  //     } on FirebaseAuthException catch (e) {
  //       if (e.code == 'account-exists-with-different-credential') {
  //         ScaffoldMessenger.of(context).showSnackBar(
  //           customSnackBar(
  //             content: 'The account already exists with a different credential',
  //           ),
  //         );
  //       } else if (e.code == 'invalid-credential') {
  //         ScaffoldMessenger.of(context).showSnackBar(
  //           customSnackBar(
  //             content: 'Error occurred while accessing credentials. Try again.',
  //           ),
  //         );
  //       }
  //     } catch (e) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         customSnackBar(
  //           content: 'Error occurred using Google Sign In. Try again.',
  //         ),
  //       );
  //     }
  //   }
  // }

  Future<Result<AuthResponseModel>> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      final UserCredential userCredential =
          await _firebaseAuth.signInWithCredential(credential);

      AuthResponseEntity authResponseEntity = AuthResponseEntity(
        uid: userCredential.user?.uid,
        emailVerified: userCredential.user?.emailVerified,
      );

      return Success(authResponseEntity.toDomain());
    } on ParseException catch (e) {
      return Failure(EntityNotFitError(slug: e.toString()));
    } catch (e) {
      return Failure(AppUnknownError(slug: e.toString()));
    }
  }

  //FORGOT-PASSWORD
  Future<Result> sendEmailToResetPassword(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(
        email: email,
      );

      return const Success(true);
    } catch (e) {
      return Failure(AppUnknownError(slug: e.toString()));
    }
  }

  //VERIFY-EMAIL
  // Future<void> verifyEmail(
  //   String email,
  //   void Function(FirebaseAuthException e) errorCallback,
  // ) async {
  //   try {
  //     var methods =
  //         await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
  //     if (methods.contains('password')) {
  //       _loginState = ApplicationLoginState.password;
  //     } else {
  //       _loginState = ApplicationLoginState.register;
  //     }
  //     _email = email;
  //     notifyListeners();
  //   } on FirebaseAuthException catch (e) {
  //     errorCallback(e);
  //   }
  // }
  Future<Result<String>> verifyEmail() async {
    try {
      User? loggedUser = _firebaseAuth.currentUser;

      if (loggedUser != null) {
        await loggedUser.sendEmailVerification();

        return const Success(
            'A verification email has been sent to your registration email');
      } else {
        return Failure(AppUnknownError());
      }
    } catch (e) {
      return Failure(AppUnknownError());
    }
  }

  //SIGN-OUT
  // void signOut() {
  //   FirebaseAuth.instance.signOut();
  // }
  Future<Result<bool>> signOut() async {
    try {
      await _firebaseAuth.signOut();

      return const Success(true);
    } catch (e) {
      return Failure(AppUnknownError());
    }
  }

  //signin with Email and password
  // Future<Result<AuthResponseModel>> signInWithEmailAndPassword(
  //     {required SignInForm form}) async {
  //   try {
  //     final UserCredential userCredential =
  //         await _firebaseAuth.signInWithEmailAndPassword(
  //       email: form.email.field.getOrElse(""),
  //       password: form.password.field.getOrElse(""),
  //     );

  //     AuthResponseEntity authResponseEntity = AuthResponseEntity(
  //       uid: userCredential.user?.uid,
  //       emailVerified: userCredential.user?.emailVerified,
  //     );

  //     return Success(authResponseEntity.toDomain());
  //   } on ParseException catch (e) {
  //     return Failure(EntityNotFitError(slug: e.toString()));
  //   } catch (e) {
  //     return Failure(AppUnknownError(slug: e.toString()));
  //   }
  // }
}

SnackBar customSnackBar({required String content}) {
  return SnackBar(
    backgroundColor: Colors.black,
    content: Text(
      content,
      style: const TextStyle(color: Colors.redAccent, letterSpacing: 0.5),
    ),
  );
}
