import 'package:flutter/material.dart';
import 'package:notivate/views/components/button.dart';
import 'package:notivate/views/components/email_field.dart';
import 'package:notivate/views/components/password_field.dart';

typedef LoginCallback = void Function({
  required String email,
  required String password,
});

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key, required this.onLogin}) : super(key: key);

  final LoginCallback onLogin;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late TextEditingController emailFieldController;
  late TextEditingController passwordFieldController;

  @override
  void initState() {
    super.initState();
    emailFieldController = TextEditingController(text: "");
    passwordFieldController = TextEditingController(text: "");
  }

  @override
  void dispose() {
    passwordFieldController.dispose();
    emailFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        EmailField(controller: emailFieldController),
        PasswordField(controller: passwordFieldController),
        Button(text: "Login", onTap: _triggerLogin),
      ],
    );
  }

  void _triggerLogin() {
    widget.onLogin(
      email: emailFieldController.value.text,
      password: passwordFieldController.value.text,
    );
  }
}
