import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:developer' as devtools show log;

import 'package:mynotes/constants/routes.dart';

import '../utilities/showErrors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Column(
        children: [
          TextField(
            controller: _email,
            keyboardType: TextInputType.emailAddress,
            enableSuggestions: false,
            autocorrect: false,
            decoration: const InputDecoration(
              hintText: "Email",
            ),
          ),
          TextField(
            controller: _password,
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            decoration: const InputDecoration(
              hintText: "password",
            ),
          ),
          TextButton(
            onPressed: () async {
              final email = _email.text;
              final password = _password.text;
              try {
                final userCredential = await FirebaseAuth.instance
                    .signInWithEmailAndPassword(
                        email: email, password: password);
                devtools.log(userCredential.toString());
               final user = FirebaseAuth.instance.currentUser;
              if (user?.emailVerified ?? false) {
                //user is verified
                Navigator.of(context).pushNamedAndRemoveUntil(
                  notesRoute,
                  (route) => false,
                );
              } else {
                //user not verified
                Navigator.of(context).pushNamedAndRemoveUntil(
                  verifyEmailRoute,
                  (route) => false,
                );
              }
              } on FirebaseAuthException catch (e) {
                if (e.code == 'user-not-found') {
                  devtools.log('User not found');
                  await showErrorDialog(context, 'User not Found');
                } else if (e.code == 'wrong-password') {
                  devtools.log('Wrong password');
                  await showErrorDialog(context, 'Wrong password');
                }else {
                   await showErrorDialog(context, 'Error: ${e.code}',);
                }
              } catch (e) {
                 await showErrorDialog(context, e.toString(),);
              }
            },
            child: const Text("Login"),
          ),
          TextButton(
            onPressed: (() {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(registerRoute, (route) => false);
            }),
            child: const Text('Not registered yet? Register here!'),
          ),
         
        ],
      ),
    );
  }
}

