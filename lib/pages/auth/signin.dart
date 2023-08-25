import 'package:base/components/organisms/auth_form.dart';
import 'package:flutter/material.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<StatefulWidget> createState() => SigninState();
}

class SigninState extends State<SigninPage> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  onPressSigninButton() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("..サインイン中")));
      print(emailController.text);
      print(passwordController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AuthFormWidget(
      onPressSubmit: onPressSigninButton,
      submitButtonText: "サインイン",
    );
  }
}
