import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notivate/services/authentication_service.dart';
import 'package:notivate/views/components/button.dart';
import 'package:notivate/views/components/signup_form.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key, required this.authService}) : super(key: key);

  final AuthenticationService authService;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SignUpForm(onSignUp: _handleOnSignUp),
          const SizedBox(height: 16),
          Button(text: "Go to sign up", onTap: () => _navigateToLogin(context))
        ],
      ),
    );
  }

  void _navigateToLogin(BuildContext context) => context.go("/auth/login");

  void _handleOnSignUp({required email, required password}) {
    authService.signUpWithEmailAndPassword(email, password);
  }
}
