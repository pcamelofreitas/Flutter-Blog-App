import 'dart:async';

import 'package:blog_app_2/controller/pagescontroller.dart';
import 'package:blog_app_2/firebase_options.dart';
import 'package:blog_app_2/models/loginstate.dart';
import 'package:blog_app_2/models/postitem.dart';
import 'package:blog_app_2/pages/emailvalidate.dart';
import 'package:blog_app_2/pages/profile/profilepage.dart';
import 'package:blog_app_2/pages/restrictpage.dart';
import 'package:blog_app_2/widgets/postlist.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ApplicationState(),
    builder: (context, _) => const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: Consumer<ApplicationState>(
            builder: (context, appState, _) =>
                PagesController(loginState: appState.loginState))

        // const HomePage(
        //   accountPhotoUrl: 'https://picsum.photos/200',
        //   accountEmail: 'example@email.com',
        //   accountName: 'example',
        // ),
        );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
    required this.accountName,
    required this.accountEmail,
    required this.accountPhotoUrl,
  }) : super(key: key);

  final String? accountName;
  final String? accountEmail;
  final String? accountPhotoUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BlogApp',
          style: const TextStyle(color: Colors.white),
        ),
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 350,
                child: UserAccountsDrawerHeader(
                  currentAccountPictureSize: const Size.square(200),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(accountPhotoUrl != null
                        ? accountPhotoUrl!
                        : 'https://eitrawmaterials.eu/wp-content/uploads/2016/09/person-icon.png'),
                  ),
                  accountName: Text(
                    accountName != null ? accountName! : 'example',
                    style: const TextStyle(fontSize: 30),
                  ),
                  accountEmail: Text(
                    accountEmail!,
                  ),
                ),
              ),
              Consumer<ApplicationState>(
                builder: (context, appState, _) => ListTile(
                  leading: Icon(Icons.person),
                  title: Text('Meu Perfil'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfilePage(
                          image: appState.userImage!,
                          email: appState.userEmail!,
                          name: appState.userName!,
                        ),
                      ),
                    );
                  },
                ),
              ),
              if (FirebaseAuth.instance.currentUser!.emailVerified == false)
                ListTile(
                  leading: const Icon(Icons.mail),
                  title: const Text('Verificar Email'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ValidateEmailPage(),
                      ),
                    );
                  },
                ),
              Consumer<ApplicationState>(
                builder: (context, appState, _) => ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text('Sair'),
                  onTap: () {
                    appState.signOut();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(
        children: [
          Consumer<ApplicationState>(
            builder: (context, appState, _) =>
                PostList(posts: appState.homePosts),
          ),
          RestrictedPage(),
        ],
      ),
      bottomNavigationBar: TabBar(
        tabs: const [
          Tab(
            icon: Icon(Icons.home),
          ),
          Tab(
            icon: Icon(Icons.lock),
          ),
        ],
        labelColor: Theme.of(context).primaryColor,
        unselectedLabelColor: Colors.black38,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorPadding: const EdgeInsets.all(5),
        indicatorColor: Theme.of(context).primaryColor,
      ),
    );
  }
}

