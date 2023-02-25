import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notivate/services/note_service.dart';

import 'screens/home.dart';
import 'screens/note.dart';

class App extends StatelessWidget {
  final NoteService noteService;

  const App({
    super.key,
    required this.noteService,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Notivate',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: GoRouter(
        initialLocation: '/',
        routes: <RouteBase>[
          GoRoute(
            path: '/',
            builder: (BuildContext context, GoRouterState state) {
              return HomeScreen(
                title: "Feed",
                noteService: noteService,
              );
            },
          ),
          GoRoute(
            path: '/note/:id',
            builder: (BuildContext context, GoRouterState state) {
              String? noteId = state.params['id'];

              return NoteScreen(
                noteId: noteId!,
                noteService: noteService,
              );
            },
          ),
        ],
      ),
      debugShowCheckedModeBanner: true,
    );
  }
}
