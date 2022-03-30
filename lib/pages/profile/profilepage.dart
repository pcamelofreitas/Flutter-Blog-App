import 'package:blog_app_2/pages/profile/editemail.dart';
import 'package:blog_app_2/pages/profile/editname.dart';
import 'package:blog_app_2/pages/profile/editpassword.dart';
import 'package:blog_app_2/pages/profile/editphoto.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({
    Key? key,
    required this.image,
    required this.email,
    required this.name,
  }) : super(key: key);
  final String image;
  final String name;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      backgroundColor: Colors.green,
      body: ListView(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EditPhotoPage(),
                    ),
                  );
                },
                child: Container(
                  height: 250,
                  width: 250,
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(1, 1),
                        blurRadius: 5,
                        spreadRadius: 2,
                      ),
                    ],
                    border: Border.all(width: 10, color: Colors.black),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(125),
                    ),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(image),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 50,
            padding: EdgeInsets.only(left: 30, right: 30),
            decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.circular(100)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name,
                  style: const TextStyle(fontSize: 30, color: Colors.white),
                ),
                IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const EditNamePage(),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.edit,
                      color: Colors.white,
                    ))
              ],
            ),
          ),
          const SizedBox(height: 30),
          Container(
            height: 50,
            padding: EdgeInsets.only(left: 30, right: 30),
            decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.circular(100)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  email,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const EditEmailPage(),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.edit,
                      color: Colors.white,
                    ))
              ],
            ),
          ),
          const SizedBox(height: 30),
          Center(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(100)),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EditPassPage(),
                    ),
                  );
                },
                child: const Text(
                  "Mudar Senha",
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
