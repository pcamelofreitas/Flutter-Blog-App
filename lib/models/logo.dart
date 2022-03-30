import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(100),
        ),
        color: Colors.white,
        border: Border.all(
          width: 8.0,
          color: Colors.black,
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black38,
            offset: Offset(5, 10.0),
            blurRadius: 10,
            spreadRadius: 1,
          )
        ],
      ),
      child: const Center(
        child: Text(
          'Blog \n  App',
          style: TextStyle(
              fontSize: 50,
              fontFamily: 'Times New Roman',
              fontWeight: FontWeight.bold,
              color: Colors.green),
        ),
      ),
    );
  }
}
