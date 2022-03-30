import 'package:blog_app_2/main.dart';
import 'package:blog_app_2/models/loginstate.dart';
import 'package:blog_app_2/pages/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PagesController extends StatelessWidget {
  const PagesController({Key? key, required this.loginState}) : super(key: key);
  final ApplicationLoginState loginState;
  @override
  Widget build(BuildContext context) {
    if (loginState == ApplicationLoginState.loggedIn) {
      return DefaultTabController(
        length: 2,
        child: Consumer<ApplicationState>(
          builder: (context, appState, _) => HomePage(
            accountName: appState.userName,
            accountEmail: appState.userEmail,
            accountPhotoUrl: appState.userImage,
          ),
        ),
      );
    } else {
      return const LoginPage();
    }
  }
}
