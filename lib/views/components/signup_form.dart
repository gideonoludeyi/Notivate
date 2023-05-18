import 'package:flutter/material.dart';
import 'package:notivate/views/components/button.dart';
import 'package:notivate/views/components/email_field.dart';
import 'package:notivate/views/components/password_field.dart';

typedef SignUpCallback = void Function({
  required String email,
  required String password,
});

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key, required this.onSignUp}) : super(key: key);

  final SignUpCallback onSignUp;

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
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
        Button(text: "Sign Up", onTap: _triggerSignUp),
      ],
    );
  }

  void _triggerSignUp() {
    widget.onSignUp(
      email: emailFieldController.value.text,
      password: passwordFieldController.value.text,
    );
  }
}
