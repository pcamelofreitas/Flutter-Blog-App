import 'package:blog_app_2/main.dart';
import 'package:blog_app_2/widgets/postlist.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RestrictedPage extends StatelessWidget {
  const RestrictedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    bool? isVerify = user!.emailVerified;

    if (isVerify) {
      return Scaffold(
        body: Consumer<ApplicationState>(
          builder: ((context, appState, _) => PostList(
                posts: appState.restrictedPosts,
              )),
        ),
      );
    } else {
      return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.lock,
              size: 200,
              color: Colors.black38,
            ),
            Padding(
              padding: EdgeInsets.only(top: 30, left: 40.0, right: 40),
              child: Text(
                'Para acessar o conteúdo dessa página, verifique seu email no menu lateral.',
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      );
    }
  }
}
