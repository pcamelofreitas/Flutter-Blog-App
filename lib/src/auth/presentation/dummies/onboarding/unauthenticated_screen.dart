import 'package:blog_app_2/models/logo.dart';
import 'package:blog_app_2/src/auth/auth_providers.dart';
import 'package:blog_app_2/src/auth/domain/usecases/onboarding/onboarding_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UnauthenticatedScreen extends ConsumerWidget {
  const UnauthenticatedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final OnboardingUsecase usecase =
        ref.read(AuthProviders.onboardingUsecaseProvider.notifier);
    final OnboardingState state =
        ref.watch(AuthProviders.onboardingUsecaseProvider);

    //
    return Scaffold(
      body: Column(
        children: [
          const AppLogo(),
          const SizedBox(
            height: 20,
          ),

          // Form(
          //   key: _formKey,
          //   child: Column(
          //     children: <Widget>[
          //       Container(
          //         decoration: BoxDecoration(
          //           color: Colors.white,
          //           border: Border.all(
          //             width: 1.0,
          //             color: Colors.black54,
          //           ),
          //           boxShadow: const [
          //             BoxShadow(
          //               color: Colors.black38,
          //               offset: Offset(1, 1.0),
          //               blurRadius: 5,
          //               spreadRadius: 1,
          //             )
          //           ],
          //           borderRadius: const BorderRadius.all(
          //             Radius.circular(125),
          //           ),
          //         ),
          //         child: Padding(
          //           padding: const EdgeInsets.only(left: 25, right: 25),
          //           child: TextFormField(
          //             keyboardType: TextInputType.emailAddress,
          //             controller: _controller,
          //             decoration: InputDecoration(
          //               labelText: "Email",
          //               labelStyle: TextStyle(
          //                 color: Theme.of(context).primaryColor,
          //                 fontSize: 16,
          //                 fontWeight: FontWeight.w400,
          //               ),
          //             ),
          //             style: const TextStyle(
          //               fontSize: 20,
          //             ),
          //             validator: (value) {
          //               if (value!.isEmpty) {
          //                 return 'Entre com seu endereço de email para continuar';
          //               }
          //               return null;
          //             },
          //           ),
          //         ),
          //       ),
          //       Padding(
          //         padding: const EdgeInsets.only(top: 15),
          //         child: Container(
          //           decoration: BoxDecoration(
          //             color: Colors.white,
          //             border: Border.all(
          //               width: 1.0,
          //               color: Colors.black54,
          //             ),
          //             boxShadow: const [
          //               BoxShadow(
          //                 color: Colors.black26,
          //                 offset: Offset(1, 2.0),
          //                 blurRadius: 5,
          //                 spreadRadius: 2,
          //               ),
          //             ],
          //             borderRadius: const BorderRadius.all(
          //               Radius.circular(125),
          //             ),
          //           ),
          //           child: TextButton(
          //             child: const Text('Seguir'),
          //             onPressed: () async {
          //               if (_formKey.currentState!.validate()) {
          //                 widget.callback(_controller.text);
          //               }
          //             },
          //           ),
          //         ),
          //       )
          //     ],
          //   ),
          // ),
          Container(
            height: 60,
            width: 250,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(1, 2.0),
                  blurRadius: 5,
                  spreadRadius: 1,
                )
              ],
              border: Border.all(
                width: 1.0,
                color: Colors.black54,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Image.asset(
                //   'assets/google.png',
                //   height: 30,
                // ),
                TextButton(
                  child: const Text("Sign In with Email"),
                  onPressed: usecase.onClickOnSignInWithEmail,
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
              top: 15,
              bottom: 15,
            ),
            child: const Text(
              "- OR -",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          //SIGN_IN_WITH_GOOGLE \/
          Container(
            height: 60,
            width: 250,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(1, 2.0),
                  blurRadius: 5,
                  spreadRadius: 1,
                )
              ],
              border: Border.all(
                width: 1.0,
                color: Colors.black54,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/google.png',
                  height: 30,
                ),
                TextButton(
                  child: const Text("Sign In with google"),
                  onPressed: usecase.onClickSignInWithGoogle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
