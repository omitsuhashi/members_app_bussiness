import 'package:base/components/organisms/auth_form.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<StatefulWidget> createState() => SigninState();
}

class SigninState extends State<SigninPage> {
  final auth = FirebaseAuth.instance;

  onPressSigninButton(String email, String password) {
    print(email);
    print(password);
    try {
      auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(e.message ?? "サインインできませんでした")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AuthFormWidget(
      onPressSubmit: onPressSigninButton,
      authType: AuthType.signin,
    );
  }
}
