import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mynotes/views/loginView.dart';
import 'package:mynotes/views/registerView.dart';

import 'firebase_options.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const homePage(),
      routes: {
        '/login/': (context) => const loginPage(),
        '/register/': (context) => const RegisterPage(),
      },
    ),
  );
}

class homePage extends StatelessWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              // final user = FirebaseAuth.instance.currentUser;
              // if (user?.emailVerified ?? false) {
              //   // print("you are a verified user");
              //   return const Text("Done");
              // } else {
              //   // print("you need to verify your email");
              //   return VerifyEmailView();
              // }
              return loginPage();
            default:
              return const CircularProgressIndicator();
          }
        },
    );
  }
}