class ApplicationState extends ChangeNotifier {
  ApplicationState() {
    init();
  }
  Future<void> init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    FirebaseAuth.instance.userChanges().listen(
      (user) {
        if (user != null) {
          _loginState = ApplicationLoginState.loggedIn;

          _userName = FirebaseAuth.instance.currentUser!.displayName;
          _userEmail = FirebaseAuth.instance.currentUser!.email;
          _userImage = FirebaseAuth.instance.currentUser!.photoURL;

          _homePostSubscription =
              FirebaseFirestore.instance.collection('home').snapshots().listen(
            (snapshot) {
              _homePosts = [];
              for (final document in snapshot.docs) {
                _homePosts.add(
                  PostItem(
                    title: document.data()['title'] as String,
                    image: document.data()['image'] as String,
                    content: document.data()['content'] as String,
                  ),
                );
              }
              notifyListeners();
            },
          );
          if (user.emailVerified) {
            _restrictedPostSubscription = FirebaseFirestore.instance
                .collection('restrito')
                .snapshots()
                .listen(
              (snapshot) {
                _restrictedPosts = [];
                for (final document in snapshot.docs) {
                  _restrictedPosts.add(
                    PostItem(
                      title: document.data()['title'] as String,
                      image: document.data()['image'] as String,
                      content: document.data()['content'] as String,
                    ),
                  );
                }
                notifyListeners();
              },
            );
          }
        } else {
          _loginState = ApplicationLoginState.loggedOut;
          _homePosts = [];
          _restrictedPosts = [];
          _homePostSubscription?.cancel();
          _restrictedPostSubscription?.cancel();
          _userName = 'example ';
          _userEmail = 'example';
          _userImage = 'example';
        }
      },
    );
  }

  String? _userName = 'example ';
  String? get userName => _userName;
  String? _userEmail = 'example';
  String? get userEmail => _userEmail;
  String? _userImage = 'example';
  String? get userImage => _userImage;

  ApplicationLoginState _loginState = ApplicationLoginState.loggedOut;
  ApplicationLoginState get loginState => _loginState;

  StreamSubscription<QuerySnapshot>? _homePostSubscription;
  List<PostItem> _homePosts = [];
  List<PostItem> get homePosts => _homePosts;

  StreamSubscription<QuerySnapshot>? _restrictedPostSubscription;
  List<PostItem> _restrictedPosts = [];
  List<PostItem> get restrictedPosts => _restrictedPosts;

  String? _email;
  String? get email => _email;

  void startLoginFlow() {
    _loginState = ApplicationLoginState.emailAddress;
    notifyListeners();
  }

  Future<void> verifyEmail(
    String email,
    void Function(FirebaseAuthException e) errorCallback,
  ) async {
    try {
      var methods =
          await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
      if (methods.contains('password')) {
        _loginState = ApplicationLoginState.password;
      } else {
        _loginState = ApplicationLoginState.register;
      }
      _email = email;
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      errorCallback(e);
    }
  }

  Future<void> signInWithEmailAndPassword(
    String email,
    String password,
    void Function(FirebaseAuthException e) errorCallback,
  ) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      errorCallback(e);
    }
  }

  //google implementation
  Future<void> singInWithGoogle({required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential =
            await auth.signInWithCredential(credential);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          ScaffoldMessenger.of(context).showSnackBar(
            customSnackBar(
              content: 'The account already exists with a different credential',
            ),
          );
        } else if (e.code == 'invalid-credential') {
          ScaffoldMessenger.of(context).showSnackBar(
            customSnackBar(
              content: 'Error occurred while accessing credentials. Try again.',
            ),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          customSnackBar(
            content: 'Error occurred using Google Sign In. Try again.',
          ),
        );
      }
    }
  }

  void cancelRegistration() {
    _loginState = ApplicationLoginState.emailAddress;
    notifyListeners();
  }
  // void updatePhoto()  {
  //   FirebaseAuth.instance.currentUser!.updatePhotoURL(_photoURL);
  // notifyListners();
  // }

  Future<void> registerAccount(
    String email,
    String displayName,
    String password,
    String photoURL, // pegar url da imagem
    void Function(FirebaseAuthException e) errorCallback,
  ) async {
    try {
      var credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await credential.user!.updateDisplayName(displayName);
      credential.user!.updatePhotoURL(photoURL);
    } on FirebaseAuthException catch (e) {
      errorCallback(e);
    }
  }

  void signOut() {
    FirebaseAuth.instance.signOut();
    notifyListeners();
  }
}

SnackBar customSnackBar({required String content}) {
  return SnackBar(
    backgroundColor: Colors.black,
    content: Text(
      content,
      style: TextStyle(color: Colors.redAccent, letterSpacing: 0.5),
    ),
  );
}
