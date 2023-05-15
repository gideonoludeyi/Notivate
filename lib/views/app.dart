import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notivate/views/screens/home.dart';
import 'package:notivate/views/screens/login.dart';
import 'package:notivate/views/screens/signup.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Notivate",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: true,
      routerConfig: _router,
    );
  }

  final _router = GoRouter(
    initialLocation: "/",
    routes: [
      GoRoute(
        path: "/",
        redirect: (context, state) => "/feed",
      ),
      GoRoute(
        path: "/feed",
        builder: (context, state) => const HomeScreen(title: "Feed"),
      ),
      GoRoute(
        path: "/auth/login",
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: "/auth/signup",
        builder: (context, state) => const SignUpScreen(),
      ),
    ],
  );
}
