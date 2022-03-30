import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ValidateEmailPage extends StatelessWidget {
  const ValidateEmailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 50),
            const Text(
              "Verificação de e-mail",
              style: TextStyle(fontSize: 30),
            ),
            const SizedBox(
              height: 30,
            ),
            const Padding(
              padding: EdgeInsets.all(50),
              child: Text(
                "Para acessar o conteúdo restrito é necessário validar seu email. Clique no botão abaixo e confira a caixa de entrada do email cadastrado para confirmar seu email.",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 16,
                  letterSpacing: 2,
                ),
              ),
            ),
            const SizedBox(height: 50),
            Container(
              height: 50,
              decoration: const BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.all(
                  Radius.circular(100),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black38,
                    offset: Offset(1, 1.0),
                    blurRadius: 5,
                    spreadRadius: 1,
                  )
                ],
              ),
              child: TextButton(
                onPressed: () async {
                  if (user != null && !user.emailVerified) {
                    try {
                      await user.sendEmailVerification();
                    } on FirebaseAuthException catch (e) {
                      _showErrorDialog(
                          context, 'error on send email verification', e);
                      return;
                    }
                    _mailMessage(context);
                  }
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Email validate",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _mailMessage(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return const Text(
            'Email enviado confira o link recebido para mudar email.',
            style: TextStyle(fontSize: 30),
          );
        });
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
