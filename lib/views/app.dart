import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notivate/services/authentication_service.dart';
import 'package:notivate/services/note_service.dart';
import 'package:notivate/views/screens/feed.dart';
import 'package:notivate/views/screens/login.dart';
import 'package:notivate/views/screens/signup.dart';

class App extends StatelessWidget {
  const App({
    super.key,
    required this.authService,
    required this.noteService,
  });

  final AuthenticationService authService;
  final NoteService noteService;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<AuthState?>(
      initialData: null,
      stream: authService.state$,
      builder: (context, snapshot) => MaterialApp.router(
        title: "Notivate",
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: true,
        routerConfig: _router(snapshot.data),
      ),
    );
  }

  GoRouter _router(AuthState? authState) => GoRouter(
        initialLocation: "/",
        routes: [
          GoRoute(
            path: "/",
            redirect: (context, state) =>
                authState == null ? "/auth/login" : "/feed",
          ),
          GoRoute(
            path: "/feed",
            redirect: (context, state) => authState == null ? "/" : null,
            builder: (context, state) => FeedScreen(
              authService: authService,
              noteService: noteService,
            ),
          ),
          GoRoute(
            path: "/auth/login",
            redirect: (context, state) => authState == null ? null : "/",
            builder: (context, state) => LoginScreen(authService: authService),
          ),
          GoRoute(
            path: "/auth/signup",
            redirect: (context, state) => authState == null ? null : "/",
            builder: (context, state) => SignUpScreen(authService: authService),
          ),
        ],
      );
}
