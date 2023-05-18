import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notivate/services/authentication_service.dart';
import 'package:notivate/views/components/button.dart';
import 'package:notivate/views/components/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key, required this.authService}) : super(key: key);

  final AuthenticationService authService;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          LoginForm(onLogin: _handleOnLogin),
          const SizedBox(height: 16),
          Button(text: "Go to sign up", onTap: () => _navigateToSignUp(context))
        ],
      ),
    );
  }

  void _navigateToSignUp(BuildContext context) => context.go("/auth/signup");

  void _handleOnLogin({required email, required password}) {
    authService.loginWithEmailAndPassword(email, password);
  }
}
