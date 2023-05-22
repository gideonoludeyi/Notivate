import 'package:flutter/material.dart';
import 'package:notivate/models/note.dart';
import 'package:notivate/services/authentication_service.dart';
import 'package:notivate/services/note_service.dart';
import 'package:notivate/views/components/note_feed_list.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({
    super.key,
    required this.authService,
    required this.noteService,
  });

  final AuthenticationService authService;
  final NoteService noteService;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Feed"),
        actions: [
          TextButton(
            onPressed: authService.logout,
            child: const Text(
              "Logout",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: StreamBuilder<List<Note>>(
          initialData: const <Note>[],
          stream: noteService.notes$,
          builder: (context, snapshot) {
            return NoteFeedList(
              notes: snapshot.data ?? const [],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Write',
        child: const Icon(Icons.edit_outlined),
      ),
    );
  }
}
