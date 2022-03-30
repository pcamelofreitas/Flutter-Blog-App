import 'package:blog_app_2/authentication/authentication.dart';
import 'package:blog_app_2/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              bottom: 40,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 600,
                  child: Consumer<ApplicationState>(
                      builder: (context, appState, _) => Authentication(
                            email: appState.email,
                            loginState: appState.loginState,
                            startLoginFlow: appState.startLoginFlow,
                            verifyEmail: appState.verifyEmail,
                            signInWithEmailAndPassword:
                                appState.signInWithEmailAndPassword,
                            cancelRegistration: appState.cancelRegistration,
                            registerAccount: appState.registerAccount,
                            signOut: appState.signOut,
                          )),
                )
              ],
            )),
      ),
    );
  }
}
