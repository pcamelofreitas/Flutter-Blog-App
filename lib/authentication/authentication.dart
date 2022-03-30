import 'package:blog_app_2/authentication/forms/emailform.dart';
import 'package:blog_app_2/authentication/forms/passwordform.dart';
import 'package:blog_app_2/authentication/forms/registerform.dart';
import 'package:blog_app_2/main.dart';
import 'package:blog_app_2/models/loginstate.dart';
import 'package:blog_app_2/models/logo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// import 'package:tentativa_1/main.dart';

class Authentication extends StatelessWidget {
  // prop constructor
  const Authentication({
    required this.loginState,
    required this.email,
    required this.startLoginFlow,
    required this.verifyEmail,
    required this.signInWithEmailAndPassword,
    required this.cancelRegistration,
    required this.registerAccount,
    required this.signOut,
  });
  //prop handlers
  final ApplicationLoginState loginState;
  final String? email;
  final void Function() startLoginFlow;
  final void Function(
    String email,
    void Function(Exception e) error,
  ) verifyEmail;
  final void Function(
    String email,
    String password,
    void Function(Exception e) error,
  ) signInWithEmailAndPassword;
  final void Function() cancelRegistration;
  final void Function(
    String email,
    String displayName,
    String password,
    String imageUrl,
    void Function(Exception e) error,
  ) registerAccount;
  final void Function() signOut;

  @override
  Widget build(BuildContext context) {
    switch (loginState) {
      case ApplicationLoginState.loggedOut:
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AppLogo(),
            const SizedBox(height: 100),
            Center(
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 1, color: Colors.black),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black38,
                      offset: Offset(1, 2.0),
                      blurRadius: 10,
                      spreadRadius: 1,
                    )
                  ],
                  borderRadius: const BorderRadius.all(Radius.circular(128)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    onPressed: () {
                      startLoginFlow();
                    },
                    child: const Text('Sign in to continue'),
                  ),
                ),
              ),
            ),
          ],
        );
      case ApplicationLoginState.emailAddress:
        return EmailForm(
            callback: (email) => verifyEmail(
                email, (e) => _showErrorDialog(context, 'Invalid email', e)));
      case ApplicationLoginState.password:
        return PasswordForm(
          email: email!,
          login: (email, password) {
            signInWithEmailAndPassword(email, password,
                (e) => _showErrorDialog(context, 'Failed to sign in', e));
          },
        );
      case ApplicationLoginState.register:
        return RegisterForm(
          email: email!,
          cancel: () {
            cancelRegistration();
          },
          registerAccount: (
            email,
            displayName,
            password,
            imageUrl,
          ) {
            registerAccount(
              email,
              displayName,
              password,
              imageUrl,
              (e) => _showErrorDialog(
                context,
                'Failed to create account',
                e,
              ),
            );
          },
        );
      case ApplicationLoginState.loggedIn:
        //quando logado vai renderizar tab com as pages
        return DefaultTabController(
          length: 1,
          child: Consumer<ApplicationState>(
            builder: (context, appState, _) => HomePage(
                accountName: appState.userName,
                accountEmail: appState.userEmail,
                accountPhotoUrl: appState.userImage),
          ),
        );

      default:
        return Row(
          children: const [
            Text("Internal error, this shouldn't happen..."),
          ],
        );
    }
  }

  void _showErrorDialog(BuildContext context, String title, Exception e) {
    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            title,
            style: const TextStyle(fontSize: 24),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  '${(e as dynamic).message}',
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'OK',
                style: TextStyle(color: Colors.deepPurple),
              ),
            ),
          ],
        );
      },
    );
  }
}
