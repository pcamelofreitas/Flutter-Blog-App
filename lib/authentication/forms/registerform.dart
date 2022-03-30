import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:path/path.dart';

import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class RegisterForm extends StatefulWidget {
  final String email;
  final void Function(
    String email,
    String displayName,
    String password,
    String imageUrl,
  ) registerAccount;
  final void Function() cancel;

  const RegisterForm({
    required this.email,
    required this.cancel,
    required this.registerAccount,
  });

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  //definir estados e controladores
  final _formKey = GlobalKey<FormState>(debugLabel: "_RegisterFormState");
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _displayNameController = TextEditingController();

  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  File? _photo;
  final ImagePicker _picker = ImagePicker();
  String photoURL = "";
  //
  Future imgFromCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    setState(
      () {
        if (pickedFile != null) {
          _photo = File(pickedFile.path);
          uploadFile();
        } else {
          print("error image from camera");
        }
      },
    );
  }

  Future uploadFile() async {
    if (_photo != null) {
      final fileName = basename(_photo!.path);

      firebase_storage.Reference firebaseStorageRef = firebase_storage
          .FirebaseStorage.instance
          .ref()
          .child('uploads/$fileName');
      firebase_storage.UploadTask uploadTask =
          firebaseStorageRef.putFile(_photo!);
      firebase_storage.TaskSnapshot taskSnapshot = await uploadTask;
      taskSnapshot.ref.getDownloadURL().then((value) => photoURL = value);
    }
  }

  @override
  void initState() {
    super.initState();
    _emailController.text = widget.email;
  }

  //renderizar
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  _showPicker(context);
                },
                child: CircleAvatar(
                  radius: 100,
                  backgroundColor: Colors.green,
                  child: _photo != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.file(
                            _photo!,
                            width: 200,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        )
                      : Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(100)),
                              width: 200,
                              height: 200,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.camera_alt,
                                    color: Colors.grey[800],
                                  ),
                                  const Text("image is required"),
                                ],
                              ),
                            ),
                          ],
                        ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(125),
                  ),
                  border: Border.all(
                    width: 1.0,
                    color: Colors.black,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(1, 2.0),
                      blurRadius: 5,
                      spreadRadius: 1,
                    )
                  ]),
              child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: "Email",
                    labelStyle: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter your email';
                    }
                    return null;
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(125),
                  ),
                  border: Border.all(width: 1, color: Colors.black),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(1, 2.0),
                      blurRadius: 5,
                      spreadRadius: 1,
                    )
                  ]),
              child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: TextFormField(
                  controller: _displayNameController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Name",
                    labelStyle: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter your display name";
                    }
                    return null;
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(125),
                  ),
                  border: Border.all(width: 1, color: Colors.black),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(1, 2.0),
                      blurRadius: 5,
                      spreadRadius: 1,
                    )
                  ]),
              child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                  controller: _passwordController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'enter your password';
                    }
                    return null;
                  },
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: TextButton(
                    onPressed: widget.cancel,
                    child: const Text(
                      "cancel",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              width: 200,
              height: 50,
              // color: Theme.of(context).primaryColo
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(
                  Radius.circular(125),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(1, 5.0),
                    blurRadius: 5,
                    spreadRadius: 1,
                  )
                ],
              ),
              child: TextButton(
                onPressed: () {
                  if (_formKey.currentState!.validate() && _photo != null) {
                    widget.registerAccount(
                      _emailController.text,
                      _displayNameController.text,
                      _passwordController.text,
                      photoURL,
                    );
                  }
                },
                child: const Text(
                  'Signup',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _showErrorDialog(
    BuildContext context,
  ) {
    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'error',
            style: const TextStyle(fontSize: 24),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  'error on upload image',
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

  void _showPicker(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Camera'),
                onTap: () {
                  imgFromCamera();
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
